from . import Business_form_model
from django import forms


class business_form_form(forms.ModelForm):
    class Meta:
        model = Business_form_model
        field ='__all__'