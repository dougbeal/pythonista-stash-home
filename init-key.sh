echo "ENV settings ${REMOTE_USERNAME} ${REMOTE_TARGET} ${MOBILE}"
sshdir="stash-pythonista-${MOBILE}"
echo ${sshdir}
sshdir="${STASH_ROOT}/.ssh"
echo ${sshdir}
tempdir="${STASH_ROOT}/temp"
echo ${tempdir}
keyfiles="stash-pythonista*"
echo ${keyfiles}
echo "Settings ${sshdir) ${keyfiles} sshdir ${sshdir} tempdir ${tempdir}"

mkdir -p "${sshdir}"
# scp cannot find key so it will prompt user for password
mkdir -p "${tempdir}"
cd "${tempdir}"
ssh-keygen -t dsa -f ${sshdir}
scp ${keyfiles} ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/
cp ${keyfiles} "${sshdir}"


