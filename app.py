import subprocess
import shlex

from flask import Flask

INITIAL_LAUNCHER_CMD = "bash launchers/initial.sh"
START_EXPERIMENT_LAUNCHER_CMD = "bash launchers/start-experiment.sh"

app = Flask(__name__)


def exec(cmd):
    subprocess.Popen(shlex.split(cmd))


@app.route('/experiment/start/')
def start_experiment():
    exec(START_EXPERIMENT_LAUNCHER_CMD)

    return "Experiment started"


def main():
    exec(INITIAL_LAUNCHER_CMD)
    app.run()


if __name__ == '__main__':
    main()
