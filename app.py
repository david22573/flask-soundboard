from flask import Flask, render_template

app = Flask(__name__)


@app.get("/")
def hello():
    return render_template("index.html")
