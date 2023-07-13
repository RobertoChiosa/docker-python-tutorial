# docker-python-tutorial

A simple tutorial on how to deploy python application in docker

## Setup

* Open a terminal in the folder

* Create virtual environment
    ```bash
    python3 -m venv .venv
    ```

* Activate the virtual environment
    ```bash
    source .venv/bin/activate
    ```
* Install requirements
    ```
  pip install -r requirements.txt
  ```

## Development

* Create a simple application

 ```python
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, Docker!'
```

* Update requirements

```bash
# pip install pipreqs
pipreqs - -force.
```

Using pipreqs is smart because it scans the .py files in the project and generates the requirements.txt automatically
based only on the packages used. Prefer using this method over of pip freeze to avoid to list unnecessary or conflicting
requirements

