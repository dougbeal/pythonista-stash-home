source sensitive.sh
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

echo "ssh-keygen"
ssh-keygen -t rsa -b 4096 -f ${keyfile_prefix}
ls ${sshdir}/${keyfile_glob}
mv ${sshdir}/${keyfile_glob} ${tempdir}
ls ${sshdir}/${keyfile_glob}

echo "scp"
scp ${tempdir}/${keyfile_glob} ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/

mv ${tempdir}/${keyfile_glob} ${sshdir}
ls ${sshdir}/${keyfile_glob}
