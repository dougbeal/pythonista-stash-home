echo "ENV settings ${REMOTE_USERNAME} ${REMOTE_TARGET} ${MOBILE}"

keyfile_prefix="stash-pythonista-${MOBILE}"
echo ${keyfile_prefix}
keyfile_glob="stash-pythonista*"
echo ${keyfile_glob}

sshdir="${STASH_ROOT}/.ssh"
echo ${sshdir}
tempdir="${STASH_ROOT}/temp"
echo ${tempdir}

echo "Settings ${keyfile_prefix) ${keyfile_glob}"
echo "Directories sshdir ${sshdir} tempdir ${tempdir}"

mkdir -p "{sshdir}"
# scp cannot find key so it will prompt user for password
mkdir -p "${tempdir}"
cd "${tempdir}"
ssh-keygen -t dsa -f ${keyfile_prefix}
scp ${keyfile_glob} ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/
cp ${keyfile_glob} "${sshdir}"


