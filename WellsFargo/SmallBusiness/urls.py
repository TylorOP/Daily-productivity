
from django.contrib import admin
from django.urls import path
from SmallBusiness import views

urlpatterns = [

    path("Small_business/", views.small_business),
    path('business_form/', views.business_form_fun),
]
