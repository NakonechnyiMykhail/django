# Generated by Django 2.2.10 on 2020-03-01 14:38

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='created_date',
            field=models.DateTimeField(default=datetime.datetime(2020, 3, 1, 14, 38, 48, 454569, tzinfo=utc)),
        ),
    ]
