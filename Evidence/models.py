from django.db import models
from django.utils.timezone import now


class User(models.Model):
    id = models.IntegerField(primary_key=True)
    department_id = models.IntegerField()
    name = models.CharField(max_length=50)
    email = models.EmailField(max_length=50, unique=True)
    password = models.CharField(max_length=50)
    reset_token = models.CharField(max_length=100, blank=True, null=True, default=None)
    mobile = models.CharField(max_length=10)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        db_table = "users"


class Department(models.Model):
    department_id = models.IntegerField(primary_key=True)
    department_name = models.CharField(max_length=200)

    class Meta:
        db_table = "department"


class Evidence(models.Model):
    id = models.IntegerField(primary_key=True)
    from_user_id = models.IntegerField()
    to_user_id = models.IntegerField()
    system_filename = models.CharField(max_length=200)
    uploaded_filename = models.CharField(max_length=200)
    created_at = models.DateTimeField()

    class Meta:
        db_table = "evidence"
