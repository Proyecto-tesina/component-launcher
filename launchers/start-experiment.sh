#!/bin/bash

wait_carla_sv() {
	until nc -z $CARLA_SV_IP $CARLA_SV_PORT
	do
		echo -e "${INFO_COLOR}Waiting carla sv${NOCOLOR}"

		sleep 2
	done
}

launch_carla_sv() {
	echo -e "${INFO_COLOR}Starting carla sv . . .${NOCOLOR}"

	bash $CARLA_SV_PATH/CarlaUE4.sh $CARLA_SV_ARGS
}

launch_carla_client() {
	echo -e "${INFO_COLOR}Starting carla client . . .${NOCOLOR}"

	wait_carla_sv
	python3 simulator/app.py $CARLA_CLIENT_ARGS
}

launch_face_detector() {
	echo -e "${INFO_COLOR}Starting face detector . . .${NOCOLOR}"

	cd "face-detector"
	python3 face_detection_on_webcam.py
}


source "config/launcher.sh"
source "config/logs.sh"

cd $SIMULATOR_PATH

$ENV_CMD

launch_carla_sv 1>&2 | launch_face_detector 1>&2 | launch_carla_client 1>&2