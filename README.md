# Usage

## azure provision

use image "ubuntu+docker"

```
##ssh connect setting Join Jenkins server.

##sshd_config
For Sha-1 ssh connection to enable add a setting in sshd_config.

$ /etc/ssh/sshd_config
(last line)
KexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1,diffie-hellman-group1-sha1
```
##none pass connection
ssh connection from Jenkins server on not required password .

$ /home/celeb-test-user/.ssh/authorized_keys
((insert private-key of jenkins-server.))

```
##docker command permission.
docker command anytime used sudo permission.

# visudo
(last line)
celeb-test-user ALL=(ALL) NOPASSWD:ALL

```
##docker container script
docker container operation script used from Jenkins server.

$ /home/celeb-test-user/script
$ cdmod +rx /home/celeb-test-user/script

files:
  script/docker-ps.sh
    execute "docker ps" command.

 script/main-pull_run.sh
    pull docker-hub container "hanaceleb/webapp:latest".
    and old version container image label set to "hanaceleb/webapp:backup"

 script/backup-run.sh 
    used to local docker image container "anaceleb/webapp:backup".
    and "hanaceleb/webapp:backup" docker image container laabel set to "hanaceleb/webapp:latest".

```
