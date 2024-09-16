from django.shortcuts import render

# Create your views here.

def Commercial_page(request):
    return render(request,'commercial_template/commercialhtml.html')