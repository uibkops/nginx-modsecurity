#!/usr/bin/env bash

# Set default processes based on CPU
sudo sed -i "s/worker_processes 4;/worker_processes $(cat /proc/cpuinfo | grep processor | wc -l);/" /etc/nginx/nginx.conf

# Set worker connections based on CPU
sudo sed -i "s/worker_connections 768;/worker_connections $(expr $(cat /proc/cpuinfo | grep processor | wc -l) \* 1024);/" /etc/nginx/nginx.conf
sudo sed -i "/# multi_accept on;/ a\use epoll;" /etc/nginx/nginx.conf
sudo sed -i "s/# multi_accept on;/multi_accept on;/" /etc/nginx/nginx.conf

