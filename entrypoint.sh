#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: ${0} start"
  exit 1
fi


if [ $1 = 'start' ]; then
  WKG_DIR=`dirname ${0}`
  echo "Setting working directory to ${WKG_DIR}"
  cd ${WKG_DIR}
  exec gunicorn web_app.wsgi:application --config gunicorn_config.py
fi
