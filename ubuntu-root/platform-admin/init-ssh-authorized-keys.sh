USER=$1
KEY=$2

set -e # Exit if error
set -a # Subsequent variables are exported

mkdir -p /home/$USER/.ssh
chown $USER:$USER /home/$USER/.ssh
chmod 700 /home/$USER/.ssh
echo -e "$KEY\n" > /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER/.ssh/authorized_keys
chmod 600 /home/$USER/.ssh/authorized_keys
systemctl reload ssh.service