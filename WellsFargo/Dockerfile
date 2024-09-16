FROM python:3.11

WORKDIR /Wellsfargo

COPY  . /Wellsfargo

RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["python3","manage.py","runserver","0.0.0.0:8000"]


