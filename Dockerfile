FROM python:latest

RUN pip install mkdocs
WORKDIR mkdocs
ADD entrypoint.sh entrypoint.sh

EXPOSE 8000
ENTRYPOINT ["/mkdocs/entrypoint.sh"]
