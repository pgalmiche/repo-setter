# Repo Setter

[![pipeline status](https://gitlab.com/pgalmiche/repo-setter/badges/main/pipeline.svg)](https://gitlab.com/pgalmiche/repo-setter/-/commits/main)
[![Latest Release](https://gitlab.com/pgalmiche/repo-setter/-/badges/release.svg)](https://gitlab.com/pgalmiche/repo-setter/-/releases)

## In a hurry?

Open a terminal in your project folder and copy-paste the command proposed in [the script](#script) section:

```bash
curl https://gitlab.com/pgalmiche/repo-setter/-/raw/main/scripts/config-init | bash
```

Answer the questions in the terminal to set your preferences and everything will be installed automatically.

For more details, look at the [documentation](https://pgalmiche.gitlab.io/repo-setter/).

## Table of contents

<details>
  <summary>Look at the content</summary>

- [In a hurry?](#in-a-hurry?)
- [Contributor(s)](#contributors)
- [Installation](#installation)
  - [Script](#script)
  - [Manual](#manual)
- [Utilities](#utilities)
  - [File management](#file-management)
  - [Automation with Doxygen](#automation-with-doxygen)
  - [Make and its Makefile](#make-and-its-makefile)
    - [Make installation](#make-installation)
    - [Make usage](#make-usage)
  - [Docker](#docker)
    - [Docker Installation](#docker-installation)
    - [Docker basic use](#docker-basic-use)
    - [Docker volumes and environment variables](#docker-volumes-and-environment-variables)
- [Demos](#demos)
- [Customization](#customization)
- [Some useful tools](#some-useful-tools)
  - [Lazygit and Lazydocker](#lazygit-and-lazydocker)

</details>

## Contributors

- [Pierre Galmiche](https://pgalmiche.gitlab.io/)

## Installation

<details>
  <summary>With a script</summary>
### Script

You can initialize your repo with the following command:

```bash
curl https://gitlab.com/pgalmiche/repo-setter/-/raw/main/scripts/config-init | bash
```

</details>

<details>
  <summary>Manually</summary>
### Manual

Or you can clone it with the command:

```bash
git clone https://gitlab.com/pgalmiche/repo-setter.git
```

To install the submodules in their last version, use the command:

```bash
git submodule update --init --recursive
```

</details>

## Dependencies

This project uses [docker](https://www.docker.com/) and [docker compose](https://docs.docker.com/compose/) to automatically set up its dependencies for usage or development.

A [makefile](https://makefiletutorial.com/) is used to run the various commands, for development in a docker container and to generate the documentation with simple commands.

<details>
  <summary>Files organization</summary>

### File management

You can find in this repository the following folders:

- doc: contains the doxygen files for automatic documentation
- install: contains the files to create and manage docker containers
- scripts: contains the script to add the repo-setter files

The files available are:

- Makefile: contains commands for automation. See [corresponding section](#make-and-its-makefile)
</details>

<details>
  <summary>Automatic documentation</summary>
### Documentation automation with Doxygen

[This project documentation](https://pgalmiche.gitlab.io/repo-setter/) has been automatically generated using the [doxygen software](https://www.doxygen.nl/).

The [doxygen-awesome-css](https://github.com/jothepro/doxygen-awesome-css) git submodule is used for its personalized theme.

The generated documentation is automatically pushed to the GitLab project page using the `.gitlab-ci.yml` file.

</details>
<details>
  <summary>Makefile usage</summary>

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

</details>

<details>
  <summary>Docker usage </summary>

### Docker

When using docker, you need to:

- 1. Build `image(s)` (an image is like a virtual machine with all the required dependencies in it)
- 2. Run the image(s) in a `container` (equivalent to turning on the virtual machine)
- 3. Stop the container when you no longer need it.
- 4. (optional) Remove the docker image(s) from you computer

Then, according to your use, you can develop in the "running" container(s), or simply run them to run your code.

#### Docker Installation

You can follow the instructions given in the [docker.com docs](https://docs.docker.com/engine/install/) to install docker on your computer.

If you installed the Docker Desktop, you already have docker compose. Else, [follow the instructions](https://docs.docker.com/compose/install/) of the documentation.

#### Docker basic use

1. Build

In this project, you can simply run the following to build the docker images you need:

```bash
make build_docker
```

Once the image is build on your computer you just need to start and stop the containers.

2. Run

To run your containers, use:

```bash
make docker_run
```

This command will run the docker containers from the image you previously have build.
The containers can contain servers or just run a specific command.

3. Stop

To stop your containers and delete them, use:

```bash
make docker_stop
```

Use this command to remove the container you created, or stop them if they were not stopped (server).

4. Remove

Once you are done with the use of the project, you can remove all the images with:

```bash
make docker_images_removal
```

#### Docker volumes and environment variables

To specify where to load/save data, you can [mount volumes](https://docs.docker.com/storage/volumes/) to your containers.

Specify the important variables in the install/.env file

</details>

## Demos

You can find various demos in the corresponding folder.
For more information, look at the [documentation](https://pgalmiche.gitlab.io/repo-setter/).

<details>
  <summary>To go further in the configuration</summary>

## Customization

You can customize this repo by:

- adding your own development code
- adding new targets to the makefile
- adding the .env variables for the docker volume management
- changing the /doc/Doxyfile to personalize the documentation
- adding scripts of your convenience/personalizing the git submodules/CI

More details are to come in this section.

## Some useful tools

### Lazygit and Lazydocker

To manage your git repository and docker, you can use the powerful tools created by `Jesse Duffield`:

- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Lazydocker](https://github.com/jesseduffield/lazydocker)
</details>
