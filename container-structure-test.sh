set -eu

if [[ $# -lt 1 ]] ; then
    echo $0 should have one argument : ex $0 {version}
    exit 1
fi
for dockerfile in $(ls *.dockerfile)
do 
echo $dockerfile
echo ###############
docker pull damballa/locust:$1-$(echo $dockerfile|cut -d"." -f1)
container-structure-test test --image damballa/locust:$1-$(echo $dockerfile|cut -d"." -f1) --config locust-image-test.yaml
done
