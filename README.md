# docker-collection
Some dockerfile personnal template alternative to official docker images

## Non official slim Locust.io

### Description
- Official locust image (https://hub.docker.com/r/locustio/locust) : ~ 950Mo
- This locust image debian : <215Mo
- This locust image centos : <320Mo
- This locust image alpine : <135Mo

### Be carefull
Same base (debian buster)
- Offical image use Python 3.8
- The debian base image use Python 3.7 (official debian python3 package)
- The redhat base image use Python 3.8
- The alpine base image use Python 3.9

### Vulnerability scan : (docker scan)
- Offical image : 368
- Current image for debian : 72 (vulnerability in debian buster)
- Current image for alpine : 0
- Current image for redhat : 0


Currently, this image use the latest tag for locust, it is not a good pratice.
Latest tag when build was 1.5.3.
Should fix that with tag and branch in next revision.