import random
import string
import hashlib
import sendgrid
from sendgrid.helpers.mail import Mail, Email
from django.conf import settings
from datetime import datetime


sendgrid_api_key = settings.SENDGRID_API_KEY
from_email = settings.FROM_EMAIL
from_name = settings.FROM_NAME


def getLoggedinId(request):
    return request.session["id"]


def isLoggedIn(request):
    status = False
    if "id" in request.session and request.session["id"] > 0:
        status = True
    return status


def sendOtpMail(request, evidenceId):
    verification_code = generate_verification_code()
    to_email = request.session["email"]
    user_name = request.session["name"]
    subject = "Download Evidence Request!"
    body = f"""
<html>
  <body style="font-family: Arial, sans-serif; background-color: #f5f5f5; padding: 20px;">
    <div style="max-width: 600px; margin: auto; background-color: #ffffff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); padding: 30px;">
      <h2 style="color: #333;">Dear {user_name},</h2>
      <p style="font-size: 16px; color: #555;">Your verification code is:</p>
      <h1 style="text-align: center; color: #4CAF50; font-size: 36px; margin: 20px 0;">{verification_code}</h1>
      <p style="font-size: 16px; color: #555;">Please use this code to download the evidence securely.</p>
      <hr style="margin: 30px 0; border: none; border-top: 1px solid #eee;" />
       <p style="font-size: 14px; color: #888; text-align: center;">
        If you did not request this code, please ignore this email.<br>
        &copy; {datetime.now().year} Evidence Protection Management System
      </p>
    </div>
  </body>
</html>
"""

    status = sendEmail(to_email, subject, body)
    if status:
        request.session["verification_code"] = verification_code
        request.session["evidenceid"] = evidenceId
    return status


def generate_verification_code():
    """Secure 32-character alphanumeric verification code"""
    random_string = "".join(random.choices(string.ascii_letters + string.digits, k=32))
    hashed_code = hashlib.sha256(random_string.encode()).hexdigest()[:5]
    return hashed_code


def sendEmail(to_emails, subject, body):

    sg = sendgrid.SendGridAPIClient(api_key=sendgrid_api_key)
    email = Mail(
        from_email=Email(from_email, from_name),
        to_emails=to_emails,
        subject=subject,
        html_content=body,
        # plain_text_content=body
    )
    sg.send(email)
    return True
