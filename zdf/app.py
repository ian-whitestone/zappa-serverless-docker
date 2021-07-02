import time

from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def serve():
    return jsonify(success=True)


@app.route("/time")
def get_current_time():
    print("Sleeping for 5 seconds")
    time.sleep(5)
    return {"time": f"Time is {round(time.time())}"}
