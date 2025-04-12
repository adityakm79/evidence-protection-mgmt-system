from django.shortcuts import render, redirect
from django.http import FileResponse
from .models import User, Department, Evidence
from datetime import datetime
from django.conf import settings
from .helpers import *
from django.http import JsonResponse
import os
import re
import time
from django.utils.crypto import get_random_string

sendgrid_api_key = settings.SENDGRID_API_KEY
from_email = settings.FROM_EMAIL


def send_email(request):
    evidenceId = 0
    time.sleep(2)
    response = {"message": "Invalid request", "success": False}
    if request.method == "POST":
        evidenceId = request.POST["evidenceid"]
        status = sendOtpMail(request, evidenceId)
        if status:
            response = {"message": "Email sent successfully!", "success": True}

    return JsonResponse(response)


def check_otp_in_session(request):
    if request.method == "POST":
        inputOtpText = request.POST["inputOtpText"]
        evidenceId = request.session["evidenceid"]
        verification_code = request.session["verification_code"]

    if verification_code and inputOtpText == str(verification_code):

        uniqueid = random.randint(10000, 99999)
        request.session["uniqueid"] = uniqueid

        downloadLink = "/download?uniqueid=" + str(uniqueid) + "&eid=" + str(evidenceId)

        return JsonResponse(
            {"message": "OTP Matched", "success": True, "downloadLink": downloadLink}
        )
    else:
        return JsonResponse({"message": "OTP Mismatched", "success": False})


def signup(request):
    if isLoggedIn(request):
        return redirect("/welcome")

    if request.method == "POST":

        email = request.POST.get("email")
        if User.objects.filter(email=email).exists():
            return redirect("/signup?msg=This email is already in use.")

        email_regex = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
        if not re.match(email_regex, email):
            return redirect("/signup?msg=Invalid email format")

        User.objects.create(
            name=request.POST["name"],
            email=request.POST["email"],
            password=request.POST["password"],
            mobile=request.POST["number"],
            department_id=request.POST["department_id"],
            created_at=datetime.today(),
            updated_at=datetime.today(),
        )
        return redirect(
            "/signup?msg=SignUp completed and details are saved to blockchain"
        )
    msg = ""
    if "msg" in request.GET:
        msg = request.GET["msg"]
    d = Department.objects.values()
    data = {"msg": msg, "department": d}
    return render(request, "signup.html", data)


def login(request):

    if isLoggedIn(request):
        return redirect("/")

    if request.method == "POST":
        # print(int(request.POST['department_id']))
        row = User.objects.filter(
            email=request.POST["email"],
            password=request.POST["password"],
            department_id=int(request.POST["department_id"]),
        ).first()

        if row:
            print(row.id)
            request.session["id"] = row.id
            request.session["name"] = row.name
            request.session["email"] = row.email
            ## save or set the data in session
            return redirect("/")
        else:
            return redirect("/login?msg=Email or password incorrect")

    msg = ""
    if "msg" in request.GET:
        msg = request.GET["msg"]
    d = Department.objects.values()
    data = {"msg": msg, "department": d}
    return render(request, "login.html", data)


def forgot_password(request):
    if request.method == "POST":
        email = request.POST["email"]
        user = User.objects.filter(email=email).first()

        if user:
            token = get_random_string(30)
            user.reset_token = token
            user.save()

            reset_link = request.build_absolute_uri(f"/reset_password/{token}")

            subject = "Password Reset Request"

            body = f"""
            <html>
            <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;">
                <div style="max-width: 600px; margin: auto; background-color: #ffffff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
                
                    <h2 style="color: #333;">Dear {user.name},</h2>
                    <p style="font-size: 16px; color: #555;">
                        We received a request to reset your password. Click the button below to reset it:
                    </p>
                    
                    <div style="text-align: center; margin: 30px 0;">
                        <a href="{reset_link}" style="background-color: #007BFF; color: #ffffff; padding: 12px 24px; text-decoration: none; border-radius: 5px; font-size: 16px;">Reset Password</a>
                    </div>

                    <p style="font-size: 14px; color: #777;">
                        Or copy and paste the following link into your browser:<br>
                        <a href="{reset_link}" style="color: #007BFF;">{reset_link}</a>
                    </p>

                    <hr style="margin: 30px 0; border: none; border-top: 1px solid #eee;" />
                    <p style="font-size: 12px; color: #999; text-align: center;">
                        If you didn’t request this, you can safely ignore this email.<br>
                        &copy; {datetime.now().year} Evidence Protection Management System
                    </p>
                </div>
            </body>
            </html>
            """

            sendEmail(user.email, subject, body)

            return redirect("/login?msg=Check your email for reset link")
        else:
            return render(request, "forgot_password.html", {"msg": "Email not found"})

    return render(request, "forgot_password.html")


def reset_password(request, token):
    if request.method == "POST":
        password1 = request.POST.get("password1")
        password2 = request.POST.get("password2")

        if password1 != password2:
            return render(
                request, "reset_password.html", {"msg": "Passwords do not match"}
            )

        user = User.objects.filter(reset_token=token).first()
        if user:
            user.password = password1
            user.reset_token = ""
            user.save()
            return redirect("/login?msg=Password reset successful")
        else:
            return render(
                request, "reset_password.html", {"msg": "Invalid or expired link"}
            )

    return render(request, "reset_password.html")


def welcome(request):
    ## get the data from session and use to show name in welcome.html
    if "id" in request.session and request.session["id"] > 0:
        data = {"name": request.session["name"]}
        return render(request, "welcome.html", data)
    else:
        return redirect("/login?msg=Please login to view welcome page")


def addInformation(request):

    if isLoggedIn(request):
        msg = ""
        if "msg" in request.GET:
            msg = request.GET["msg"]

        if request.method == "POST":
            # print(settings.UPLOAD_DIR)
            if request.FILES and request.FILES["upload"]:
                user = User.objects.filter(
                    department_id=int(request.POST["department_id"]),
                    email=request.POST["email"],
                ).first()

                if user:
                    f = request.FILES["upload"]
                    extesion = os.path.splitext(str(f))[1]
                    system_filename = (
                        "evidence_"
                        + str(datetime.today().strftime("%Y%m%d_%H%M%S_%f"))
                        + extesion
                    )
                    # print(unique_name)

                    uploaded_filename = f.name
                    if not os.path.exists(settings.UPLOAD_DIR):
                        os.makedirs(settings.UPLOAD_DIR)

                    target_path = str(settings.UPLOAD_DIR) + "/" + system_filename
                    # print(target_path)
                    with open(target_path, "wb+") as destination:
                        for chunk in f.chunks():
                            destination.write(chunk)

                    to_user_id = user.id

                    Evidence.objects.create(
                        from_user_id=request.session["id"],
                        to_user_id=to_user_id,
                        system_filename=system_filename,
                        uploaded_filename=uploaded_filename,
                        created_at=datetime.today(),
                    )

                    return redirect("/add_information?msg=Evidence saved in blockchain")

                else:
                    msg = "Please enter a valid user email"
            else:
                msg = "Please upload a file"

        d = Department.objects.values()
        data = {"name": request.session["name"], "department": d, "msg": msg}
        return render(request, "add_information.html", data)
    else:
        return redirect("/login?msg=Please login to add information")


def logout(request):
    if "id" in request.session and request.session["id"] > 0:
        del request.session["id"]
        del request.session["name"]
        del request.session["email"]
    return redirect("/login")


def checkInformation(request):
    if isLoggedIn(request):

        query = "SELECT e.*, u.name, d.department_name"
        query += " FROM evidence as e"
        query += " INNER JOIN users as u ON e.from_user_id = u.id"
        query += " INNER JOIN department as d ON u.department_id = d.department_id"
        query += " where e.to_user_id = " + str(request.session["id"])
        # print(query)
        i = Evidence.objects.raw(query)
        # print(i)
        data = {"information": i}
        return render(request, "check_information.html", data)
    else:
        return redirect("/login?msg=Please login to check information")


def download(request):
    if isLoggedIn(request):

        eid = 0
        uniqueid = ""
        if "eid" in request.GET:
            eid = int(request.GET["eid"])

        if "uniqueid" in request.GET:
            uniqueid = int(request.GET["uniqueid"])

        if eid > 0 and uniqueid == request.session["uniqueid"]:
            row = Evidence.objects.filter(
                id=eid, to_user_id=request.session["id"]
            ).first()
            if row:
                system_filename = row.system_filename
                uploaded_name = row.uploaded_filename

                file_path = os.path.join(settings.UPLOAD_DIR, system_filename)

                if os.path.exists(file_path):
                    del request.session["verification_code"]
                    del request.session["uniqueid"]
                    return FileResponse(
                        open(file_path, "rb"),
                        as_attachment=True,
                        filename=uploaded_name,
                    )
                else:
                    return redirect("/check_information?msg=File not exists !")
            else:
                return redirect("/check_information?msg=Unauthrised access")
        else:
            return redirect("/check_information?msg=File not exists !")
    else:
        return redirect("/login?msg=Please login to check information")


def checkHistory(request):
    if isLoggedIn(request):

        query = "SELECT e.*, u.name, d.department_name"
        query += " FROM evidence as e"
        query += " INNER JOIN users as u ON e.to_user_id = u.id"
        query += " INNER JOIN department as d ON u.department_id = d.department_id"
        query += " where e.from_user_id = " + str(request.session["id"])
        # print(query)
        i = Evidence.objects.raw(query)
        # print(i)
        data = {"information": i}
        return render(request, "check_history.html", data)
    else:
        return redirect("/login?msg=Please login to check history")
