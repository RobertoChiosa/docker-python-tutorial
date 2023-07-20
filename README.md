# docker-python-tutorial

A simple tutorial on how to deploy python application in docker
used as template repository inspired to https://docs.docker.com/language/python/build-images/

## Setup

* Clone this repository

  ```bash
  git clone
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

* Create dockerfile in the root directory
  ```bash
  touch Dockerfile
  ```
  Inside the Dockerfile make sure to 
  * List the official python image you will use
  * Create a folder inside the contner that will be used as working directory for the app
  * Copy requirements in the working directory and install required packages
  * Copy the source code in the docker container
  * Tell the image what to do when it starts as a container
  * 
* Build the image

```bash
  docker build --tag python-docker .
  ```

* view local images

  ```bash
  docker images
  ```

## Run

Expose the docker to the 8000 port for incoming requests

```bash
docker run --publish 8000:5000 python-docker
```

## CICD

## Deploy
