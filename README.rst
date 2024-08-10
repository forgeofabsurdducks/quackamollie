============
Quackamollie
============

:Name: Quackamollie
:Package name: quackamollie
:Description: Run on your computer your own Telegram LLM chatbot using Ollama backed by models with Langchain or Llama-Index
:Version: 0.1rc0
:Main page: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie
:PyPI package: https://pypi.org/project/quackamollie/
:Docker Image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1rc0
:Build Status:
    :Master: |master_pipeline_badge| |master_coverage_badge|
    :Dev: |dev_pipeline_badge| |dev_coverage_badge|
:Quackamollie-Core Build Status:
    :Master: |core_master_pipeline_badge| |core_master_coverage_badge|
    :Dev: |core_dev_pipeline_badge| |core_dev_coverage_badge|

.. |master_pipeline_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/badges/master/pipeline.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/commits/master
   :alt: Master pipeline status
.. |master_coverage_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/badges/master/coverage.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/commits/master
   :alt: Master coverage status

.. |dev_pipeline_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/badges/dev/pipeline.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/commits/dev
   :alt: Dev pipeline status
.. |dev_coverage_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/badges/dev/coverage.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/commits/dev
   :alt: Dev coverage status

.. |core_master_pipeline_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/badges/master/pipeline.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/commits/master
   :alt: Quackamollie-core Master pipeline status
.. |core_master_coverage_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/badges/master/coverage.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/commits/master
   :alt: Quackamollie-core Master coverage status

.. |core_dev_pipeline_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/badges/dev/pipeline.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/commits/dev
   :alt: Quackamollie-core Dev pipeline status
.. |core_dev_coverage_badge| image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/badges/dev/coverage.svg
   :target: https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/commits/dev
   :alt: Quackamollie-core Dev coverage status

.. contents:: Table of Contents
    :depth: 3
    :local:
    :backlinks: none

----


Project description
===================
Quackamollie is a Telegram chat bot in Python using the library `aiogram` to serve LLM models running locally using Ollama.

This package is the main repository of the Quackamollie project.
It is a bundle of the `quackamollie-core <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core>`_ package with extra-dependencies to install application addons.
It also contains several `docker-compose.yml` files to easily deploy the application using docker.


About Quackamollie
------------------
This project aims to provide a Telegram chat bot for personal use and running on local desktop.
The goal of this project is to leverage LLM capabilities to help you in your daily life while ensuring you have full control over your personal data (modulo the Telegram part which we have no control over).
That is why this project aims to run locally.

What this project is:

- a Telegram chat bot that you have to run on your own, possibly using docker
- a project aiming for personal use and/or use with friends or family
- a project developed by currently one author and offered as an open source project by a non-profit association named the Forge of Absurd Ducks
- a project for informed users with basic knowledge about Python and Docker

What this project is NOT:

- it is NOT a platform with maintained servers aiming to provide service to a large number of users (you have to run it on your own)
- it is NOT a commercial project


Project Structure
-----------------
The Quackamollie project is composed of several Python packages released and versioned independently.
This helps modularity and installing only the parts you need of the whole project.
Also, it should enable users to easily implement new models by inheriting dedicated metaclass automatically discovered at runtime.
The supported models are currently models directly served by the Ollama API (doesn't require metaclass) or models implemented using Langchain or Llama-Index.

If needed, the project also enables more advanced users to implement their own model managers supporting other technologies than Langchain or Llama-Index.

The current list of all Quackamollie's projects is:

- `this repository <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie>`_ for easy installation of quackamollie's components
- `quackamollie-core <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core>`_, the core of the application in Python, including database management
- model managers in Python to serve models through Telegram

  - `quackamollie-ollama-model-manager <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/model_managers/quackamollie_ollama_model_manager>`_ exposes models served by the Ollama API
  - `quackamollie-langchain-model-manager <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/model_managers/quackamollie_langchain_model_manager>`_ exposes custom models using Langchain
  - `quackamollie-llama-index-model-manager <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/model_managers/quackamollie_llama_index_model_manager>`_ exposes custom models using Llama-Index
- models in Python to answer requests in natural language through Telegram

  - `quackamollie-langchain-simple-model <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/models/langchain/quackamollie_model_langchain_simple>`_ uses Langchain to request Ollama models, with a simple context prompt
  - `quackamollie-llama-index-simple-model <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/models/llama_index/quackamollie_model_llama_index_simple>`_ uses Llama-Index to request Ollama models, with a simple context prompt
- `quackamollie-devtools <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/cli/quackamollie_devtools>`_ implements additional CLI tools to help developers
- `quackamollie_workflows <https://gitlab.com/forge_of_absurd_ducks/quackamollie/ops/quackamollie_workflows>`_ is a repository containing common CI/CDs for Quackamollie's projects
- `quackamollie_ops <https://gitlab.com/forge_of_absurd_ducks/quackamollie/ops/quackamollie_ops>`_ is a template repository to auto-deploy quackamollie using docker-compose on your local desktop with your own gitlab-runner


Roadmap
-------
We have a lot of features in mind for Quackamollie.

We are currently finalizing the release of the first stable versions (0.1) of all projects listed above.

Then, we will work on new functionalities such as (not ordered):

- new models (including RAG, multimodal support of pictures, etc.)
- new tools for the models (including calendars, todolist, item lists for groceries, etc.)
- new boilerplates to simplify creation of models, model tools, model managers and CLI commands
- improving the `/settings` or other in-chat functionalities
- testing the support of Python 3.12
- support of images and documents
- in-chat admin ability to hide models
- in-chat admin ability to define custom models with custom parameters through model_config
- in-chat user ability to override chat type to private for chats where the user is alone with the bot
- in-chat user ability to manage resource namespaces which manages uploaded files visibility across chats
- in-chat admin ability to manage globally available model-tools
- in-chat admin ability to reload the list of available models

The documentation also needs a lot of improvements, sorry for the inconvenience.

- Each project automatically generates its own documentation and expose it using Gitlab pages. The documentation link is referenced at the top of each project.
- This repository is the main entrypoint for all Quackamollie's projects but it doesn't provide yet dedicated Gitlab pages.
  Therefore, we are planning to write a more advanced and complete documentation website alongside this repository.

We may also release additional tutorials on other platforms (maybe videos).


Quickstart
==========
This section covers all you need to do to deploy your own Quackamollie chat bot.

The following tutorials have been tested on an Ubuntu 22.04 architecture using Python 3.10.
However, commands based on docker should be customizable for other distributions or OS.


Installation/Deployments methods
--------------------------------

TODO: Convert to static urls instead of relative ones

It is recommended to install or deploy the project one of the following ways:

- `Install Ollama locally and deploy Quackamollie in Docker <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/tree/master/docs/install/install_ollama_locally.rst>`_
- `Deploy Ollama and Quackamollie in Docker <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/tree/master/docs/install/install_full_docker.rst>`_ (**easiest** and recommended method)
- If you want to **automatically deploy** Ollama and Quackamollie in Docker using **your own gitlab-runner** on your own computer,
  we kindly invite you to follow the tutorial of the `quackamollie_ops <https://gitlab.com/forge_of_absurd_ducks/quackamollie/ops/quackamollie_ops>`_ repository


Configuration methods
---------------------

Environment variables
~~~~~~~~~~~~~~~~~~~~~
Configuration can be done using environment variables prefixed by `QUACKAMOLLIE_`.
The list of available options can be obtained by running `quackamollie --help` and `quackamollie serve --help`.

To ease deployment, you can set environment variables using protected variables in your automation tool
or create a `.env`, `.envrc` or `envrc` file and load it using, for example, `source envrc`.

|

This is a list of the most commonly used environment variables:

- `QUACKAMOLLIE_CONFIG_FILE` allows you to specify a configuration file for Quackamollie
- `QUACKAMOLLIE_BOT_TOKEN` is for the bot token you can retrieve from `Telegram BotFather <https://core.telegram.org/bots/features#botfather>`_
- `QUACKAMOLLIE_ADMIN_IDS` is a list of Telegram user IDs separated by commas without space, specifying the administrators of your Quackamollie instance
- `QUACKAMOLLIE_MODERATOR_IDS` is a list of Telegram user IDs separated by commas without space, specifying the moderators of your Quackamollie instance
- `QUACKAMOLLIE_USER_IDS` is a list of Telegram user IDs separated by commas without space, specifying the basic users of your Quackamollie instance
- `QUACKAMOLLIE_DB_HOST` is the hostname of your Postgres database, if you run it locally it is probably `0.0.0.0`,
  else if you run it in docker it is probably `quackamollie_postgres`
- `QUACKAMOLLIE_DB_PORT` is the port of your Postgres database, typically it is `5432`
- `QUACKAMOLLIE_DB_NAME` is the name of your Postgres database dedicated to Quackamollie, it is typically `quackamollie`
- `QUACKAMOLLIE_DB_USERNAME` is the username to connect to your Postgres database
- `QUACKAMOLLIE_DB_PASSWORD` is the password to connect to your Postgres database
- `QUACKAMOLLIE_OLLAMA_BASE_URL` is the URL of your Ollama instance, if you run it locally the URL is typically `http://0.0.0.0:11434`,
  or if it runs in docker the URL is typically `http://${QUACKAMOLLIE_OLLAMA_HOST:-quackamollie-ollama}:11434`

Additionally, if you are using the `docker-compose.yml` files, you can set these variables:

- `POSTGRES_DOCKER_TAG` overrides the tag to use for the Postgres docker image, by default it is `16`
- `OLLAMA_DOCKER_TAG` overrides the tag to use for the Ollama docker image, by default it is `latest`
- `QUACKAMOLLIE_OLLAMA_HOST` overrides the Ollama hostname and is used to infer the `QUACKAMOLLIE_OLLAMA_BASE_URL` environment variable,
  by default it is `quackamollie-ollama`
- `QUACKAMOLLIE_DOCKER_TAG` overrides the tag to use for the Quackamollie docker images, by default it is `latest`

If you are using the additional `gpu.docker-compose.yml` file to enable GPU in Ollama:

- `OLLAMA_GPU_DRIVER` overrides the driver to use for your GPU in your Ollama instance, by default it is `nvidia`
- `OLLAMA_GPU_COUNT` overrides the GPU count available in your Ollama instance, by default it is `1`

If you are using the additional `open-webui.docker-compose.yml` file to deploy an Open WebUI instance:

- `OPEN_WEBUI_DOCKER_TAG` overrides the tag to use for Open WebUI docker images, by default it is `latest`
- `OPEN_WEBUI_HOST` overrides the hostname of your Open WebUI instance, by default it is `quackamollie-open-webui`
- `OPEN_WEBUI_PORT` overrides the port on which your Open WebUI instance is served, by default it is `3000`

|

If you're using the default values and no configuration file, then **the minimal environment variables you should set are**:

- `QUACKAMOLLIE_BOT_TOKEN` must be set to a valid value given by the `BotFather <https://core.telegram.org/bots/features#botfather>`_
- `QUACKAMOLLIE_DB_USERNAME` should be set to secure your Postgres database
- `QUACKAMOLLIE_DB_PASSWORD` should be set to secure your Postgres database
- `QUACKAMOLLIE_ADMIN_IDS` should typically at least contain your own Telegram ID or you will not be able to request your bot

**N.B**: If you don't know your own ID, please start the bot without specifying it, then send one message that will be rejected
and finally retrieve your ID from the logs or `user_filter` files, as explained in `Add a user ID <Add a user ID>`_.


Configuration file (optional)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Alternatively, you can configure your instance with a configuration file.
Examples are given in the `config/examples folder <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/tree/master/config/examples>`_.
You can copy and adapt the given example `config/examples/config.yml`.
If needed, a configuration file example `config/examples/config_with_logging.yml` shows how to set more advanced logging.

Alternatively, you can directly download the `config.yml` file from the repository and then adapt it to your needs:

.. code-block:: bash

  wget https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/config/examples/config.yml

As shown in the example below, your configuration file may contain a section `db` to allow initialization of the
Postgres database using `quackamollie db alembic` commands.
If you want to avoid duplicated entries between `serve` and `db` sections, you may want to use `environment variables <Environment variables>`_ instead.

This is an example of what your configuration file can look like:

.. code-block:: yaml

  serve:
    bot_token: **********:***********************************
    admin_ids: 0123456789,9876543210
    moderator_ids: 9999999999
    user_ids: 0000000000,1111111111,2222222222,3333333333,4444444444
    default_model_manager: ollama
    default_model: llama3:latest
    db_host: 0.0.0.0
    db_port: 5432
    db_username: quackamollie
    db_password: **************************************************
    db_name: quackamollie
  db:
    db_host: 0.0.0.0
    db_port: 5432
    db_username: quackamollie
    db_password: **************************************************
    db_name: quackamollie


Post-installation generic methods
---------------------------------
In these subsections, we present post-installations steps which requires your bot to be started.
These subsections show what you can expect to see in Telegram and how to change your settings to get started.

Test your bot in Telegram
~~~~~~~~~~~~~~~~~~~~~~~~~
- Start a chat with your bot on Telegram and send `/start` to register.

- If you receive an error message like the following, jump to the `next subsection <Add a user ID>`_ and then retry the `/start` command

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/access_denied.png
   :alt: Error message in Telegram chat showing the text "Access denied. This is a private bot for private use. Try contacting the administrator if you know them, else please do NOT write to me again."
   :align: center

- If you receive an answer like this one, this means your bot is running and you registered successfully

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/start_command.png
   :alt: Answer expected when using the `/start` command for the first time
   :align: center

- Additionally, you can check the user was created in the database by using `pgcli`

.. code-block:: bash

  pip install pgcli
  pgcli -U "${QUACKAMOLLIE_DB_USERNAME}" -h "${QUACKAMOLLIE_DB_HOST}" -p "${QUACKAMOLLIE_DB_PORT}" "${QUACKAMOLLIE_DB_NAME}"
  SELECT * FROM users;

- If you didn't set a default model and model manager and you sent a message to the bot, you should expect an answer like this one:

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/error_model_not_set.png
   :alt: Error message in Telegram chat showing the text "No valid model manager is set for this chat. Please use /settings to set a model."
   :align: center

- Navigate to `Chat Settings` (use `/settings` if needed)

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/settings_no_default_model.png
   :alt: Answer expected when navigating to the `Chat Settings` section
   :align: center

- Choose a model in the `Chat Settings/Model Management` section.
  The image below shows the expected output when quackamollie is installed with the extra-dependencies `common` and the model `llama3:latest` have been pulled.

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/model_management_common_install.png
   :alt: Answer expected when navigating to the `Chat Settings/Model Management` section, for `quackamollie[common]` install
   :align: center

- After choosing a model, you should expect an output like this one. Here, we chose the model `🦙☝️ llama-index | 🦙☝️ simple-llama-index` for demonstration.

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/model_llama_index_simple_chosen.png
   :alt: Answer expected when choosing the model `llama-index | simple-llama-index` in the `Chat Settings/Model Management` section
   :align: center

- If you hit the `Go Back` button, you should see your choice listed

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/settings_llama_index_simple_chosen.png
   :alt: Answer expected when navigating to the `Chat Settings/Model Management` section after choosing the `llama-index | simple-llama-index` model
   :align: center

- Send the bot a message and you should obtain an answer like this one (this run was on a personal laptop without GPU, so it is to be expected that executions take more than 10 seconds)

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/hello_answer_llama_index_simple.png
   :alt: Answer expected when saying "Hello!" to the `llama-index | simple-llama-index` model
   :align: center


Add a user ID
~~~~~~~~~~~~~
- If you didn't know your Telegram user ID and the `/start` command gave you an answer like this one:

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/access_denied.png
   :alt: Error message in Telegram chat showing the text "Access denied. This is a private bot for private use. Try contacting the administrator if you know them, else please do NOT write to me again."
   :align: center

- then your ID should be listed in the data directory typically under `data/quackamollie/user_filter/unauthorized_activity.json`

- Alternatively, it should appear in the logs

- Once you retrieved your ID, change your configuration and restart your bot

- Try testing the bot again


If you've been banned
~~~~~~~~~~~~~~~~~~~~~
- If you encounter this error, it means you've been added to list of banned users by quackamollie for your bot instance.

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/user_banned.png
   :alt: Error message in Telegram chat showing the text "Access denied for too many requests. You are now officially banned from this bot and all your next messages will be totally ignored."
   :align: center

- There is only one way to unban a user, it is by manually editing the file `data/quackamollie/user_filter/banned_users.json`
  and removing the concerned user ID from it. Then you should change your configuration and restart your application for changes to take effects.

- Users are banned after less than 10 messages sent. It is a strict rule to improve security. We chose such a rule because this bot
  aims for private use, eventually with friends or family. Therefore, adding new users shouldn't be something you do much often
  and this helps a bit reducing attacks possibilities.

- Message of ban users are ignored by a dedicated `outer middleware <https://docs.aiogram.dev/en/latest/dispatcher/middlewares.html>`_ filtering input messages.


Adding models
~~~~~~~~~~~~~
To add models, please see the specific post-installation methods depending on the way you installed Quackamollie and Ollama.


Management in Telegram
======================
For now, in-app management is very limited, sorry for the inconvenience.

User Settings
-------------
This section of the settings shows actions a user can do depending on its rights and the current chat.

Documents management
~~~~~~~~~~~~~~~~~~~~
This section of settings is currently in development and should be released in quackamollie v0.2.


Chat Settings
-------------
This section of the settings shows actions a user can do in the current chat. It includes setting the model to use in the current chat.

Model management
~~~~~~~~~~~~~~~~
This subsection of the settings lists the available models for the current chat.
Models are listed through the automatically discovered model managers.


Admin Settings
--------------
This section of the settings enables administrators or moderators to manage the entire Quackamollie instance.
This section is currently in development and a first minimal version should be released in quackamollie v0.2.


Roadmap
-------
What we're currently aiming for is (ordered list):

- admin ability to reload available models
- admin ability to hide models
- admin ability to define custom models with custom parameters through model_config
- user ability to override chat type to private for chats where the user is alone with the bot
- user ability to manage resource namespaces which manages uploaded files visibility across chats
- admin ability to manage globally available model-tools


Extending Quackamollie's capacities
===================================

Adapting my own custom Python model
-----------------------------------
In writing, sorry for the inconvenience...


Developing my own model manager
-------------------------------
In writing, sorry for the inconvenience...


Local development of this package
=================================
The sections above are at destination of developers or maintainers of this Python package.

Virtual environment
-------------------
- Setup a virtual environment in python 3.10

.. code-block:: bash

   make venv
   # or
   python3 -m venv venv

- Activate the environment

.. code-block:: bash

   source venv/bin/activate

- If you want to deactivate the environment

.. code-block:: bash

   deactivate


Tests
-----

Tests requirements
~~~~~~~~~~~~~~~~~~
- Install test requirements

.. code-block:: bash

   make devtools
   # or
   pip install tox

Run pytest
~~~~~~~~~~
- Run the tests

.. code-block:: bash

   tox

Run lint
~~~~~~~~
- Run the lintage

.. code-block:: bash

   tox -e lint


Documentation
-------------
- Since this package is just a bundle, it contains no documentation. In future release, we may add to this repository
  a documentation with tutorials.

- If needed, an automatically generated version of the `quackamollie-core` documentation can be found
  at https://quackamollie-core-forge-of-absurd-ducks-quackamo-49d876569a9ad7.gitlab.io


Install
-------
- Install the application from sources

.. code-block:: bash

   make install
   # or
   pip install .

- Or install it from distribution

.. code-block:: bash

   pip install dist/quackamollie-0.1rc0.tar.gz

- Or install it from wheel

.. code-block:: bash

   pip install dist/quackamollie-0.1rc0.whl

- Or install it from PyPi repository

.. code-block:: bash

   pip install quackamollie  # latest
   # or
   pip install "quackamollie==0.1rc0"


Docker
------
- To build the application docker

.. code-block:: bash

   docker build --network=host -t quackamollie:0.1rc0 .

- The official Docker image of this project is available at: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie

- You can pull the image of the current release:

.. code-block:: bash

   docker pull registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:latest  # or dev
   # or
   docker pull registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1rc0


Docker-compose
--------------
- To run database using docker-compose, you must first set environment variables:

  - `QUACKAMOLLIE_CONFIG_FILE`: typically `config/config.yml`
  - `QUACKAMOLLIE_DB_HOST`: typically `0.0.0.0`
  - `QUACKAMOLLIE_DB_PORT`: typically `5432`
  - `QUACKAMOLLIE_DB_NAME`: typically `quackamollie`
  - `QUACKAMOLLIE_DB_USERNAME`: typically `quackamollie`
  - `QUACKAMOLLIE_DB_PASSWORD`: choose a strong admin password

- Then you can run:

.. code-block:: bash

   docker compose up
   # or to detach
   docker compose up -d

   # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
   sudo -E docker compose up


Database migration
------------------
- Quackamollie provides a wrapper for the `alembic` command which initializes the database info the same way they are
  initialized at runtime. You can call `alembic` by using instead `quackamollie db alembic`. For example:

.. code-block:: bash

   quackamollie db alembic --help

- However, for this to work you need to have in your current directory the file
  `alembic.ini <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/-/raw/master/alembic.ini>`_ and the directory
  `migrations/ <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/-/tree/master/migrations>`_ from the
  `quackamollie-core <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core>`_ repository

- Instead of downloading the files locally, we recommend you to run the dedicated docker image or to use `docker compose`

  - You can migrate using the `docker` image from our official docker registry.

  .. code-block:: bash

    docker run --rm --name quackamollie-migration \
    --network host \
    --mount type=bind,source="$(pwd)"/config/config.yml,target=/config/config.yml,readonly \
    registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1rc0 \
    -vvvv -c /config/config.yml db alembic upgrade head

    # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
    sudo -E docker run --rm --name quackamollie-migration \
    --network host \
    --mount type=bind,source="$(pwd)"/config/config.yml,target=/config/config.yml,readonly \
    registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1rc0 \
    -vvvv -c /config/config.yml db alembic upgrade head

  - Or you can achieve the same in a `docker-compose.yml` file as demonstrated in this repository

  .. code-block:: yaml

    services:
      quackamollie_db_migration:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1rc0
        container_name: quackamollie_db_migration
        command: "-vvvv -c /config/config.yml db alembic upgrade head"
        network_mode: host
        restart: no
        depends_on:
          - quackamollie_postgres
        volumes:
          - ${QUACKAMOLLIE_CONFIG_FILE}:/config/config.yml


Running the project
-------------------
Quackamollie provides a command tool line named `quackamollie`.
You can find examples of configuration files in the folder `config/examples`.

.. code-block:: bash

   quackamollie -vvvv -c config/config.yml serve

Pictures and demonstration videos will be included in the documentation in future releases.


Authors
=======

- **QuacktorAI** - *Initial work* - `quacktorai <https://gitlab.com/quacktorai>`_


Contributing
============
Currently, contributions are frozen because the project is still in very early stages and I have yet to push the whole architecture.

For more details on the general contributing mindset of this project, please refer to `CONTRIBUTING.md <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/tree/master/CONTRIBUTING.md>`_.


Credits
=======

Section in writing, sorry for the inconvenience.
