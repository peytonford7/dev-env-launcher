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
echo "2) Data Processing"
echo "3) Website"
read -p "> " type

case $type in
    1)
        PROJECT_DIR="application"
        echo "Select Application Type:"
        echo "1) Object Oriented"
        echo "2) Scripting"
        read -p "> " choice
        case $choice in
            1)
                PROJECT_DIR="$PROJECT_DIR/objoriented"
                echo "Select Application Type:"
                echo "1) C"
                echo "2) C#"
                echo "3) C++"
                echo "4) Go"
                echo "5) Java"
                echo "6) Swift"
                read -p "> " choice
                case $choice in
                    1) 
                        PROJECT_NAME="c"; PROJECT_DIR="$PROJECT_DIR/c"
                        echo "Select C Environment:"
                        echo "1) Default C"
                        echo "2) GTK"
                        read -p "> " choice
                        case $choice in
                            1) 
                                PROJECT_NAME="c"; PROJECT_DIR="$PROJECT_DIR/c/static" ;;
                            2)
                                PROJECT_NAME="gtk"; PROJECT_DIR="$PROJECT_DIR/c/gtk" ;;
                            *) exit 1 ;;
                        esac
                        ;;
                    2)
                        PROJECT_NAME="csharp"; PROJECT_DIR="$PROJECT_DIR/csharp"
                        echo "Select C# Environment:"
                        echo "1) Default C#"
                        echo "2) .NET"
                        read -p "> " choice
                        case $choice in
                            1) 
                                PROJECT_NAME="csharp"; PROJECT_DIR="$PROJECT_DIR/csharp/static" ;;
                            2)
                                PROJECT_NAME="dotnet"; PROJECT_DIR="$PROJECT_DIR/csharp/dotnet" ;;
                            *) exit 1 ;;
                        esac
                        ;;
                    3) 
                        PROJECT_NAME="cpp"; PROJECT_DIR="$PROJECT_DIR/cpp" ;;
                    4)
                        PROJECT_NAME="go"; PROJECT_DIR="$PROJECT_DIR/go" ;;
                    5) 
                        PROJECT_NAME="java"; PROJECT_DIR="$PROJECT_DIR/java"
                        echo "Select Java Environment:"
                        echo "1) Default Java"
                        echo "2) Hadoop"
                        read -p "> " choice
                        case $choice in
                            1) 
                                PROJECT_NAME="java"; PROJECT_DIR="$PROJECT_DIR/java/static" ;;
                            2)
                                PROJECT_NAME="hadoop"; PROJECT_DIR="$PROJECT_DIR/java/hadoop" ;;
                            *) exit 1 ;;
                        esac
                        ;;
                    6)
                        PROJECT_NAME="swift"; PROJECT_DIR="$PROJECT_DIR/swift" ;;
                    *) exit 1 ;;
                esac
                ;;
            2) 
                PROJECT_DIR="$PROJECT_DIR/scripting"
                echo "Select Scripting Type:"
                echo "1) Bash"
                echo "2) Batch"
                echo "3) Lua"
                echo "4) Perl"
                echo "5) Powershell"
                echo "6) Python"
                echo "7) Ruby"
                echo "8) Rust"
                read -p "> " choice
                case $choice in
                    1)
                        PROJECT_NAME="bash"; PROJECT_DIR="$PROJECT_DIR/bash" ;;
                    2) 
                        PROJECT_NAME="batch"; PROJECT_DIR="$PROJECT_DIR/batch" ;;
                    3)
                        PROJECT_NAME="lua"; PROJECT_DIR="$PROJECT_DIR/lua" ;;
                    4)
                        PROJECT_NAME="perl"; PROJECT_DIR="$PROJECT_DIR/perl" ;;
                    5) 
                        PROJECT_NAME="powershell"; PROJECT_DIR="$PROJECT_DIR/powershell" ;;
                    6) 
                        PROJECT_NAME="python"; PROJECT_DIR="$PROJECT_DIR/python" ;;
                    7) 
                        PROJECT_NAME="ruby"; PROJECT_DIR="$PROJECT_DIR/ruby" ;;
                    8)
                        PROJECT_NAME="rust"; PROJECT_DIR="$PROJECT_DIR/rust" ;;
                     *) exit 1 ;;
                esac
                ;;
            *) exit 1 ;;
        esac
        ;;
    2)
        PROJECT_DIR="functional"
        echo "Select Data Type:"
        echo "1) JSON"
        echo "2) XML"
        echo "3) YAML"
        read -p "> " choice
        case $choice in
            1) PROJECT_DIR="$PROJECT_DIR/json"; PROJECT_NAME="json" ;;
            2) PROJECT_DIR="$PROJECT_DIR/xml"; PROJECT_NAME="xml" ;;
            3) PROJECT_DIR="$PROJECT_DIR/yaml"; PROJECT_NAME="yaml" ;;
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
                read -p "> " choice
                case $choice in
                    1) 
                        PROJECT_NAME="aspnet"; PROJECT_DIR="$PROJECT_DIR/aspnet" ;;
                    2)
                        PROJECT_NAME="django"; PROJECT_DIR="$PROJECT_DIR/django" ;;
                    3)
                        PROJECT_NAME="express"; PROJECT_DIR="$PROJECT_DIR/express" ;;
                    4)
                        PROJECT_NAME="fastapi"; PROJECT_DIR="$PROJECT_DIR/fastapi" ;;
                    5)
                        PROJECT_NAME="flask"; PROJECT_DIR="$PROJECT_DIR/flask" ;;
                    6)
                        PROJECT_NAME="rails"; PROJECT_DIR="$PROJECT_DIR/rails" ;;
                    7)
                        PROJECT_NAME="springboot"; PROJECT_DIR="$PROJECT_DIR/springboot" ;;
                    *) exit 1 ;;
                esac
                ;;
            2)
                PROJECT_DIR="$PROJECT_DIR/frontend"
                echo "Select Frontend Framework:"
                echo "1) Angular"
                echo "3) HTML"
                echo "2) React"
                echo "4) Vue"
                read -p "> " choice
                case $choice in
                    1)
                        PROJECT_NAME="angular"; PROJECT_DIR="$PROJECT_DIR/angular" ;;
                    2)
                        PROJECT_NAME="html"; PROJECT_DIR="$PROJECT_DIR/html"
                        echo "Select HTML Environment:"
                        echo "1) Static HTML"
                        echo "2) Apache"
                        echo "3) Nginx"
                        read -p "> " choice
                        case $choice in
                            1)
                                PROJECT_NAME="html"; PROJECT_DIR="$PROJECT_DIR/html/static" ;;
                            2)
                                PROJECT_NAME="apache"; PROJECT_DIR="$PROJECT_DIR/html/apache" ;;    
                            3)
                                PROJECT_NAME="nginx"; PROJECT_DIR="$PROJECT_DIR/html/nginx" ;;
                            *) exit 1 ;;
                        esac
                        ;;
                    3)
                        PROJECT_NAME="react"; PROJECT_DIR="$PROJECT_DIR/react" ;;
                    4)
                        PROJECT_NAME="vue"; PROJECT_DIR="$PROJECT_DIR/vue" ;;
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
                    1)
                        PROJECT_NAME="laravel"; PROJECT_DIR="$PROJECT_DIR/laravel" ;;
                    2)
                        PROJECT_NAME="nextjs"; PROJECT_DIR="$PROJECT_DIR/nextjs" ;;
                    *) exit 1 ;;
                esac
                ;;
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

    if [ -d "$BASE_PATH/$PROJECT_NAME" ]; then
        PROJECT_PATH="$BASE_PATH/$PROJECT_NAME"
    else
        PROJECT_PATH="$BASE_PATH/$PROJECT_DIR"
    fi

    if [ ! -d "$PROJECT_PATH" ]; then
        echo "Import Path Does Not Exist: $PROJECT_PATH"
        exit 1
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
docker compose up -d --force-recreate "$PROJECT_NAME"

docker compose exec -it "$PROJECT_NAME" bash