# Repo Setter


[![pipeline status](https://gitlab.com/pgalmiche/repo_setter/badges/main/pipeline.svg)](https://gitlab.com/pgalmiche/repo_setter/-/commits/main) 
[![Latest Release](https://gitlab.com/pgalmiche/repo_setter/-/badges/release.svg)](https://gitlab.com/pgalmiche/repo_setter/-/releases)

## Table of contents
- [Contributor(s)](#contributors)
- [Documentation](#documentation)
    - [File management](#file-management)
    - [Automation with Doxygen](#automation-with-doxygen)
- [Installation](#installation)
    - [Submodules](#submodules)
- [Usage](#usage)
    - [Make and its Makefile](#make-and-its-makefile)
        - [Make installation](#make-installation)
        - [Make usage](#make-usage)
    - [Docker](#docker)
        - [Build](#build)
        - [Run](#run)
        - [Stop](#stop)
        - [Remove](#remove)
- [Customization](#customization)
- [Some useful tools](#some-useful-tools)
    - [The repo_setter](#the-repo_setter)
    - [Lazygit and Lazydocker](#lazygit-and-lazydocker)

## Contributors

- [Pierre Galmiche](https://pgalmiche.gitlab.io/)


## Documentation

### File management

You can find in this repository the following folders:

- doc: contains the doxygen files for automatic documentation
- install: contains the files to create and manage docker containers
- scripts: contains the script to add the repo_setter files

The files available are:
- Makefile: contains commands for automation. See [corresponding section](#make-and-its-makefile)

### Automation with Doxygen
[This project documentation](https://pgalmiche.gitlab.io/repo_setter/) has been automatically generated using the [doxygen software](https://www.doxygen.nl/).

The [doxygen-awesome-css](https://github.com/jothepro/doxygen-awesome-css) git submodule is used for its personalized theme.

The generated documentation is automatically pushed to the GitLab project page using the `.gitlab-ci.yml` file.

## Installation

You can clone this repo with the command:
```bash
git clone https://gitlab.com/pgalmiche/repo_setter.git
```

### Submodules

To install the submodules in their last version, use the command:
```bash
git submodule update --init --recursive
```

## Usage

This project uses [docker](https://www.docker.com/) and [docker compose](https://docs.docker.com/compose/) to automatically set up its dependencies for usage or development.

A [makefile](https://makefiletutorial.com/) is used to run the various commands, for development in a docker container and to generate the documentation with simple commands.


### Make and its Makefile

#### Make installation

On Ubuntu, your can use the command:
```bash
sudo apt install build-essential
sudo apt install make
```

#### Make usage

Simply run:
```bash
make
```
to see the possible recipes. 

The help will show you how to use it: `make [target]`.

Example: 
```
make clean
```
will clean the folder by removing unwanted files.

### Docker

When using docker, you need to:

- 1) Build `image(s)` (an image is like a virtual machine with all the required dependencies in it)
- 2) Run the image(s) in a `container` (equivalent to turning on the virtual machine)
- 3) Stop the container when you no longer need it.
- 4) (optional) Remove the docker image(s) from you computer

Then, according to your use, you can develop in the "running" container(s), or simply run them to run your code. 

#### Build

In this project, you can simply run the following to build the docker images you need:
```bash
make build_docker
```

#### Run

To run your containers, use:
```bash
make docker_run
```

#### Stop

To stop your containers and delete them, use:
```bash
make docker_stop
```

#### Remove

To remove all the docker images creates for this project, use:
```bash
make docker_images_removal
```

## Customization

You can customize this repo by:

- adding your own development code
- adding new targets to the makefile
- adding the .env variables for the docker volume management
- changing the /doc/Doxyfile to personalize the documentation
- adding scripts of your convenience/personalizing the git submodules/CI

More details are to come in this section.

## Some useful tools

### The repo_setter

This project has been set up using the [repo_setter](https://gitlab.com/pgalmiche/repo_setter) git repository.

Its content has been added with the following command:
```bash
bash -c "$(curl -fsSL https://gitlab.com/pgalmiche/repo_setter/-/raw/main/scripts/config-init)"
```

### Lazygit and Lazydocker

To manage your git repository and docker, you can use the powerful tools created by `Jesse Duffield`:

- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Lazydocker](https://github.com/jesseduffield/lazydocker)
