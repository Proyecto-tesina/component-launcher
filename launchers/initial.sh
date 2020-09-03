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


source "config/launcher.sh"
source "config/logs.sh"

launch_frontend 1>&2 | launch_backend
