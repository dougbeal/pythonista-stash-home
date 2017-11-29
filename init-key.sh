
SSH_FILENAME="stash-pythonista-${MOBILE}"
sshdir="$STASH_ROOT/.ssh"
tempdir="$STASH_ROOT/temp"
files="stash-pythonista*"
echo "Settings ${SSH_FILENAME) ${files} sshdir ${sshdir} tempdir ${tempdir}"

mkdir -p "${sshdir}"
# scp can't find key so it will prompt user for password
mkdir -p "${tempdir}"
cd "${tempdir}"
ssh-keygen -t dsa -f ${SSH_FILENAME}
scp ${files} ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/
cp ${files} "${sshdir}"


