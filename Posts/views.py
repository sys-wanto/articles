from rest_framework.views import APIView
from rest_framework.response import Response
from .models import *
from .serializers import *
# from django.views.decorators.csrf import csrf_exempt


# Create your views here.
class PostsApiView(APIView):
    serializer_class = PostsSerializer

    # @csrf_exempt
    def get(self, request, param0=None, param1=None, *args, **kwargs):
        # param0 = limit / index
        # param1 = offset
        msg = []
        vars = None
        if param1 == None and param0 == None:
            param0 = 10
            param1 = 0
            is_error = False
            msg.append("Data di temukan.")
            posts = Posts.objects.all().values('Id', 'Title', 'Content', 'Category',
                                               'Status').order_by("-Created_date")[param1:param0+param1]
            vars = {
                "row_limit":param0,
                "next_page": param0+param1,
                "prev_page": param1 if param0-param1 <= 0 else param0-param1,
                "data_count": Posts.objects.all().count()
            }
        else:
            if param1 != None:
                is_error = False
                msg.append("Data di temukan.")
                posts = Posts.objects.all().values('Id', 'Title', 'Content', 'Category',
                                                   'Status').order_by("-Created_date")[param1:param0+param1]
                vars = {
                    "row_limit":param0,
                    "next_page": param0+param1,
                    "prev_page": param1 if param1-param0 < 0 else param1-param0,
                    "data_count": Posts.objects.all().count()
                }
            else:
                posts = Posts.objects.filter(Id=param0).values(
                    'Id', 'Title', 'Content', 'Category', 'Status')
                if posts.exists():
                    is_error = False
                    msg.append("Data di temukan.")
                    posts = posts.first()
                else:
                    is_error = True
                    msg.append("Data tidak di temukan.")
                    posts = []

        return Response({
            "is_error": is_error,
            "data": posts,
            "vars": vars,
            "messages": msg
        })

    def post(self, request, *args, **kwargs):
        msg = []
        serializer_obj = PostsSerializer(data=request.data)
        if serializer_obj.is_valid():
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
            "vars": None,
            "messages": msg
        })

    def put(self, request, param0, *args, **kwargs):
        msg = []
        data = []
        is_error = True
        post = Posts.objects.filter(Id=param0).values(
            'Title', 'Content', 'Category', 'Status')
        if post.exists():
            serializer_obj = PostsSerializer(data=request.data)
            if serializer_obj.is_valid():
                post_edit = Posts.objects.get(Id=param0)
                post_edit.Title = serializer_obj.data['Title']
                post_edit.Content = serializer_obj.data['Content']
                post_edit.Category = serializer_obj.data['Category']
                post_edit.Status = serializer_obj.data['Status']
                post_edit.save()
                data = post.first()
                msg.append("Data sukses di rubah")
            else:
                keys = list(serializer_obj._errors.keys())
                for key in keys:
                    msg.append(
                        key+" :  "+" | ".join(serializer_obj._errors[key]))
                msg = msg
        else:
            msg.append("Data tidak di temukan")
        return Response({
            "is_error": is_error,
            "data": data,
            "vars": None,
            "messages": msg
        })

    def delete(self, request, param0, *args, **kwargs):
        msg = []
        data = []
        is_error = True
        post = Posts.objects.filter(Id=param0).values(
            'Title', 'Content', 'Category', 'Status')
        if post.exists():
            Posts.objects.get(Id=param0).delete()
            msg.append("Data sukses di hapus")
        else:
            msg.append("Data tidak di temukan")
        return Response({
            "is_error": is_error,
            "data": data,
            "vars": None,
            "messages": msg
        })
