#!/bin/bash

echo "Setup Workspace:"
echo "1) New Project"
echo "2) Import Project"
echo "3) Clear Projects"
read -p "> " mode

if [ "$mode" = "3" ]; then
    echo "Clear Projects? (y/n)"
    read -p "> " confirm
    if [ "$confirm" = "y" ]; then
        rm -rf apps/*
		docker ps -q | xargs -r docker stop >/dev/null 2>&1
		docker system prune -af >/dev/null 2>&1
        echo "Projects Cleared"
    fi
    exit 0
fi

echo "Select Operating System:"
echo "1) GNU/Linux"
echo "2) Windows"
echo "3) MacOSX"
read -p "> " os

echo "Select Project Type:"
echo "1) Application"
echo "2) Website"
echo "3) Script"
read -p "> " type

case $type in
    1)
        echo "Select Application:"
        echo "1) C++"
        echo "2) Java"
        echo "3) Python"
        read -p "> " choice
        case $choice in
            1) PROJECT_DIR="cpp"; PROJECT_NAME="cpp" ;;
            2) PROJECT_DIR="java"; PROJECT_NAME="java" ;;
            3) PROJECT_DIR="python"; PROJECT_NAME="python" ;;
            *) exit 1 ;;
        esac
        ;;
    2)
        echo "Select Website:"
        echo "1) Django"
        echo "2) Apache"
        echo "3) Nginx"
        read -p "> " choice
        case $choice in
            1) PROJECT_DIR="django"; PROJECT_NAME="django" ;;
            2) PROJECT_DIR="html/apache"; PROJECT_NAME="apache" ;;
            3) PROJECT_DIR="html/nginx"; PROJECT_NAME="nginx" ;;
            *) exit 1 ;;
        esac
        ;;
    3)
        echo "Select Script Type:"
        echo "1) Bash"
        echo "2) JSON"
        echo "3) XML"
        read -p "> " choice
        case $choice in
            1) PROJECT_DIR="bash"; PROJECT_NAME="bash" ;;
            2) PROJECT_DIR="json"; PROJECT_NAME="json" ;;
            3) PROJECT_DIR="xml"; PROJECT_NAME="xml" ;;
            *) exit 1 ;;
        esac
        ;;
    *) exit 1 ;;
esac

if [ "$mode" = "1" ]; then
    BASE_PATH="$(pwd)/templates"

    PROJECT_PATH="$(pwd)/apps/$PROJECT_DIR"
    mkdir -p "$PROJECT_PATH"
    cp -r "$BASE_PATH/$PROJECT_DIR/src/"* "$PROJECT_PATH/"

elif [ "$mode" = "2" ]; then
    BASE_PATH="$(pwd)/../projects"

    if [[ "$PROJECT_DIR" == html/* ]]; then
        PROJECT_PATH="$(pwd)/../projects/$PROJECT_DIR"
    else
        PROJECT_PATH="$BASE_PATH/$PROJECT_DIR"
    fi
else
    exit 1
fi

export PROJECT_PATH

echo "Project Details:"
if [ "$mode" = "1" ]; then
    echo "New Project"
else
    echo "Import Project"
fi

echo "Path: $PROJECT_PATH"

echo "Building..."
docker compose build "$PROJECT_NAME"

echo "Deploying..."
docker compose up -d "$PROJECT_NAME"

docker compose exec -it "$PROJECT_NAME" bash