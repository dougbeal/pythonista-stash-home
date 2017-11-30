echo ssh ${REMOTE_USERNAME}@${REMOTE_TARGET} "osascript -e 'get volume settings'"
# (require 'url-util)url-util
# (url-encode-url "pythonista://launch_stash?action=run&argv=--command&argv=pythonista-stash/home/get-volume.sh")"pythonista://launch_stash?action=run&argv=--command&argv=pythonista-stash/home/get-volume.sh"
echo pythonista://launch_stash?action=run&argv=--command&argv=pythonista-stash-home/get-volume.sh
source ~/Documents/sensitive.sh
ssh ${REMOTE_USERNAME}@${REMOTE_TARGET} "osascript -e 'get volume settings'"
