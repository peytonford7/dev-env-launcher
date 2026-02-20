#!/bin/sh

echo "Setup Workspace:"
echo "1) Start Project"
echo "2) Import Project"

read -p "> " choice

echo "Select Operating System:"
echo "1) GNU/Linux"
echo "2) Windows"
echo "3) MacOSX"

read -p "> " choice

echo "Select Project Type:"
echo "1) Application"
echo "2) Website"
echo "3) Script"

read -p "> " choice

case $choice in
	1)
		docker build -t cpp-env -f templates/cpp/Dockerfile templates/cpp/
		docker run -it --rm -v ~/Documents/projects/C++ cpp-env
		;;
	2)
		docker build -t nginx-env -f templates/nginx/Dockerfile templates/nginx/
		docker run -t -d --rm -p 80:80 -v $HOME/Documents/projects/HTML/nginx:/app --privileged nginx-env
		;;
	3)
		docker build -t bash-env -f  templates/bash/Dockerfile templates/bash/
		docker run -it --rm -v ~/Documents/projects/BASH bash-env
		;;
	*)
		echo "Invalid Choice"
		exit 1
		;;
esac
