from flask import Flask

app = Flask(__name__)


@app.route('/')
def root():
    """
    Root path
    :return:
    """
    return 'Hello, Docker!'
