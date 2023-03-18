from rest_framework import serializers
from .models import *


# class status_choice(Enum):
#     P = "PUBLISH"
#     D = "DRAFT"
#     T = "THRASH"


STATUSCHOICE = (
    ('P', 'PUBLISH'),
    ('D', 'DRAFT'),
    ('T', 'THRASH')
)

class PostsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Posts
        fields = ['Title','Content','Category','Status']


# class PostsSerializer(serializers.Serializer):
#     Title = serializers.CharField(label="Enter Title")
#     Content = serializers.CharField(label="Enter Content")
#     Category = serializers.CharField(label="Enter Category")
#     # Status = serializers.ChoiceField(label="enter Status", choices=[
#     #     (x, x.value) for x in status_choice])
#     Status = serializers.ChoiceField(label="enter Status", choices=STATUSCHOICE)
