# Docker stack
I have more projects all in LAMP ambient but with different configuration. Every time I used simple docker container with the right configuration for the project I use.

It's time to change: I created a unique LAMP docker ambient with more containers (one for each service):
- web server
- PHP
- database
- (you can add other services)

Now i can change project and configuration simply!

### Usage
You are up and running in three simple steps:
```shell
# Copy the default configuration
cp env .evn
# Edit your configuration
vim .env
# Start multi-container Docker application
docker-compose up
```

### Structure
##### /containers
A list of directories with all the containers you can use to compose a LAMP ambient.
##### /etc
Put your project in this directory: docker can't mount your projects if they are out of docker root path.
##### /usr
I use this directory to store databases volumes.
##### /var
In this directory you can put logs of your containers.