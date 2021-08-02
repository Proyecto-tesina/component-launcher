#!/bin/bash

launch_frontend() {
	echo -e "${COLOR_INFO}Starting frontend . . .${NOCOLOR}"

	cd $FRONTEND_PATH

	npm start $FRONTEND_ARGS
}

launch_backend() {
	echo -e "${COLOR_INFO}Starting API . . .${NOCOLOR}"

	cd $API_PATH

	$ENV_CMD
	python3 backend/manage.py runserver
}

restart_log_files() {
    echo "" > $LOG_PATH/web_frontend.log
    echo "" > $LOG_PATH/web_backend.log
    echo "" > $LOG_PATH/simulator.log
    echo "" > $LOG_PATH/carla_sv.log
    echo "" > $LOG_PATH/face_detector.log
    echo "" > $LOG_PATH/modules.log
}


source "config/launcher.sh"
source "config/logs.sh"

restart_log_files
launch_frontend &>> $LOG_PATH/web_frontend.log | launch_backend &>> $LOG_PATH/web_backend.log
