set -e # Exit if error
set -a # Subsequent variables are exported

echo 'Acquire::ForceIPv4=true;' > /etc/apt/apt.conf.d/99-overrides
chown root:root /etc/apt/apt.conf.d/99-overrides
chmod 644 /etc/apt/apt.conf.d/99-overrides