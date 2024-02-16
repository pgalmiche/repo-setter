# Demos


You can find various demos that you can use as a template for your project.
The main advantage of using docker compose in these project is that you don't need to install anything except for the docker images to run your projects.

Once you are done, you simply can remove the images.

# Available demos

## python

The demo uses a vedo display to show your how UI can be used in docker.
The image contains python 3.10 and installs the requirements present in the install/requirements.txt.
Finally the main.py script is launched automatically when running the container, showing the vedo display on the host machine.

## latex

This demo allows you to generate latex pdf without installing latex on your computer.
The docker image contains the latex dependencies.

When running, the container is accessible with `make docker_exec container=latex`.
Then inside it, you can simply use the make file in the demo to generate the pdf with references directly.

You also can use the CI file proposed to automatically generate a pdf on your online GitLab repository page.

## node_js

The node_js demo shows slides generated using the [revealjs](https://revealjs.com/) framework.

You can modify the template by directly modifying the files.
The docker container is running a server to display the output [locally on port 8000](http://localhost:8000).
