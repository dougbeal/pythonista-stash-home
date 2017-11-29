echo "ENV settings ${REMOTE_USERNAME} ${REMOTE_TARGET} ${MOBILE}"
SSH_FILENAME="stash-pythonista-${MOBILE}"
echo ${SSH_FILENAME}
sshdir="${STASH_ROOT}/.ssh"
echo ${sshdir}
tempdir="${STASH_ROOT}/temp"
echo ${tempdir}
files="stash-pythonista*"
echo "Settings ${SSH_FILENAME) ${files} sshdir ${sshdir} tempdir ${tempdir}"

mkdir -p "${sshdir}"
# scp cannot find key so it will prompt user for password
mkdir -p "${tempdir}"
cd "${tempdir}"
ssh-keygen -t dsa -f ${SSH_FILENAME}
scp ${files} ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/
cp ${files} "${sshdir}"


