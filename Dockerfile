ARG PROXY_REGISTRY=
FROM ${PROXY_REGISTRY}python:3.10-alpine AS base


### Builder ###
FROM base AS builder

RUN mkdir /install
WORKDIR /install

COPY ./dist/* /dist/

RUN pip install --upgrade pip setuptools wheel
RUN export WHEEL_DIST="$(ls -Au /dist/*.whl | head -1)"; pip install --no-warn-script-location --prefix=/install "${WHEEL_DIST}[common]"


### Release ###
FROM registry.gitlab.com/forge_of_absurd_ducks/quackamollie/lib/quackamollie_core:0.1

COPY --chown=root:root --from=builder /install /usr/local

ENTRYPOINT ["/bin/sh", "docker-entrypoint.sh"]
CMD ["quackamollie", "-vv", "serve"]
