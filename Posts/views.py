from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import *
from .serializers import *
import pickle


# Create your views here.
class PostsApiView(APIView):
    serializer_class = PostsSerializer

    def get(self, request, param0, param1=None, *args, **kwargs):
        msg = []
        if (param1 == None):
            posts = Posts.objects.filter(Id=param0).values(
                'Id', 'Title', 'Content', 'Category', 'Status')
            if (posts.exists()):
                is_error = False
                msg.append("Data di temukan.")
                posts = posts.first()
            else:
                is_error = True
                msg.append("Data tidak di temukan.")
                posts = []
        else:
            is_error = True
            msg.append("Data di temukan.")
            posts = Posts.objects.all().values('Id', 'Title', 'Content', 'Category',
                                               'Status').order_by("-Created_date")

        return Response({
            "is_error": is_error,
            "data": posts,
            "messages": msg
        })

    def post(self, request, *args, **kwargs):
        msg = []
        serializer_obj = PostsSerializer(data=request.data)
        if (serializer_obj.is_valid()):
            is_error = False
            Posts.objects.create(
                Title=serializer_obj.data['Title'],
                Content=serializer_obj.data['Content'],
                Category=serializer_obj.data['Category'],
                Status=serializer_obj.data['Status']
            )
            msg = ["success"]
        else:
            is_error = True
            keys = list(serializer_obj._errors.keys())
            for key in keys:
                msg.append(key+" :  "+" | ".join(serializer_obj._errors[key]))

            msg = msg

        return Response({
            "is_error": is_error,
            "data": request.data,
            "messages": msg
        })

    def put(self, request, param0, *args, **kwargs):
        post = Posts.objects.filter(Id=param0)
        post.query = pickle.loads(pickle.dumps(self.posts.query))
        data = None
        if (post.exists()):
            data = "Ada"
        return Response({
            "is_error": False,
            "data": post.first(),
            "messages": "msg"
        })

    def delete(self, request, param0, *args, **kwargs):
        print(param0)
        return Response({
            "is_error": False,
            "data": request.data,
            "messages": str(param0)+" deleted"
        })
