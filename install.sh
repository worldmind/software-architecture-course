#!/bin/sh
sudo dpkg --purge uwsgi-stat-example
sudo dpkg -i uwsgi-stat-example.deb
sudo service uwsgi restart
sudo service nginx restart
