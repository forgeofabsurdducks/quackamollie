========================================================
Install Ollama locally and deploy Quackamollie in Docker
========================================================

.. contents:: Table of Contents
    :depth: 3
    :local:
    :backlinks: none

----

This tutorial explains how to install Ollama locally and deploy Quackamollie and its Postgres database in Docker.
For other deployment methods, please refer to the `README of the Quackamollie project <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie>`_.

This tutorial have been tested on an Ubuntu 22.04 architecture.
However, commands should be customizable for other distributions or OS.


Requirements
============
First, you should ensure you went through all listed requirements.

Docker
------
For this tutorial, you need to have Docker installed on your computer.
Instructions depend on your platform, so please refer to the `official documentation to install Docker Engine <https://docs.docker.com/engine/install/>`_
depending on your OS.

Alternatively, you can install `Docker Desktop <https://docs.docker.com/desktop/>`_ (for example, if you are on Windows).


Ollama
------
- Install `Ollama <https://ollama.com/>`_
- Pull an Ollama model, for example `llama3` or `llama3.1`

.. code-block:: bash

   ollama pull llama3

   # Alternatively, you can use a better model but also bigger (~8Go)
   ollama pull llama3:8b-instruct-q8_0


Telegram
--------
- `Create a new Telegram bot using the BotFather <https://core.telegram.org/bots/features#botfather>`_
- Keep your bot API token at hand, you will need it later


Docker-compose file
-------------------

Getting the file
~~~~~~~~~~~~~~~~
Clone the repository or acquire the `localhost.docker-compose.yml` file one of the following way:

- Clone the git repository:

  .. code-block:: bash

    git clone https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie
    cd quackamollie/

- Or download the `localhost.docker-compose.yml` file from this repository:

  .. code-block:: bash

    wget https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/localhost.docker-compose.yml

- Or copy (and adapt if needed) this code:

  .. code-block:: yaml

    services:
      quackamollie_postgres:
        image: postgres:${POSTGRES_DOCKER_TAG:-16}
        container_name: quackamollie_postgres
        environment:
          POSTGRES_DB: ${QUACKAMOLLIE_DB_NAME:-quackamollie}
          POSTGRES_USER: ${QUACKAMOLLIE_DB_USERNAME}
          POSTGRES_PASSWORD: ${QUACKAMOLLIE_DB_PASSWORD}
        network_mode: host
        restart: unless-stopped
        volumes:
          - quackamollie_postgres:/var/lib/postgresql/data

      quackamollie_db_migration:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:${QUACKAMOLLIE_DOCKER_TAG:-latest}
        # pull_policy: always
        container_name: quackamollie_db_migration
        command: "-vvvv db alembic upgrade head"
        environment:
          QUACKAMOLLIE_DB_HOST: ${QUACKAMOLLIE_DB_HOST:-0.0.0.0}
          QUACKAMOLLIE_DB_PORT: ${QUACKAMOLLIE_DB_PORT:-5432}
          QUACKAMOLLIE_DB_NAME: ${QUACKAMOLLIE_DB_NAME:-quackamollie}
          QUACKAMOLLIE_DB_USERNAME: ${QUACKAMOLLIE_DB_USERNAME}
          QUACKAMOLLIE_DB_PASSWORD: ${QUACKAMOLLIE_DB_PASSWORD}
        network_mode: host
        restart: no
        depends_on:
          - quackamollie_postgres

      quackamollie:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:${QUACKAMOLLIE_DOCKER_TAG:-latest}
        # pull_policy: always
        container_name: quackamollie
        command: "-vvvv serve"
        environment:
          QUACKAMOLLIE_DB_HOST: ${QUACKAMOLLIE_DB_HOST:-0.0.0.0}
          QUACKAMOLLIE_DB_PORT: ${QUACKAMOLLIE_DB_PORT:-5432}
          QUACKAMOLLIE_DB_NAME: ${QUACKAMOLLIE_DB_NAME:-quackamollie}
          QUACKAMOLLIE_DB_USERNAME: ${QUACKAMOLLIE_DB_USERNAME}
          QUACKAMOLLIE_DB_PASSWORD: ${QUACKAMOLLIE_DB_PASSWORD}
          QUACKAMOLLIE_OLLAMA_BASE_URL: http://${QUACKAMOLLIE_OLLAMA_HOST:-0.0.0.0}:11434
          QUACKAMOLLIE_BOT_TOKEN: ${QUACKAMOLLIE_BOT_TOKEN:-}
          QUACKAMOLLIE_ADMIN_IDS: ${QUACKAMOLLIE_ADMIN_IDS:-}
          QUACKAMOLLIE_MODERATOR_IDS: ${QUACKAMOLLIE_MODERATOR_IDS:-}
          QUACKAMOLLIE_USER_IDS: ${QUACKAMOLLIE_USER_IDS:-}
        network_mode: host
        restart: unless-stopped
        depends_on:
          - quackamollie_postgres
          - quackamollie_db_migration

    volumes:
      quackamollie_postgres: {}



Important Notice - Beware
~~~~~~~~~~~~~~~~~~~~~~~~~
**Beware**: The `localhost.docker-compose.yml` runs Quackamollie using `network_mode: host` which deploys all your application components in your host network.
We must inform you that this is NOT considered a secure practice for production environments, at least not without enhancing your host network security first
(which is not covered in this tutorial).

Therefore if you intend to deploy Quackamollie with Ollama more securely, you should either:

- follow the tutorial to `deploy Ollama and Quackamollie in Docker <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/tree/master/docs/install/install_full_docker.rst>`_ instead of this one (recommended solution)
- secure your host network (which is always a good idea)
- additionally, you can adapt the given code with an extra host pointing to the `host-gateway`. However, our tests with such alternative were not successful.
  Maybe because reaching Ollama using `host.docker.internal` requires you to fine tune your Ollama install configuration, we are not sure.
  Nevertheless, if you want to try it, you can export `QUACKAMOLLIE_OLLAMA_HOST` environment variable with value `host.docker.internal` and replace
  `network_mode: host` lines in your `localhost.docker-compose.yml` file with:

  .. code-block:: yaml

    extra_hosts:
      - host.docker.internal:host-gateway


Configuration
=============

Environment variables
---------------------
Export the following variables with your own values, including the bot API token you should have already retrieved from `the Telegram BotFather <https://core.telegram.org/bots/features#botfather>`_.

.. code-block:: bash

  export QUACKAMOLLIE_BOT_TOKEN="YOUR_BOT_TOKEN"
  export QUACKAMOLLIE_DB_USERNAME="YOUR_DATABASE_USER"
  export QUACKAMOLLIE_DB_PASSWORD="YOUR_DATABASE_strong_PASSWORD"

Additional setup:

- If you already know your own Telegram ID and/or the Telegram IDs of the bot users, you can defined these additional variables:

  .. code-block:: bash

    export QUACKAMOLLIE_ADMIN_IDS="YOUR_ID,ADDITIONAL_ADMIN_ID"
    export QUACKAMOLLIE_MODERATOR_IDS="MODERATOR_IDS"
    export QUACKAMOLLIE_USER_IDS="USER_IDS"

- If you don't know your own ID, don't worry you can retrieve it later from the Quackamollie logs and then define these variables

- N.B: IDs should be separated by commas without space

- To ease deployment, you can create a `.env`, `.envrc` or `envrc` with your environment variables and use the command `source YOUR_FILE_NAME`.


Advanced configuration
----------------------
You can fine tune your configuration to override more values or to use a configuration file.
Please see the `Configuration` section of the `README of the Quackamollie repository <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie>`_ for more details.


Deployment
==========

Running the bot
---------------
- Run the downloaded docker-compose. The first time you should run:

.. code-block:: bash

  docker compose -f localhost.docker-compose.yml up

- **N.B**: if you need to run using sudo, don't forget to add the '-E' option to pass environment variables

.. code-block:: bash

  sudo -E docker compose -f localhost.docker-compose.yml up

- After finalizing the tests and if everything works correctly, you may want to use '-d/--detach' option to run quackamollie in background

.. code-block:: bash

  docker compose -f localhost.docker-compose.yml up -d


Show Quackamollie logs
----------------------
- If your run the application in detach mode and you need to access the logs, you can always do:

.. code-block:: bash

  docker compose -f localhost.docker-compose.yml logs quackamollie

  # Or just
  docker logs quackamollie

  # Use the option `-f/--follow` to see the logs produced dynamically
  docker compose -f localhost.docker-compose.yml logs -f quackamollie

- After sending a message to the bot, if you are not authorized and not banned, you should see in the logs lines like these with your Telegram ID:

.. code-block:: bash

  20XX-XX-XX XX:XX:XX xxxxxx quackamollie.core.bot.middleware.user_filter[1] WARNING Unauthorized unknown user 'YOUR_NAME' with ID 'YOUR_TELEGRAM_ID' tries to communicate with the system
  20XX-XX-XX XX:XX:XX xxxxxx quackamollie.core.bot.middleware.user_filter[1] INFO New user 'YOUR_NAME' with ID 'YOUR_TELEGRAM_ID' has been added to the unauthorized activities list
  20XX-XX-XX XX:XX:XX xxxxxx aiogram.event[1] INFO Update id=XXXXXXX is handled. Duration xxx ms by bot id=XXXX



Test your bot
-------------
To test your bot, please follow the section `Post-installation generic methods` of the `README of the Quackamollie project <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie>`_.


Restart, stop or uninstall Quackamollie
---------------------------------------
- You can restart Quackamollie with:

.. code-block:: bash

  docker compose -f localhost.docker-compose.yml restart

  # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
  sudo -E docker compose -f localhost.docker-compose.yml restart

- You can stop Quackamollie with:

.. code-block:: bash

  docker compose -f localhost.docker-compose.yml stop

  # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
  sudo -E docker compose -f localhost.docker-compose.yml stop

- You can uninstall Quackamollie with:

.. code-block:: bash

  docker compose -f localhost.docker-compose.yml down

  # if you want to remove also the application data
  docker compose -f localhost.docker-compose.yml down -v

  # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
  sudo -E docker compose -f localhost.docker-compose.yml down
