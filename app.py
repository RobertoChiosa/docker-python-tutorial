from flask import Flask

app = Flask(__name__)


@app.route("/")
def root():
    """
    This function is called when visiting the root path of the api.
    :return:
    """
    return {"message": "Hello, World!"}


if __name__ == "__main__":
    app.run(debug=True)
