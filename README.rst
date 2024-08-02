============
Quackamollie
============

:Name: Quackamollie
:Package name: quackamollie
:Description: Run on your computer your own Telegram LLM chatbot using Ollama backed by models with Langchain or Llama-Index
:Version: 0.1b0
:Main page: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie
:PyPI package: https://pypi.org/project/quackamollie/
:Docker Image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1b0
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

----

Project description
===================
Quackamollie is a Telegram chat bot in Python using the library `aiogram` to serve LLM models running locally using Ollama.

This package is the main repository of the Quackamollie project.
It is a bundle of the `quackamollie-core <https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core>`_ package with extra-dependencies to install application addons.
It also contains a `docker-compose.yml` file to easily deploy the application using docker.


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

- it is NOT a platform with servers aiming to provide service to a large number of users
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

The documentation also needs a lot of improvements, sorry for the inconvenience.

We may also release additional tutorials on other platforms.


Quickstart
==========
If you want to automatically deploy your own version of Quackamollie using your own gitlab-runner on your own computer,
we kindly invite you to look at the `quackamollie_ops <https://gitlab.com/forge_of_absurd_ducks/quackamollie/ops/quackamollie_ops>`_ repository
and possibly fork it.

Otherwise, you are in the right place to start running your own chat bot.
This section covers all you need to do to deploy your own Quackamollie chat bot.

The following tutorial has been tested on an Ubuntu 22.04 architecture using Python 3.10 but, since the deployment is based on docker images, it should be easy to adapt commands to other distributions or OS.


Requirements
------------
First, you should ensure you went through all requirements:

- Install Docker (instructions depend on your platform)
- Install `Ollama <https://ollama.com/>`_
- Pull an Ollama model, for example `llama3`

.. code-block:: bash

   ollama pull llama3

   # Alternatively, you can use a better model but also bigger (~8Go)
   ollama pull llama3:8b-instruct-q8_0

- `Create a new Telegram bot using the BotFather <https://core.telegram.org/bots/features#botfather>`_ and get your bot API token

- Clone the repository or acquire the `docker-compose.yml` file one of the following way:

  - Clone the git repository (recommended way):

  .. code-block:: bash

     git clone https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie
     cd quackamollie/

  - Or download the `docker-compose.yml` file from the repository:

  .. code-block:: bash

     wget https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/docker-compose.yml

  - Or copy (and adapt if needed) this code:

  .. code-block:: yaml

    services:
      quackamollie_postgres:
        image: postgres:14
        container_name: quackamollie_postgres
        environment:
          POSTGRES_USER: ${QUACKAMOLLIE_DB_USERNAME}
          POSTGRES_PASSWORD: ${QUACKAMOLLIE_DB_PASSWORD}
          POSTGRES_DB: ${QUACKAMOLLIE_DB_NAME}
        ports:
          - ${QUACKAMOLLIE_DB_HOST}:${QUACKAMOLLIE_DB_PORT}:5432
        network_mode: host
        restart: unless-stopped
        volumes:
          - ./data/quackamollie/database:/var/lib/postgresql/data

      quackamollie_db_migration:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1b0
        # pull_policy: always
        container_name: quackamollie_db_migration
        command: "-vvvv -c /config/config.yml db alembic upgrade head"
        network_mode: host
        restart: no
        depends_on:
          - quackamollie_postgres
        volumes:
          - ${QUACKAMOLLIE_CONFIG_FILE}:/config/config.yml

      quackamollie:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1b0
        # pull_policy: always
        container_name: quackamollie
        command: "-vvvv -c /config/config.yml serve"
        network_mode: host
        restart: unless-stopped
        depends_on:
          - quackamollie_postgres
          - quackamollie_db_migration
        volumes:
          - ${QUACKAMOLLIE_CONFIG_FILE}:/config/config.yml

  - Or if you want to run Ollama in Docker instead of installing it locally, you should check out the
    `quackamollie_ops <https://gitlab.com/forge_of_absurd_ducks/quackamollie/ops/quackamollie_ops>`_ repository



Configuration
-------------

Configuration file
~~~~~~~~~~~~~~~~~~

- Create a configuration file one of the following way:

  - If you cloned the git repository (recommended way), configuration file examples are located at `config/examples`. Copy and adapt one of the example:

  .. code-block:: bash

     cp config/examples/config.yml config/config.yml

     # If needed, another configuration file example is given to set more advanced logging
     cp config/examples/config_with_logging.yml config/config.yml

  - Or download the `config.yml` file from the repository:

  .. code-block:: bash

     wget https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/config/examples/config.yml

  - Or copy and adapt this code:

  .. code-block:: yaml

    serve:
        bot_token: YOUR_BOT_TOKEN__REQUIRED
        admin_ids: ADMIN_TELEGRAM_IDS_SEPARATED_BY_COMMAS_WITHOUT_SPACE
        moderator_ids: MODERATOR_TELEGRAM_IDS_SEPARATED_BY_COMMAS_WITHOUT_SPACE
        user_ids: USER_TELEGRAM_IDS_SEPARATED_BY_COMMAS_WITHOUT_SPACE
        # default_model_manager: MODEL_MANAGER_TO_USER_BY_DEFAULT__CAN_BE_EMPTY_OR_FOR_EXAMPLE_ollama
        # default_model: MODEL_MANAGER_TO_USER_BY_DEFAULT__CAN_BE_EMPTY_OR_FOR_EXAMPLE_llama3:latest
        db_protocol: YOUR_DATABASE_HOST__postgresql+asyncpg_BY_DEFAULT
        db_host: YOUR_DATABASE_HOST__0.0.0.0_BY_DEFAULT
        db_name: YOUR_DATABASE_NAME__quackamollie_BY_DEFAULT
        db_username: YOUR_DATABASE_USER
        db_password: YOUR_DATABASE_PASSWORD
        db_port: YOUR_DATABASE_PORT
        db_url: DIRECTLY_OVERRIDE_THE_WHOLE_DATABASE_URL_IF_NEEDED
    db:
        db_protocol: YOUR_DATABASE_HOST__postgresql+asyncpg_BY_DEFAULT
        db_host: YOUR_DATABASE_HOST__0.0.0.0_BY_DEFAULT
        db_name: YOUR_DATABASE_NAME__quackamollie_BY_DEFAULT
        db_username: YOUR_DATABASE_USER
        db_password: YOUR_DATABASE_PASSWORD
        db_port: YOUR_DATABASE_PORT
        db_url: DIRECTLY_OVERRIDE_THE_WHOLE_DATABASE_URL_IF_NEEDED


- Don't forget to change your configuration file with your own values, including the bot API token that you can get from `the Telegram BotFather <https://core.telegram.org/bots/features#botfather>`_. You may obtain a configuration file like this one:

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

- N.B: If you don't know your own user ID or others IDs, no worries. For now, just comment the concerned lines with '#'.
  This quickstart contains a dedicated section to help you retrieve your own ID once your bot is running.


(Optional) Environment variables file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- To ease deployment, you can create a `.env`, `.envrc` or `envrc` file with the following content:

.. code-block:: bash

  export QUACKAMOLLIE_CONFIG_FILE="config/config.yml"
  export QUACKAMOLLIE_DB_HOST="YOUR_DATABASE_HOST"
  export QUACKAMOLLIE_DB_PORT="YOUR_DATABASE_PORT"
  export QUACKAMOLLIE_DB_USERNAME="YOUR_DATABASE_USER"
  export QUACKAMOLLIE_DB_PASSWORD="YOUR_DATABASE_strong_PASSWORD"
  export QUACKAMOLLIE_DB_NAME="YOUR_DATABASE_NAME"

- Don't forget to change your environment file with your own values which should match what is declared in you configuration file.
  For example, let's suppose the previous configuration given in example is saved in the `config/config.yml` file, then your `.env` file should look like this:

.. code-block:: bash

  export QUACKAMOLLIE_CONFIG_FILE="config/config.yml"
  export QUACKAMOLLIE_DB_HOST="0.0.0.0"
  export QUACKAMOLLIE_DB_PORT="5432"
  export QUACKAMOLLIE_DB_USERNAME="quackamollie"
  export QUACKAMOLLIE_DB_PASSWORD="**************************************************"
  export QUACKAMOLLIE_DB_NAME="quackamollie"

- Then load your created environment file

.. code-block:: bash

  source .env  # or .envrc or envrc


Running the bot
---------------
- Run the downloaded docker-compose. The first time you should run:

.. code-block:: bash

  docker compose up

  # if you need to run using sudo, don't forget to add the '-E' option to pass environment variables
  sudo -E docker compose up

- After finalizing the tests and if everything works correctly, you may want to use '-d/--detach' option to run quackamollie in background

.. code-block:: bash

  docker compose up -d

  # if you need to run using sudo, don't forget to add the '-E' option to pass environment variables
  sudo -E docker compose up -d


Test your bot
-------------
- Start a chat with your bot on Telegram and send `/start` to register.

- If you receive an error message like the following, jump to the next sub-section and then retry the `/start` command

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/access_denied.png
   :alt: Error message in Telegram chat showing the text "Access denied. This is a private bot for private use. Try contacting the administrator if you know them, else please do NOT write to me again."

- If you receive an answer like this one, this means your bot is running and you registered successfully

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/start_command.png
   :alt: Answer expected when using the `/start` command for the first time

- Additionally, you can check the user was created in the database by using `pgcli`

.. code-block:: bash

  pip install pgcli
  source .env  # if you followed this tutorial
  pgcli -U "${QUACKAMOLLIE_DB_USERNAME}" -h "${QUACKAMOLLIE_DB_HOST}" -p "${QUACKAMOLLIE_DB_PORT}" "${QUACKAMOLLIE_DB_NAME}"
  SELECT * FROM users;

- If you didn't set a default model and model manager and you sent a message to the bot, you should expect an answer like this one:

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/error_model_not_set.png
   :alt: Error message in Telegram chat showing the text "No valid model manager is set for this chat. Please use /settings to set a model."

- Navigate to `Chat Settings` (use `/settings` if needed)

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/settings_no_default_model.png
   :alt: Answer expected when navigating to the `Chat Settings` section

- Choose a model in the `Chat Settings/Model Management` section.
  The image below shows the expected output when quackamollie is installed with the extra-dependencies `common` and the model `llama3:latest` have been pulled.

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/model_management_common_install.png
   :alt: Answer expected when navigating to the `Chat Settings/Model Management` section, for `quackamollie[common]` install

- After choosing a model, you should expect an output like this one. Here, we chose the model `🦙☝️ llama-index | 🦙☝️ simple-llama-index` for demonstration.

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/model_llama_index_simple_chosen.png
   :alt: Answer expected when choosing the model `llama-index | simple-llama-index` in the `Chat Settings/Model Management` section

- If you hit the `Go Back` button, you should see your choice listed

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/settings_llama_index_simple_chosen.png
   :alt: Answer expected when navigating to the `Chat Settings/Model Management` section after choosing the `llama-index | simple-llama-index` model

- Send the bot a message and you should obtain an answer like this one (this run was on a personal laptop without GPU, so it is to be expected that executions take more than 10 seconds)

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/hello_answer_llama_index_simple.png
   :alt: Answer expected when saying "Hello!" to the `llama-index | simple-llama-index` model


Add a user ID
-------------
- If you didn't know your Telegram user ID and the `/start` command gave you an answer like this one:

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/access_denied.png
   :alt: Error message in Telegram chat showing the text "Access denied. This is a private bot for private use. Try contacting the administrator if you know them, else please do NOT write to me again."

- then your ID should be listed in the data directory typically under `data/quackamollie/user_filter/unauthorized_activity.json`

- Alternatively, it should appear in the logs

- Once you retrieved your ID, change your configuration and restart your bot

- Try testing the bot again


If you've been banned
---------------------
- If you encounter this error, it means you've been added to list of banned users by quackamollie for your bot instance.

.. image:: https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/images/user_banned.png
   :alt: Error message in Telegram chat showing the text "Access denied for too many requests. You are now officially banned from this bot and all your next messages will be totally ignored."

- There is only one way to unban a user, it is by manually editing the file `data/quackamollie/user_filter/banned_users.json`
  and removing the concerned user ID from it. Then you should change your configuration and restart your application for changes to take effects.

- Users are banned after less than 10 messages sent. It is a strict rule to improve security. We chose such a rule because this bot
  aims for private use, eventually with friends or family. Therefore, adding new users shouldn't be something you do much often
  and this helps a bit reducing attacks possibilities.

- Message of ban users are ignored by a dedicated `outer middleware <https://docs.aiogram.dev/en/latest/dispatcher/middlewares.html>`_ filtering input messages.


Adding models
-------------
By default, the image used by the `docker-compose.yml` file is `registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:latest`
but you can override it to use the image of your choice or build your own image to add your own models or to remove some model managers.

You can achieve this many ways. We recommend you to consider the option of forking the
`quackamollie_ops <https://gitlab.com/forge_of_absurd_ducks/quackamollie/ops/quackamollie_ops>`_ repository for your own install.
It implies more setup the first time but it allows you for auto-deployment of new versions.

We present here one of many alternatives that doesn't require a Gitlab repository.
It consists in creating your own `Dockerfile` for your image and set it for use in your `docker-compose.yml`.
The goal in this example is to create an image which installs `quackamollie[llama-index-common]` only and deploy it using `docker compose`.

- A very simple `Dockerfile` to achieve this could be:

.. code-block:: dockerfile

  FROM python:3.10-alpine

  RUN pip install --upgrade pip setuptools wheel
  RUN pip install quackamollie[llama-index-common]

  ENTRYPOINT ["quackamollie"]
  CMD ["-vv", "serve"]

- A more advanced `Dockerfile` to achieve this could be:

.. code-block:: dockerfile

  ARG PROXY_REGISTRY=
  FROM ${PROXY_REGISTRY}python:3.10-alpine as base

  ### Builder ###
  FROM base as builder

  RUN mkdir /install
  WORKDIR /install

  RUN pip install --upgrade pip setuptools wheel
  RUN pip install --no-warn-script-location --prefix=/install quackamollie[llama-index-common]

  ### Release ###
  FROM registry.gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core:latest

  COPY --chown=root:root --from=builder /install /usr/local

  ENTRYPOINT ["quackamollie"]
  CMD ["-vv", "serve"]

- This more advanced image allows for:

  - Lighter images by using multi-stage docker and isolated installation process
  - Using the `quackamollie db alembic` commands by extending the `registry.gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core:latest`
    image (cf. https://gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core/-/raw/master/Dockerfile for more details about this image)
  - Giving you an idea of what you can achieve in your own `Dockerfile`, feel free to adapt this code to match your needs

- Edit your docker-compose.yml to reference the docker file, in this example we suppose your custom `Dockerfile` is located under `./custom_config/Dockerfile`

.. code-block:: yaml

  services:
    quackamollie:
      build:
        context: ./custom_config
        dockerfile: Dockerfile
      container_name: quackamollie
      command: "-vvvv -c /config/config.yml serve"
      network_mode: host
      restart: unless-stopped
      depends_on:
        - quackamollie_postgres
        - quackamollie_db_migration
      volumes:
        - ${QUACKAMOLLIE_CONFIG_FILE}:/config/config.yml


- Redeploy

.. code-block:: bash

  docker compose up
  # or
  docker compose up -d

  # if you use sudo, don't forget the -E option
  sudo -E docker compose up -d


Management in the application
=============================
For now, in-app management is very limited, sorry for the inconvenience.

What we're currently aiming for is (ordered list):

- admin ability to hide models
- admin ability to define custom models with custom parameters through model_config
- user ability to override chat type to private for chats where the user is alone with the bot
- user ability to manage resource namespaces which manages uploaded files visibility across chats
- admin ability to manage globally available model-tools


Local development
=================
The sections above are at destination of developers or maintainers of this Python package.


Project Requirements
--------------------

Virtual environment
~~~~~~~~~~~~~~~~~~~
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

   pip install dist/quackamollie-0.1b0.tar.gz

- Or install it from wheel

.. code-block:: bash

   pip install dist/quackamollie-0.1b0.whl

- Or install it from PyPi repository

.. code-block:: bash

   pip install quackamollie  # latest
   # or
   pip install "quackamollie==0.1b0"


Docker
------
- To build the application docker

.. code-block:: bash

   docker build --network=host -t quackamollie:0.1b0 .

- The official Docker image of this project is available at: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie

- You can pull the image of the current release:

.. code-block:: bash

   docker pull registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:latest  # or dev
   # or
   docker pull registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1b0


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
    registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1b0 \
    -vvvv -c /config/config.yml db alembic upgrade head

    # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
    sudo -E docker run --rm --name quackamollie-migration \
    --network host \
    --mount type=bind,source="$(pwd)"/config/config.yml,target=/config/config.yml,readonly \
    registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1b0 \
    -vvvv -c /config/config.yml db alembic upgrade head

  - Or you can achieve the same in a `docker-compose.yml` file as demonstrated in this repository

  .. code-block:: yaml

    services:
      quackamollie_db_migration:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:0.1b0
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

For more details on the general contributing mindset of this project, please refer to `CONTRIBUTING.md <CONTRIBUTING.md>`_.


Credits
=======

Section in writing, sorry for the inconvenience.
