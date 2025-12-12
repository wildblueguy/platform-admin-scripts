set -e # Exit if error
set -a # Subsequent variables are exported

sudo apt update
sudo apt upgrade -y

sudo reboot now