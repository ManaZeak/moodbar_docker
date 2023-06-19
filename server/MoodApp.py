from flask import Flask, request, json
import subprocess

app = Flask(__name__)

@app.post('/generate_mood')
def generateMoodbar():
    # Loads the JSON into an object.
    data = json.loads(request.data)

    # Checking the parameters.
    if 'source' not in data:
        return 'Missing source argument', 400
    if 'destination' not in data:
        return 'Missing destination argument', 400
    if 'resolution' not in data:
        return 'Missing resolution argument', 400

    # Launching the command with the parameter.
    process = subprocess.run(['moodbar', '-o ' + data['destination'], data['source'], data['resolution']])
    if process.returncode != 0:
        return 'error', 501

    return 'ok', 200
