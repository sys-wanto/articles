from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import *
from .serializers import *
import pickle


# Create your views here.
class PostsApiView(APIView):
    serializer_class = PostsSerializer
    def get(self, request):
        allPosts = Posts.objects.values_list('Id','Title', 'Content','Category','Status','Updated_date','Created_date')

        _allPosts = Posts.objects.all()
        _allPosts.query = pickle.loads(pickle.dumps(allPosts.query))

        return Response({
            "is_error": False,
            "data": _allPosts,
            "messages": [
                "success"
            ]
        })

    def post(self, request):
        serializer_obj = PostsSerializer(data=request.data)
        if(serializer_obj.is_valid()):
          is_error = False;
          Posts.objects.create(
              Title=serializer_obj.data['Title'],
              Content=serializer_obj.data['Content'],
              Category=serializer_obj.data['Category'],
              Status=serializer_obj.data['Status']
          )
          msg = ["success"]
        else :
          print(serializer_obj.default_error_messages.items())
          for k, field in serializer_obj.default_error_messages.items():
             print(k)
             print(field)

          is_error = True;
          msg = serializer_obj.default_error_messages.items()
        

        return Response({
            "is_error": is_error,
            "data": request.data,
            "messages": msg
        })
