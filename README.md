# Build python apps with docker

A simple tutorial on how to deploy python application in docker
used as template repository inspired from https://docs.docker.com/language/python/build-images/

## Setup

* Clone this repository

  ```bash
  git clone https://github.com/RobertoChiosa/docker-python-tutorial.git
  ```

* Open a terminal in the repository folder

* Create virtual environment

  ```bash
  python3 -m venv .venv
  ```

* Activate the virtual environment

  ```bash
  source .venv/bin/activate
  ```

* Install requirements

  ``` bash
  pip install -r requirements.txt
  ```

## Development

* Create a simple application. In thi case we created a simple flask application that can be found in the file [`app.py`](app.py)

* Generate and update requirements file. We have three ways to do it:
  * Manually create a requirements file and list manually the required packages
    ```bash
    touch requirements.txt
    ```
  * We can use `pip freeze`. In this way all the packages in the virtual environment will be listed in the requirements (even those not actually used in the project)
    ```bash
    pip freeze > requirements.txt
    ```
  * Use the package `pipreqs`. This is smart because it scans the `.py` files in the project and generates the `requirements.txt`
    automatically based only on the packages used. Prefer using this method over of pip freeze to avoid to list unnecessary or
    conflicting requirements
    ```bash
    # pip install pipreqs
    pipreqs - -force.
    ```

## Test

Start the application and make sure it’s running. Open your terminal and navigate to the working directory you created.

```bash
python3 -m flask run
```

You should see in the terminal console something like
```txt
 * Serving Flask app 'app'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 854-367-290
127.0.0.1 - - [20/Jul/2023 10:56:28] "GET / HTTP/1.1" 200 -
```

## Build
Supposing that you built your application and now it is time to deploy it through docker.

* Create a [`Dockerfile`](./Dockerfile) in the root directory
  ```bash
  touch Dockerfile
  ```
  Inside the `Dockerfile` make sure to:
  * List the official python image you will use;
  * Create a folder inside the contner that will be used as working directory for the app;
  * Copy requirements in the working directory and install required packages;
  * Copy the source code in the docker container;
  * Tell the image what to do when it starts as a container;

* Build the image

  ```bash
  docker build --tag python-docker .
  ```

* View local images and check if you find the `python-docker`

  ```bash
  docker images
  ```
  You should see something like this
  ```txt
  REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
  python-docker   latest    7a3b8d8d4a6c   16 seconds ago   1.01GB
  ```
  
## Run

* Run the container by exposing the port 5000 to the 8000 port of the host machine. In this way the created API will  be reachable from the localhost. Remember to give a name to the containers otherwise they will always have a random name and may be difficult to find.
  ```bash
  docker run --publish 8000:5000 --name flask-api-python python-docker 
  ```

* You can test the reachability of the container by executing a request
  ```bash
  curl http://localhost:8000
  ```
* While a container is running you can list them with the following command
  ```bash
  docker ps
  ```
  
## Deploy

