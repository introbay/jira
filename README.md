Docker + Chef Solo + Postgresql + Jira = Love!

License and Authors
-------------------
Author: Tom Eklöf
I am in no way affiliated with company Atlassian® or the Jira® product.


Description
-----------
This is Jira image with Postgresql.

Requirements
------------

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

