set -eu

if [[ $# -lt 2 ]] ; then
    echo $0 should have two argument : ex $0 {docker repository} {version}
    exit 1
fi
set -eux
for dockerfile in ${@:3} 
do 
	docker buildx build --push --platform linux/amd64,linux/arm64 --tag $1/locust:$2-$(echo $dockerfile|cut -d"." -f1) . -f $dockerfile
done
