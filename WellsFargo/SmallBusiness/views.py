from django.shortcuts import render

# Create your views here.

def small_business(request):
    return render(request,'Small_business_template/smallbusinesshtml.html')

def business_form_fun(request):
    return render(request,'Small_business_template/busines-form.html')
