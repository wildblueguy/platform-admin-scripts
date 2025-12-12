set -e # Exit if error
set -a # Subsequent variables are exported

if [ -f /root/.bash_history ]; then
  rm /root/.bash_history
fi
ln -s /dev/null /root/.bash_history