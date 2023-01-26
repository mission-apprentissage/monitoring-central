#!/usr/bin/env bash
set -euo pipefail
#Needs to be run as sudo

bash /opt/monitoring/tools/backup-mongodb.sh
bash /opt/monitoring/cli.sh migrate
