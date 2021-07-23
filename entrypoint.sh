#! /bin/sh
produce_help(){
    echo "Mount your mkdocs folder to '/mkdocs/project'"
    echo "Example:"
    echo "docker run -v \"/path/to/your/mkdocs/project:/mkdocs/project\" " \
         "mkdocs produce > my_project.tar.gz "
}

produce() {
    # Uses a predetermined folder 'project' and
    # builds + compresses the mkdocs project to stdout
    cd project
    mkdocs build
    tar czf - .
}

serve_help(){
    echo "Use a compressed mkdocs project and map port 8000 to 8000"
    echo "Example:"
    echo "cat my_project.tar.gz | docker run --rm -p 8000:8000 -i mkdocs serve"
}

serve() {
    # Uses a compressed mkdocs project from stdin and serves it port 8000
    mkdir /opt/www
    tar xzf - -C /opt/www
    cd /opt/www
    mkdocs serve -a 0.0.0.0:8000
}

get_help() {
    echo "You can either produce or serve a mkdocs project"
    echo "\nProduce help:"
    produce_help
    echo "\nServe help:"
    serve_help
}

case $1 in
    produce)
        produce
        ;;
    serve)
        serve
        ;;
    *)
        get_help
        ;;
esac
