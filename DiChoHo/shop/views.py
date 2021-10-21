from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.


def login(request):
    if request.method == 'POST':
        if 'sdt' not in request.POST:
            return HttpResponse('<h1>No</h1>')
        else:
            return HttpResponse('<h1>Yes</h1>')
    else:
        return render(request, 'login.html')
