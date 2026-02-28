#!/bin/bash

echo "Setup Workspace:"
echo "1) Start New Project"
echo "2) Import Existing Project"
read -p "> " mode

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

if [ "$mode" = "1" ]; then
    BASE_PATH="$(pwd)/templates"
elif [ "$mode" = "2" ]; then
    BASE_PATH="$(pwd)/../projects"
else
    exit 1
fi

case $type in
    1)
        echo "Select Application:"
        echo "1) C++"
        echo "2) Java"
        echo "3) Python"
        read -p "> " choice
        case $choice in
            1) PROJECT_TYPE="cpp"; PROJECT_NAME="cpp" ;;
            2) PROJECT_TYPE="java"; PROJECT_NAME="java" ;;
            3) PROJECT_TYPE="python"; PROJECT_NAME="python" ;;
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
            1) PROJECT_TYPE="django"; PROJECT_NAME="django" ;;
            2) PROJECT_TYPE="html/apache"; PROJECT_NAME="apache" ;;
            3) PROJECT_TYPE="html/nginx"; PROJECT_NAME="nginx" ;;
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
            1) PROJECT_TYPE="bash"; PROJECT_NAME="bash" ;;
            2) PROJECT_TYPE="json"; PROJECT_NAME="json" ;;
            3) PROJECT_TYPE="xml"; PROJECT_NAME="xml" ;;
            *) exit 1 ;;
        esac
        ;;
    *) exit 1 ;;
esac

if [ "$mode" = "1" ]; then
    PROJECT_PATH="$(pwd)/apps/$PROJECT_TYPE"
    mkdir -p "$PROJECT_PATH"
    cp -r "$BASE_PATH/$PROJECT_TYPE/static/"* "$PROJECT_PATH/"
elif [ "$mode" = "2" ]; then
    if [[ "$PROJECT_TYPE" == html/* ]]; then
        PROJECT_PATH="$(pwd)/../projects/$PROJECT_TYPE"
    else
        PROJECT_PATH="$BASE_PATH/$PROJECT_TYPE"
    fi
fi

docker compose run --rm -v "$PROJECT_PATH:/app" $PROJECT_NAME