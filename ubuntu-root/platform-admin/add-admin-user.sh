USER_NAME=$1

set -e # Exit if error
set -a # Subsequent variables are exported

adduser $USER_NAME
adduser $USER_NAME sudo