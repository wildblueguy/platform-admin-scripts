PLATFORM_ADMIN_DIR=/home/ubuntu/platform-admin
PROGRAM_DIR=$PLATFORM_ADMIN_DIR/secure-sudo-dns

PRIMARY_NETPLAN_PATH=/etc/netplan/50-cloud-init.yaml # Should have valid perms e.g. 600

set -e # Exit if error
set -a # Subsequent variables are exported

# sudo
sudo cp $PROGRAM_DIR/config/etc--sudoers.d--99-overrides /etc/sudoers.d/99-overrides
sudo chown root:root /etc/sudoers.d/99-overrides
sudo chmod 440 /etc/sudoers.d/99-overrides

# Netplan DNS
if [[ $1 != '--skip-netplan' ]]; then
  if ! [ -f ${PRIMARY_NETPLAN_PATH}.secure-sudo-dns.backup ]; then
    sudo cp $PRIMARY_NETPLAN_PATH $PRIMARY_NETPLAN_PATH.secure-sudo-dns.backup
  fi
  sudo cp $PROGRAM_DIR/config/etc--netplan--PRIMARY.yaml $PRIMARY_NETPLAN_PATH
  sudo netplan apply
fi

# ResolveD DNS
if ! [ -f /etc/systemd/resolved.conf.secure-sudo-dns.backup ]; then
  sudo cp /etc/systemd/resolved.conf /etc/systemd/resolved.conf.secure-sudo-dns.backup
fi
sudo cp $PROGRAM_DIR/config/etc--systemd--resolved.conf /etc/systemd/resolved.conf
sudo systemctl daemon-reload
sudo systemctl restart systemd-resolved.service