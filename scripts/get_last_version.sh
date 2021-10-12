curl https://hub.docker.com/v2/repositories/library/alpine/tags|jq .results[].name
curl https://hub.docker.com/v2/repositories/library/fedora/tags|jq .results[].name
curl https://hub.docker.com/v2/repositories/redhat/ubi8/tags|jq .results[].name
curl https://hub.docker.com/v2/repositories/library/debian/tags|jq .results[].name
