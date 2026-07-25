#!/bin/bash

select_app() {
    echo "Select Project Type:"
    echo "1) Application"
    echo "2) Data Processing"
    echo "3) Website"
    read -p "> " type

    case $type in
        1)
            PROJECT_DIR="application"
            echo "1) Compiled  2) Interpreted"
            read -p "> " choice
            case $choice in
                1)
                    PROJECT_DIR="$PROJECT_DIR/compiled"
                    echo "1) C  2) C#  3) .NET  4) C++  5) Go  6) Java  7) Rust  8) Swift"
                    read -p "> " choice
                    case $choice in
                        1) PROJECT_NAME="c";      PROJECT_DIR="$PROJECT_DIR/c" ;;
                        2) PROJECT_NAME="csharp";  PROJECT_DIR="$PROJECT_DIR/csharp" ;;
                        3) PROJECT_NAME="dotnet";  PROJECT_DIR="$PROJECT_DIR/dotnet" ;;
                        4) PROJECT_NAME="cpp";     PROJECT_DIR="$PROJECT_DIR/cpp" ;;
                        5) PROJECT_NAME="go";      PROJECT_DIR="$PROJECT_DIR/go" ;;
                        6) PROJECT_NAME="java";    PROJECT_DIR="$PROJECT_DIR/java" ;;
                        7) PROJECT_NAME="rust";    PROJECT_DIR="$PROJECT_DIR/rust" ;;
                        8) PROJECT_NAME="swift";   PROJECT_DIR="$PROJECT_DIR/swift" ;;
                        *) exit 1 ;;
                    esac
                    ;;
                2)
                    PROJECT_DIR="$PROJECT_DIR/interpreted"
                    echo "1) Bash  2) Batch  3) Lua  4) Perl  5) Powershell  6) Python  7) Ruby"
                    read -p "> " choice
                    case $choice in
                        1) PROJECT_NAME="bash";       PROJECT_DIR="$PROJECT_DIR/bash" ;;
                        2) PROJECT_NAME="batch";      PROJECT_DIR="$PROJECT_DIR/batch" ;;
                        3) PROJECT_NAME="lua";        PROJECT_DIR="$PROJECT_DIR/lua" ;;
                        4) PROJECT_NAME="perl";       PROJECT_DIR="$PROJECT_DIR/perl" ;;
                        5) PROJECT_NAME="powershell"; PROJECT_DIR="$PROJECT_DIR/powershell" ;;
                        6) PROJECT_NAME="python";     PROJECT_DIR="$PROJECT_DIR/python" ;;
                        7) PROJECT_NAME="ruby";       PROJECT_DIR="$PROJECT_DIR/ruby" ;;
                        *) exit 1 ;;
                    esac
                    ;;
                *) exit 1 ;;
            esac
            ;;
        2)
            PROJECT_DIR="dataformat"
            echo "1) JSON  2) XML  3) YAML  4) CSV  5) RSS"
            read -p "> " choice
            case $choice in
                1) PROJECT_NAME="json"; PROJECT_DIR="$PROJECT_DIR/json" ;;
                2) PROJECT_NAME="xml";  PROJECT_DIR="$PROJECT_DIR/xml" ;;
                3) PROJECT_NAME="yaml"; PROJECT_DIR="$PROJECT_DIR/yaml" ;;
                4) PROJECT_NAME="csv";  PROJECT_DIR="$PROJECT_DIR/csv" ;;
                5) PROJECT_NAME="rss";  PROJECT_DIR="$PROJECT_DIR/rss" ;;
                *) exit 1 ;;
            esac
            ;;
        3)
            PROJECT_DIR="website"
            echo "1) Backend  2) Frontend  3) Fullstack"
            read -p "> " choice
            case $choice in
                1)
                    PROJECT_DIR="$PROJECT_DIR/backend"
                    echo "1) ASP.NET  2) Django  3) Express  4) FastAPI  5) Flask  6) Rails  7) Springboot  8) Rocket"
                    read -p "> " choice
                    case $choice in
                        1) PROJECT_NAME="aspnet";     PROJECT_DIR="$PROJECT_DIR/aspnet" ;;
                        2) PROJECT_NAME="django";     PROJECT_DIR="$PROJECT_DIR/django" ;;
                        3) PROJECT_NAME="express";    PROJECT_DIR="$PROJECT_DIR/express" ;;
                        4) PROJECT_NAME="fastapi";    PROJECT_DIR="$PROJECT_DIR/fastapi" ;;
                        5) PROJECT_NAME="flask";      PROJECT_DIR="$PROJECT_DIR/flask" ;;
                        6) PROJECT_NAME="rails";      PROJECT_DIR="$PROJECT_DIR/rails" ;;
                        7) PROJECT_NAME="springboot"; PROJECT_DIR="$PROJECT_DIR/springboot" ;;
                        8) PROJECT_NAME="rocket";     PROJECT_DIR="$PROJECT_DIR/rocket" ;;
                        *) exit 1 ;;
                    esac
                    ;;
                2)
                    PROJECT_DIR="$PROJECT_DIR/frontend"
                    echo "1) Apache  2) Nginx  3) React  4) Angular  5) Vue  6) Vite"
                    read -p "> " choice
                    case $choice in
                        1) PROJECT_NAME="apache";  PROJECT_DIR="$PROJECT_DIR/apache" ;;
                        2) PROJECT_NAME="nginx";   PROJECT_DIR="$PROJECT_DIR/nginx" ;;
                        3) PROJECT_NAME="react";   PROJECT_DIR="$PROJECT_DIR/react" ;;
                        4) PROJECT_NAME="angular"; PROJECT_DIR="$PROJECT_DIR/angular" ;;
                        5) PROJECT_NAME="vue";     PROJECT_DIR="$PROJECT_DIR/vue" ;;
                        6) PROJECT_NAME="vite";    PROJECT_DIR="$PROJECT_DIR/vite" ;;
                        *) exit 1 ;;
                    esac
                    ;;
                3)
                    PROJECT_DIR="$PROJECT_DIR/fullstack"
                    echo "1) Laravel  2) Next.js"
                    read -p "> " choice
                    case $choice in
                        1) PROJECT_NAME="laravel"; PROJECT_DIR="$PROJECT_DIR/laravel" ;;
                        2) PROJECT_NAME="nextjs";  PROJECT_DIR="$PROJECT_DIR/nextjs" ;;
                        *) exit 1 ;;
                    esac
                    ;;
                *) exit 1 ;;
            esac
            ;;
        *) exit 1 ;;
    esac
}

echo "Setup Workspace:"
echo "1) New Project"
echo "2) Clear Projects"
read -p "> " mode

if [ "$mode" = "2" ]; then
    read -p "Clear Projects? (y/N): " confirm
    if [ "$confirm" = "y" ]; then
        sudo rm -rf apps/*
        docker ps -q | xargs -r docker stop >/dev/null 2>&1
        docker system prune -af >/dev/null 2>&1
        echo "Projects Cleared"
    fi
    exit 0
fi

if [ "$mode" != "1" ]; then
    exit 1
fi

SELECTED_NAMES=()
SELECTED_TEMPLATES=()

while true; do
    select_app
    SELECTED_NAMES+=("$PROJECT_NAME")
    SELECTED_TEMPLATES+=("$PROJECT_DIR")
    read -p "Add another app? (y/N): " add_more
    [ "$add_more" = "y" ] || break
done

read -p "Enter Project Name (leave blank for auto): " PROJECT_ID
if [ -z "$PROJECT_ID" ]; then
    PROJECT_ID=$(printf "%02d" $(( $(ls -1d apps/* 2>/dev/null | wc -l) + 1 )))
fi

BASE_PATH="$(pwd)/apps/$PROJECT_ID"

for i in "${!SELECTED_NAMES[@]}"; do
    name="${SELECTED_NAMES[$i]}"
    tmpl="${SELECTED_TEMPLATES[$i]}"
    mkdir -p "$BASE_PATH/$name"
    cp -a "./templates/$tmpl/src/." "$BASE_PATH/$name/"
done

for i in "${!SELECTED_NAMES[@]}"; do
    name="${SELECTED_NAMES[$i]}"
    tmpl="${SELECTED_TEMPLATES[$i]}"
    docker build -t "dev-$name:latest" "./templates/$tmpl"
done

POD_YAML="$BASE_PATH/pod.yaml"
{
    echo "apiVersion: v1"
    echo "kind: Pod"
    echo "metadata:"
    echo "  name: $PROJECT_ID"
    echo "spec:"
    echo "  containers:"
    for name in "${SELECTED_NAMES[@]}"; do
        echo "  - name: $name"
        echo "    image: dev-$name:latest"
        echo "    imagePullPolicy: Never"
        echo "    stdin: true"
        echo "    tty: true"
        echo "    volumeMounts:"
        echo "    - name: ${name}-src"
        echo "      mountPath: /app"
    done
    echo "  volumes:"
    for name in "${SELECTED_NAMES[@]}"; do
        echo "  - name: ${name}-src"
        echo "    hostPath:"
        echo "      path: $BASE_PATH/$name"
        echo "      type: Directory"
    done
} > "$POD_YAML"

kubectl apply -f "$POD_YAML"
kubectl wait --for=condition=Ready pod/"$PROJECT_ID" --timeout=60s
kubectl attach -it "$PROJECT_ID" -c "${SELECTED_NAMES[0]}"
