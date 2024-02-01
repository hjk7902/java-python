FROM python:3.8-buster

#RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
RUN apt-get update
#RUN apt-get install -y apt-transport-https
RUN apt-get -y install libgl1-mesa-glx

ENV USER=user1

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --user --no-cache-dir -r requirements.txt

RUN mkdir -p /home/${USER}/myapp
COPY ./myapp/ /home/${USER}/myapp/
WORKDIR /home/${USER}/myapp

EXPOSE 5000

CMD ["python", "main.py"]
