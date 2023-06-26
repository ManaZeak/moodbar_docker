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
    print('Generating moodbar for : ' + data['source'] + ' with resolution : ' + data['resolution'])

    # Launching the command with the parameter.
    try:
        process = subprocess.run(['moodbar', '-o',  data['destination'], data['source'], data['resolution']])
    except Exception as e:
        print('error occurred.' + str(e))
        return 'error', 503

    if process.returncode != 0:
        return 'error', 503

    return 'ok', 200
