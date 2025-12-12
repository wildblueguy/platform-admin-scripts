set -e # Exit if error
set -a # Subsequent variables are exported

echo 'Acquire::ForceIPv4=true;' | sudo tee /etc/apt/apt.conf.d/99-overrides > /dev/null
sudo chown root:root /etc/apt/apt.conf.d/99-overrides
sudo chmod 644 /etc/apt/apt.conf.d/99-overrides