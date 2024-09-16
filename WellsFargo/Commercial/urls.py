
from django.contrib import admin
from django.urls import path
from Commercial import views
urlpatterns = [

    path("commercial/", views.Commercial_page),
]
