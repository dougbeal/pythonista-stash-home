
SSH_FILENAME="stash-pythonista-${MOBILE}"
echo "Need remote password for ${REMOTE_USERNAME} on ${REMOTE_TARGET}"
read REMOTE_PASSWORD
sshdir="$STASH_ROOT/.ssh"
tempdir="$STASH_ROOT/temp"
files="stash-pythonista*"
mkdir -p "$sshdir"
# scp can't find key so it will prompt user for password
mkdir -p "$tempdr"
cd "$tempdr"
ssh-keygen -t dsa -f ${SSH_FILENAME}
scp --password ${REMOTE_PASSWORD} ${files} ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/
cp ${files} "$sshdir"

