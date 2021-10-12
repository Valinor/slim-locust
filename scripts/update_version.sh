set -eu

if [[ $# -lt 2 ]] ; then
    echo $0 should have one argument : ex $0 {locust version}
    exit 1
fi
set -eux

for dockerfile in $(ls *.dockerfile); do sed -i s/"install locust"/"install locust==$1"/ $dockerfile; done
