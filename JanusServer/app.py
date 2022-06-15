import json

from flask import Flask, request, Response

from status import Status

app = Flask(__name__)

gaming = False


@app.route('/update', methods=['POST'])
def update_status():
    print('received request')
    print(request.get_json())

    status = Status(request.get_json()['_Status__gaming_status'])
    print(status)

    global gaming
    gaming = status.get_gaming_status()

    return Response(None, status=200, mimetype='application/json')


@app.route('/ask', methods=['GET'])
def ask_status():
    response = {
        "gaming_status": gaming
    }
    final_response = json.dumps(response)
    return Response(final_response, status=200, mimetype='application/json')


if __name__ == '__main__':
    app.run(port=6969)
