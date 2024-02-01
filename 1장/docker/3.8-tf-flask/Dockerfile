FROM tensorflow/tensorflow:2.15.0

RUN apt-get update
RUN apt-get -y install libgl1-mesa-glx

ENV USER=user1

COPY requirements.txt .
#RUN pip install --upgrade pip
RUN pip install --user --no-cache-dir -r requirements.txt

RUN mkdir -p /home/${USER}/myapp
COPY ./myapp/ /home/${USER}/myapp/
WORKDIR /home/${USER}/myapp

EXPOSE 5000

CMD ["python", "main.py"]
