from django.db import models
from django.core.validators import *

# Create your models here.

# id = int, auto-increment, primary-key
# Title = varchar(200)
# Content = Text
# Category = varchar(100)
# created_date = timestamp
# updated_date = timestamp
# status = varchar(200) [publish,draft,thrash]


# class status_choice(Enum):
#     P = "PUBLISH"
#     D = "DRAFT"
#     T = "THRASH"

STATUSCHOICE = (
    ('PUBLISH', 'PUBLISH'),
    ('DRAFT', 'DRAFT'),
    ('THRASH', 'THRASH')
)

my_default_errors = {
    'required': 'This field is required',
    'invalid': 'Enter a valid value'
}

class Posts(models.Model):
    Id = models.AutoField(primary_key=True)
    Title = models.CharField(max_length=200, blank=False, validators=[MinLengthValidator(20)],error_messages=my_default_errors)
    Content = models.TextField(blank=False, validators=[MinLengthValidator(200)],error_messages=my_default_errors)
    Category = models.CharField(max_length=100, blank=False, validators=[MinLengthValidator(3)],error_messages=my_default_errors)
    Created_date = models.DateTimeField(auto_now_add=True)
    Updated_date = models.DateTimeField(auto_now=True)
    # Status = models.CharField(max_length=100, choices=[
    #                           (x, x.value) for x in status_choice])
    Status = models.CharField(
        max_length=100, choices=STATUSCHOICE, blank=False,error_messages=my_default_errors)