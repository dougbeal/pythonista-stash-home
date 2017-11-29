
SSH_FILENAME="stash-pythonista-${MOBILE}"
echo "Need remote password for ${REMOTE_USERNAME} on ${REMOTE_TARGET}"
read REMOTE_PASSWORD
mkdir -p "$STASH_ROOT/.ssh"
cd "$STASH_ROOT/.ssh"
ssh-keygen -t dsa -f ${SSH_FILENAME}
scp --password ${REMOTE_PASSWORD} stash-pythonista* ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/

