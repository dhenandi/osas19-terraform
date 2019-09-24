#!/bin/bash

zypper in -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1>This is deployed with Terraform for openSUSE Asia Summit 2019</h1>" >> /srv/www/htdocs/index.html