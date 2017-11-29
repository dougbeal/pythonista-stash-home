echo "ENV settings ${REMOTE_USERNAME} ${REMOTE_TARGET} ${MOBILE}"

keyfile_prefix="stash-pythonista-${MOBILE}"
echo "keyfile_prefix ${keyfile_prefix}"
keyfile_glob="stash-pythonista*"
echo "keyfile_glob ${keyfile_glob}"

sshdir="${STASH_ROOT}/.ssh"
echo "sshdir ${sshdir}"
tempdir="${STASH_ROOT}/temp"
echo "tempdir ${tempdir}"

mkdir -p "${sshdir}"
# scp cannot find key so it will prompt user for password
mkdir -p "${tempdir}"

cd "${sshdir}"
ls ${keyfile_glob}
ssh-keygen -t dsa -f ${keyfile_prefix}
ls ${keyfile_glob}
mv ${keyfile_glob} "${tempdir}"
ls ${keyfile_glob}

scp ${keyfile_glob} ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/

cd "${tempdir}"
mv ${keyfile_glob} "${tempdir}"
