# Nginx with ModSecurity

This container installs nginx together with runsv on an Ubunto 16.04.
[Phusion Baseimage]: https://github.com/phusion/baseimage-docker is used to handle things with docker correctly.
Nginx is started in foreground mode. (since 0.10)


## Instructions for Use

Modify docker-compose.yml and set a senseful nginx.conf for your service (you can modify the example within).
Right now modsecurity is started in DetectionOnly mode. If you want to change this you have to replace modsecurity.conf in your container e.g. with a volume.

start the container with
```
docker-compose up
```

You can also have a rate limiter reconfigured with these two lines in nginx.conf.
```
    limit_req zone=one burst=100 nodelay;
    limit_req_log_level error;

```

## Instructions for Build
```
docker build -t fail2ban  .


