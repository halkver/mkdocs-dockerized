# mkdocs-dockerized
Docker image to produce and serve mkdocs projects

## Build docker image
```bash
$ docker build -t mkdocs .
```

## Produce
Use the path to an existing mkdocs project (NB: do not change '/mkdocs/project') and redirect it to a tar.gz file.
Example:
```bash
$ docker run -v "/path/to/your/mkdocs/project:/mkdocs/project" mkdocs produce > my_project.tar.gz
```

## Serve
Pipe the tar.gz file to the serve command. 
Example:
```bash
$ cat my_project.tar.gz | docker run --rm -p 8000:8000 -i mkdocs serve
```

## mkdockerize.sh
For easy usage you can use the mkdockerize wrapper script that calls produce and serve given a mkdocs project
Example:
```bash
$ ./mkdockerize.sh /path/to/your/mkdocs/project
```
