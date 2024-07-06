#!/usr/bin/env sh

if [ "${AUTO_UPDATE}" = "True" ] || [ ! -f "sc4mpapi.py" ]; then
  sh -c "/update.sh"
fi

python sc4mpapi.py 0.0.0.0 $PORT