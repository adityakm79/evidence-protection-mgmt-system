# Generated by Django 5.0.6 on 2025-01-21 14:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Department',
            fields=[
                ('department_id', models.IntegerField(primary_key=True, serialize=False)),
                ('department_name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'department',
            },
        ),
        migrations.CreateModel(
            name='Evidence',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=50)),
                ('mobile', models.CharField(max_length=15)),
                ('created_at', models.DateTimeField()),
                ('updated_at', models.DateTimeField()),
            ],
            options={
                'db_table': 'users',
            },
        ),
    ]
