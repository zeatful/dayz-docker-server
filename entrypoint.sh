#!/bin/bash

function updateGame() {
    echo "Updating game..."
    steamcmd +force_install_dir ${SERVER_DIR} +login ${STEAM_CMD_USER} +app_update ${APP_ID} ${EXTRA_UPDATE_ARGS} +quit
}

function startGame() {
    echo "Starting game..."
    cd ${SERVER_DIR}
    ./DayZServer -config="serverDZ.cfg" ${EXTRA_START_ARGS}
}

case "$1" in
    start)
        updateGame
        startGame
    ;;
    update)
        updateGame
    ;;
    *)
        exec "$@"
    ;;
esac
