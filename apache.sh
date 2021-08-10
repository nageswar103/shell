#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
systemctl stop httpd
















