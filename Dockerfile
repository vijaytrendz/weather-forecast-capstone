# base image
FROM python:3

ENV PYTHONUNBUFFERED 1
# working directory
WORKDIR /app
# add all files to working directory
COPY . /app
COPY manage.py /app
RUN pip install -r requirements.txt
RUN pip install pylint==2.9.2
#Expose port 80
EXPOSE 80
#ADD . /app
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
#CMD: ["python", "manage.py", "runserver", "0.0.0.0:80" ]
#command: [ "python", "./manage.py runserver 0.0.0.0:8000" ]
