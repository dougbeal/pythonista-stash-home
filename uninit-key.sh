#delete any changes from init-key.sh
sshdir="${STASH_ROOT}/.ssh"
echo "sshdir ${sshdir}"
tempdir="${STASH_ROOT}/temp"
echo "tempdir ${tempdir}"

rm -rf "${sshdir}"
rm -rf "${tempdir}"
git pull

