Docker + Jira + Database container = Love!

Introduction
-------------------
This is a fork from https://github.com/docker-atlassian/jira.
The main proposal is to have an updated version of the docker and with a separated database container, so everyone can choose either the database engine, create a new one or use an existing container.

Description
-----------
This is Jira image for using linked with a docker database container.

Requirements
------------
If you want to store your data in a production environment database, use one and link it from this container.
If you don't link any database container, then a SQLite database will be used.

Installation
------------
You can build the image yourself.

```bash
git clone https://github.com/ignaciolflores/jira.git
cd jira
docker build -t="$USER/jira:6.3" .
```

Quick Start
-------------
Pull the latest postgres version from the **Docker Trusted Build**.
```bash
docker pull sameersbn/postgresql:9.1-1
```

Create an instance of the docker database
```bash
docker run --name jira-postgresql -d \
  -e 'DB_USER=dbuser' -e 'DB_PASS=dbpass' -e 'DB_NAME=dbname' \
  sameersbn/postgresql:9.1-1
```

Create an instance of the Jira docker linked to the database docker image.
```bash
docker run --name jira -d \
    -p local_port:8080 \
    -v /local/dir/application-data:/opt/atlassian/application-data \
    --link jira-postgresql:db \
    "$USER"/jira:6.3 \
    /init.sh
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

