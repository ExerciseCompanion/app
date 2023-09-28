#!/bin/bash

su -c "export DISPLAY=:0 && cd /home/chris/projects-synced/school/MAD/final/app/exercise_companion && flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8989" chris 
#
#cd $HOME/projects-synced/school/MAD/final/app/exercise_companion && flutter run