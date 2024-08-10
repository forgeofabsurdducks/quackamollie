========================================
Deploy Ollama and Quackamollie in Docker
========================================

.. contents:: Table of Contents
    :depth: 3
    :local:
    :backlinks: none

----

This tutorial explains how to deploy Ollama, Quackamollie and its Postgres database in Docker.
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


Telegram
--------
- `Create a new Telegram bot using the BotFather <https://core.telegram.org/bots/features#botfather>`_
- Keep your bot API token at hand, you will need it later


Docker-compose
--------------

Docker-compose file
~~~~~~~~~~~~~~~~~~~
Clone the repository or acquire the `docker-compose.yml` file one of the following way:

- Clone the git repository:

  .. code-block:: bash

     git clone https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie
     cd quackamollie/

- Or download the `docker-compose.yml` file from the repository:

  .. code-block:: bash

     wget https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/docker-compose.yml

- Or copy (and adapt if needed) this code:

  .. code-block:: yaml

    networks:
      quackamollie:

    services:
      quackamollie_postgres:
        image: postgres:${POSTGRES_DOCKER_TAG:-16}
        container_name: quackamollie_postgres
        environment:
          POSTGRES_DB: ${QUACKAMOLLIE_DB_NAME:-quackamollie}
          POSTGRES_USER: ${QUACKAMOLLIE_DB_USERNAME}
          POSTGRES_PASSWORD: ${QUACKAMOLLIE_DB_PASSWORD}
        # ports:
        #   - ${QUACKAMOLLIE_DB_PORT:-5432}:5432
        expose:
          - 5432
        hostname: ${QUACKAMOLLIE_DB_HOST:-quackamollie-postgres}
        networks:
          - quackamollie
        restart: unless-stopped
        volumes:
          - quackamollie_postgres:/var/lib/postgresql/data

      quackamollie_ollama:
        image: ollama/ollama:${OLLAMA_DOCKER_TAG:-latest}
        # pull_policy: always
        container_name: quackamollie_ollama
        tty: true
        entrypoint: ["/usr/bin/bash", "/ollama_entrypoint.sh"]
        environment:
          OLLAMA_KEEP_ALIVE: 24h
        expose:
          - 11434
        hostname: ${QUACKAMOLLIE_OLLAMA_HOST:-quackamollie-ollama}
        networks:
          - quackamollie
        restart: unless-stopped
        volumes:
          - quackamollie_ollama:/root/.ollama
          - ./scripts/ollama/ollama_entrypoint.sh:/ollama_entrypoint.sh:ro

      quackamollie_db_migration:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:${QUACKAMOLLIE_DOCKER_TAG:-latest}
        # pull_policy: always
        container_name: quackamollie_db_migration
        command: "-vvvv db alembic upgrade head"
        environment:
          QUACKAMOLLIE_DB_HOST: ${QUACKAMOLLIE_DB_HOST:-quackamollie-postgres}
          QUACKAMOLLIE_DB_PORT: ${QUACKAMOLLIE_DB_PORT:-5432}
          QUACKAMOLLIE_DB_NAME: ${QUACKAMOLLIE_DB_NAME:-quackamollie}
          QUACKAMOLLIE_DB_USERNAME: ${QUACKAMOLLIE_DB_USERNAME}
          QUACKAMOLLIE_DB_PASSWORD: ${QUACKAMOLLIE_DB_PASSWORD}
        networks:
          - quackamollie
        restart: no
        depends_on:
          - quackamollie_postgres

      quackamollie:
        image: registry.gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie:${QUACKAMOLLIE_DOCKER_TAG:-latest}
        # pull_policy: always
        container_name: quackamollie
        command: "-vvvv serve"
        environment:
          QUACKAMOLLIE_DB_HOST: ${QUACKAMOLLIE_DB_HOST:-quackamollie-postgres}
          QUACKAMOLLIE_DB_PORT: ${QUACKAMOLLIE_DB_PORT:-5432}
          QUACKAMOLLIE_DB_NAME: ${QUACKAMOLLIE_DB_NAME:-quackamollie}
          QUACKAMOLLIE_DB_USERNAME: ${QUACKAMOLLIE_DB_USERNAME}
          QUACKAMOLLIE_DB_PASSWORD: ${QUACKAMOLLIE_DB_PASSWORD}
          QUACKAMOLLIE_OLLAMA_BASE_URL: http://${QUACKAMOLLIE_OLLAMA_HOST:-quackamollie-ollama}:11434
          QUACKAMOLLIE_BOT_TOKEN: ${QUACKAMOLLIE_BOT_TOKEN:-}
          QUACKAMOLLIE_ADMIN_IDS: ${QUACKAMOLLIE_ADMIN_IDS:-}
          QUACKAMOLLIE_MODERATOR_IDS: ${QUACKAMOLLIE_MODERATOR_IDS:-}
          QUACKAMOLLIE_USER_IDS: ${QUACKAMOLLIE_USER_IDS:-}
        networks:
          - quackamollie
        restart: unless-stopped
        depends_on:
          - quackamollie_postgres
          - quackamollie_db_migration
          - quackamollie_ollama

    volumes:
      quackamollie_postgres: {}
      quackamollie_ollama: {}


Ollama entrypoint script
~~~~~~~~~~~~~~~~~~~~~~~~
The major inconvenience of running Ollama in Docker is that it is a bit more cumbersome to download the models you need.
We give two solutions to this problem:

- the first solution is to use a script encapsulating Ollama commands as an entrypoint for Ollama docker image
- the second solution is to use Open WebUI ponctually to download and manage your Ollama instance in Docker

This part presents the first solution and the second one is presented in the tutorial
`Deploy Open WebUI alongside Ollama and Quackamollie in Docker <https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/tree/master/docs/install/install_open_webui.rst>`_.
Both solutions can be used together, the entrypoint at startup and Open WebUI at runtime.

The `docker-compose.yml` above mounts and references a script that should be located at `./scripts/ollama/ollama_entrypoint.sh`.
You can get this file either:

- by cloning the git repository:

  .. code-block:: bash

     git clone https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie
     cd quackamollie/

- by downloading the `ollama_entrypoint.sh` file from the repository:

  .. code-block:: bash

     mkdir -p scripts/ollama/
     cd scripts/ollama/
     wget https://gitlab.com/forge_of_absurd_ducks/quackamollie/quackamollie/-/raw/master/scripts/ollama/ollama_entrypoint.sh

- by copying this code:

  .. code-block:: bash

    #!/bin/bash

    # Script from: https://stackoverflow.com/a/78501628/5498624

    # Start Ollama in the background.
    /bin/ollama serve &
    # Record Process ID.
    pid=$!

    # Pause for Ollama to start.
    sleep 5

    echo "🔴 Retrieve LLAMA3 model..."
    ollama pull llama3
    echo "🟢 Done!"

    # Wait for Ollama process to finish.
    wait $pid

N.B: Don't hesitate to change the line `ollama pull llama3` in this script with the model(s) of your choice.


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

  docker compose up

- **N.B**: if you need to run using sudo, don't forget to add the '-E' option to pass environment variables

.. code-block:: bash

  sudo -E docker compose up

- After finalizing the tests and if everything works correctly, you may want to use '-d/--detach' option to run quackamollie in background

.. code-block:: bash

  docker compose up -d


Show Quackamollie logs
----------------------
- If your run the application in detach mode and you need to access the logs, you can always do:

.. code-block:: bash

  docker compose logs quackamollie

  # Or just
  docker logs quackamollie

  # Use the option `-f/--follow` to see the logs produced dynamically
  docker compose logs -f quackamollie

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

  docker compose restart

  # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
  sudo -E docker compose restart

- You can stop Quackamollie with:

.. code-block:: bash

  docker compose stop

  # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
  sudo -E docker compose stop

- You can uninstall Quackamollie with:

.. code-block:: bash

  docker compose down

  # if you want to remove also the application data
  docker compose down -v

  # if you need to run it with sudo don't forget to add the -E option to pass the environment variables you've set
  sudo -E docker compose down


Additional deployment options
=============================

Running ollama with GPU
-----------------------
You can add GPU support for your Ollama deployment by referencing the `docker-compose.yml` `docker-compose.gpu.yml` files when deploying:

.. code-block:: bash

  docker compose -f docker-compose.yml -f docker-compose.gpu.yml up


Running OpenWebUI to manage your Ollama instance
------------------------------------------------
- You can deploy an Open WebUI instance while deploying Quackamollie by referencing the `docker-compose.open-webui.yml` file when deploying:

  .. code-block:: bash

    docker compose -f docker-compose.yml -f docker-compose.open-webui.yml up

- Then you can hit the `signup` button at the address http://localhost:3000 and register yourself.

  - In Open WebUI, the first registered user is automatically designed as an admin.
- Then you can typically:

  - go to the admin settings panel
  - disable new user signup
  - test your connection to your Ollama instance
  - download additional models
- After doing the operations your need to do, and if you don't need your Open WebUI instance anymore, you can stop it:

  .. code-block:: bash

    docker compose -f docker-compose.yml -f docker-compose.open-webui.yml stop quackamollie_open_webui
