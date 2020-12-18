import subprocess
import shlex

from flask import Flask

INITIAL_LAUNCHER_CMD = "bash launchers/web_app.sh"
START_EXPERIMENT_LAUNCHER_CMD = "bash launchers/driving_simulator.sh"

app = Flask(__name__)


def exec(cmd):
    subprocess.Popen(shlex.split(cmd))


@app.route('/start-simulation')
def start_experiment():
    exec(START_EXPERIMENT_LAUNCHER_CMD)
    return "Experiment started"


def main():
    exec(INITIAL_LAUNCHER_CMD)
    app.run()


if __name__ == '__main__':
    main()
