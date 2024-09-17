import os
from flask import Flask, render_template

app = Flask(__name__)


@app.route("/")
def index():
    audio_files = [f for f in os.listdir("static/audio") if f.endswith(".mp3")]
    return render_template("index.html", audio_files=audio_files)


if __name__ == "__main__":
    app.run(debug=True)
