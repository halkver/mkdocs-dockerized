#! /bin/sh
# Supports very simple usage, produces and serves a project in the gives path
if [ -z "$1" ]
  then
    echo "Please provide the path to a mkdocs project"
    echo "Example:"
    echo "./mkdockerize.sh /path/to/your/mkdocs/project"
    exit 1
fi
docker run -v "$1":/mkdocs/project mkdocs produce | docker run --rm -p 8000:8000 -i mkdocs serve
