USER=$1

set -e # Exit if error
set -a # Subsequent variables are exported

if [ -f /home/$USER/.bash_history ]; then
  rm /home/$USER/.bash_history
fi
ln -s /dev/null /home/$USER/.bash_history