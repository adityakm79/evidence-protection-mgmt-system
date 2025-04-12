from django.urls import path
from . import views

urlpatterns = [
    path("", views.welcome),
    path("signup", views.signup),
    path("login", views.login),
    path("welcome", views.welcome),
    path("add_information", views.addInformation),
    path("logout", views.logout),
    path("check_information", views.checkInformation),
    path("download", views.download),
    path("check_history", views.checkHistory),
    path("generate_verification_code", views.send_email),
    path("verificationOtp", views.check_otp_in_session),
    path("forgot_password", views.forgot_password),
     path("reset_password/<str:token>", views.reset_password),
]
