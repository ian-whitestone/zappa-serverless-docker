import time

from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def serve():
    return jsonify(success=True)


@app.route("/time")
def get_current_time():
    return {"time": f"Time is {round(time.time())}"}
