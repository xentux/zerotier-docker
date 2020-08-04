# zerotier-docker
Use a [ZeroTier](https://www.zerotier.com) network inside a docker container.

## Purpose
Show how to use ZeroTier networks inside a docker container, f.e. when the container is hosted at Heroku or with [Dokku](http://dokku.viewdocs.io/dokku/) and you have no access to the host.

## Build
Modify the file *docker-compose.yml* and add your network id and the command, for testing purposes f.e. */bin/sleep 60*. Finally the command should be the command for your application.

Build the image:
```
docker-compose build
```

... and run the container:
```
docker-compose up
```


Any suggestions are welcome.