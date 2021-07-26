#!/bin/bash

is_carla_sv_running() {
    nc -z $CARLA_SV_IP $CARLA_SV_PORT
}

wait_carla_sv() {
	until is_carla_sv_running
	do
		echo -e "${INFO_COLOR}Waiting carla sv${NOCOLOR}"

		sleep 2
	done
}

launch_carla_sv() {
	echo -e "${INFO_COLOR}Starting carla sv . . .${NOCOLOR}"

	bash $CARLA_SV_PATH $CARLA_SV_ARGS &
}

launch_carla_client() {
	echo -e "${INFO_COLOR}Starting carla client . . .${NOCOLOR}"

	wait_carla_sv
    cd "simulator"
	python3 app.py $CARLA_CLIENT_ARGS &
}

launch_face_detector() {
	echo -e "${INFO_COLOR}Starting face detector . . .${NOCOLOR}"

    sleep 4
    $ENV_CMD
	python3 app.py $FACE_DETECTOR_ARGS &
}


source "config/launcher.sh"
source "config/logs.sh"

if  is_carla_sv_running; then
    echo "Carla is already running, can't have multiple instances..."
    exit 1
fi

cd $SIMULATOR_PATH
launch_carla_sv &>> $LOG_PATH/carla_sv.log
launch_carla_client &>> $LOG_PATH/simulator.log
cd $FACE_DETECTOR_PATH
launch_face_detector &>> $LOG_PATH/face_detector.log
