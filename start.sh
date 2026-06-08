#!/bin/bash

echo "Setup Workspace:"
echo "1) New Project"
echo "2) Import Project"
echo "3) Clear Projects"
read -p "> " mode

if [ "$mode" = "3" ]; then
    echo "Clear Projects? (y/N):"
    read -p "> " confirm
    if [ "$confirm" = "y" ]; then
        sudo rm -rf apps/*
        docker ps -q | xargs -r docker stop >/dev/null 2>&1
        docker system prune -af >/dev/null 2>&1
        echo "Projects Cleared"
    fi
    exit 0
fi

echo "Select Project Type:"
echo "1) Application"
echo "2) Data Processing"
echo "3) Website"
read -p "> " type

case $type in
    1)
        PROJECT_DIR="application"
        echo "Select Application Type:"
        echo "1) Compiled"
        echo "2) Interpreted"
        read -p "> " choice
        case $choice in
            1)
                PROJECT_DIR="$PROJECT_DIR/compiled"
                echo "Select Application Type:"
                echo "1) C"
                echo "2) C#"
                echo "3) .NET"
                echo "4) C++"
                echo "5) Go"
                echo "6) Java"
                echo "7) Rust"
                echo "8) Swift"

                read -p "> " choice
                case $choice in
                    1) PROJECT_NAME="c"; PROJECT_DIR="$PROJECT_DIR/c" ;;
                    2) PROJECT_NAME="csharp"; PROJECT_DIR="$PROJECT_DIR/csharp" ;;
                    3) PROJECT_NAME="dotnet"; PROJECT_DIR="$PROJECT_DIR/dotnet" ;;
                    4) PROJECT_NAME="cpp"; PROJECT_DIR="$PROJECT_DIR/cpp" ;;
                    5) PROJECT_NAME="go"; PROJECT_DIR="$PROJECT_DIR/go" ;;
                    6) PROJECT_NAME="java"; PROJECT_DIR="$PROJECT_DIR/java" ;;
                    7) PROJECT_NAME="rust"; PROJECT_DIR="$PROJECT_DIR/rust" ;;
                    8) PROJECT_NAME="swift"; PROJECT_DIR="$PROJECT_DIR/swift" ;;
                    *) exit 1 ;;
                esac
                ;;
            2)
                PROJECT_DIR="$PROJECT_DIR/interpreted"
                echo "Select Application Type:"
                echo "1) Bash"
                echo "2) Batch"
                echo "3) Lua"
                echo "4) Perl"
                echo "5) Powershell"
                echo "6) Python"
                echo "7) Ruby"
                read -p "> " choice
                case $choice in
                    1) PROJECT_NAME="bash"; PROJECT_DIR="$PROJECT_DIR/bash" ;;
                    2) PROJECT_NAME="batch"; PROJECT_DIR="$PROJECT_DIR/batch" ;;
                    3) PROJECT_NAME="lua"; PROJECT_DIR="$PROJECT_DIR/lua" ;;
                    4) PROJECT_NAME="perl"; PROJECT_DIR="$PROJECT_DIR/perl" ;;
                    5) PROJECT_NAME="powershell"; PROJECT_DIR="$PROJECT_DIR/powershell" ;;
                    6) PROJECT_NAME="python"; PROJECT_DIR="$PROJECT_DIR/python" ;;
                    7) PROJECT_NAME="ruby"; PROJECT_DIR="$PROJECT_DIR/ruby" ;;
                    *) exit 1 ;;
                esac
                ;;
            *) exit 1 ;;
        esac
        ;;
    2)
        PROJECT_DIR="dataformat"
        echo "Select Data Type:"
        echo "1) JSON"
        echo "2) XML"
        echo "3) YAML"
        echo "4) CSV"
        echo "5) RSS"
        read -p "> " choice
        case $choice in
            1) PROJECT_DIR="$PROJECT_DIR/json"; PROJECT_NAME="json" ;;
            2) PROJECT_DIR="$PROJECT_DIR/xml"; PROJECT_NAME="xml" ;;
            3) PROJECT_DIR="$PROJECT_DIR/yaml"; PROJECT_NAME="yaml" ;;
            4) PROJECT_DIR="$PROJECT_DIR/csv"; PROJECT_NAME="csv" ;;
            5) PROJECT_DIR="$PROJECT_DIR/rss"; PROJECT_NAME="rss" ;;
            *) exit 1 ;;
        esac
        ;;
    3)
        PROJECT_DIR="website"
        echo "Select Website Framework:"
        echo "1) Backend"
        echo "2) Frontend"
        echo "3) Fullstack"
        read -p "> " choice
        case $choice in
            1)
                PROJECT_DIR="$PROJECT_DIR/backend"
                echo "Select Backend Framework:"
                echo "1) ASP.NET"
                echo "2) Django"
                echo "3) Express"
                echo "4) FastAPI"
                echo "5) Flask"
                echo "6) Ruby on Rails"
                echo "7) Springboot"
                echo "8) Rocket"
                read -p "> " choice
                case $choice in
                    1) PROJECT_NAME="aspnet"; PROJECT_DIR="$PROJECT_DIR/aspnet" ;;
                    2) PROJECT_NAME="django"; PROJECT_DIR="$PROJECT_DIR/django" ;;
                    3) PROJECT_NAME="express"; PROJECT_DIR="$PROJECT_DIR/express" ;;
                    4) PROJECT_NAME="fastapi"; PROJECT_DIR="$PROJECT_DIR/fastapi" ;;
                    5) PROJECT_NAME="flask"; PROJECT_DIR="$PROJECT_DIR/flask" ;;
                    6) PROJECT_NAME="rails"; PROJECT_DIR="$PROJECT_DIR/rails" ;;
                    7) PROJECT_NAME="springboot"; PROJECT_DIR="$PROJECT_DIR/springboot" ;;
                    8) PROJECT_NAME="rocket"; PROJECT_DIR="$PROJECT_DIR/rocket" ;;
                    *) exit 1 ;;
                esac
                ;;
            2)
                PROJECT_DIR="$PROJECT_DIR/frontend"
                echo "Select Frontend Framework:"
                echo "1) Apache"
                echo "2) Nginx"
                echo "3) React"
                echo "4) Angular"
                echo "5) Vue"
                echo "6) Vite"
                read -p "> " choice
                case $choice in
                    1) PROJECT_NAME="apache"; PROJECT_DIR="$PROJECT_DIR/apache" ;;
                    2) PROJECT_NAME="nginx"; PROJECT_DIR="$PROJECT_DIR/nginx" ;;
                    3) PROJECT_NAME="react"; PROJECT_DIR="$PROJECT_DIR/react" ;;
                    4) PROJECT_NAME="angular"; PROJECT_DIR="$PROJECT_DIR/angular" ;;
                    5) PROJECT_NAME="vue"; PROJECT_DIR="$PROJECT_DIR/vue" ;;
                    6) PROJECT_NAME="vite"; PROJECT_DIR="$PROJECT_DIR/vite" ;;
                    *) exit 1 ;;
                esac
                ;;
            3)
                PROJECT_DIR="$PROJECT_DIR/fullstack"
                echo "Select Fullstack Framework:"
                echo "1) Laravel"
                echo "2) Next.js"
                read -p "> " choice
                case $choice in
                    1) PROJECT_NAME="laravel"; PROJECT_DIR="$PROJECT_DIR/laravel" ;;
                    2) PROJECT_NAME="nextjs"; PROJECT_DIR="$PROJECT_DIR/nextjs" ;;
                    *) exit 1 ;;
                esac
                ;;
            *) exit 1 ;;
        esac
        ;;
    *) exit 1 ;;
esac

read -p "Enter Project Name: " PROJECT_ID

PROJECT_PARAMS=()

mkdir -p "apps/$PROJECT_NAME"

if [ -z "$PROJECT_ID" ]; then
    PROJECT_ID=$(printf "%02d" $(( $(ls -1d apps/$PROJECT_NAME/* 2>/dev/null | wc -l) + 1 )))
fi

PROJECT_PATH="$(pwd)/apps/$PROJECT_NAME/$PROJECT_ID"

if [ "$mode" = "1" ]; then

    mkdir -p "$PROJECT_PATH"
    IMPORT_PATH="$(pwd)/templates/$PROJECT_DIR/src"

    if [ ! -d "$IMPORT_PATH" ]; then
        echo "Template Source Not Found: $IMPORT_PATH"
        exit 1
    fi

    if [ -d "$PROJECT_PATH" ]; then
        cp -a "$IMPORT_PATH"/. "$PROJECT_PATH"/ || {
            echo "Error Copying Template Files"
            exit 1
        }
    else
        echo "Error Creating Project Directory"
        exit 1
    fi
elif [ "$mode" = "2" ]; then

    read -p "Import Path (../projects/dir): " IMPORT_PATH

    if [ -d "$IMPORT_PATH" ]; then
        PROJECT_PATH="$IMPORT_PATH"
    else
        echo "Import Path Does Not Exist"
        exit 1
    fi
else
    exit 1
fi

echo "Choose Parameters:"
read -p "Quiet? (y/N):" choice
if [ "$choice" = "y" ]; then
    PROJECT_PARAMS+=("--quiet")
fi

read -p "Background? (y/N):" choice
if [ "$choice" = "y" ]; then
    PROJECT_PARAMS+=("-d")
fi

read -p "Remove? (y/N):" choice
if [ "$choice" = "y" ]; then
    PROJECT_PARAMS+=("--rm")
fi

export PROJECT_PATH
export PROJECT_ID

echo "Parameters: $PROJECT_PARAMS"
echo "Path: $PROJECT_PATH"
echo "Name: $PROJECT_ID"

echo "Building..."
docker compose build "$PROJECT_NAME"

echo "Deploying..."
docker compose run \
--name "$PROJECT_NAME-$PROJECT_ID" \
"${PROJECT_PARAMS[@]}" "$PROJECT_NAME"
