from django.db import models

# Create your models here.


class Business_form_model(models.Model):
    Product_id = models.CharField(max_length=5)
    Product_name = models.CharField(max_length=15)
    mobile="mobile"
    tv='tv'
    watch='watch'
    category_choices =[(mobile,'mobile'),(tv,'tv'),(watch,'watch')]
    Product_category = models.CharField(max_length=40,choices=category_choices  )
