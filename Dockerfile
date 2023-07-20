# syntax=docker/dockerfile:1
# Define the base image
FROM python:3.8-slim-buster
# Set the working directory
WORKDIR /app
# Copy the dependencies file to the working directory and install
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
# Copy source code in working directory
COPY . .
# Execute command to run the application
CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]