FROM ubuntu:22.04 AS ubuntu-base


FROM ubuntu-base AS deps-provider
# Install Node.js
RUN \
  --mount=type=cache,target=/var/lib/apt/lists \
  --mount=type=cache,target=/var/cache/apt/archives \
  apt-get update \
  && apt-get install --yes curl
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN \
  --mount=type=cache,target=/var/lib/apt/lists \
  --mount=type=cache,target=/var/cache/apt/archives \
  apt-get update \
  && apt-get install --yes \
    nodejs
# Install dependencies
COPY --link \
  frontend/package.json frontend/package-lock.json /built/
WORKDIR /built/
RUN \
  --mount=type=cache,target=/root/.npm \
  --mount=type=cache,target=/workspace/node_modules \
  npm install --save-dev


FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04 AS devcontainer
ARG USER_NAME=vscode
# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN \
  --mount=type=cache,target=/var/lib/apt/lists \
  --mount=type=cache,target=/var/cache/apt/archives \
  apt-get update \
  && apt-get install --yes \
    nodejs
# Get dependencies
COPY --from=deps-provider --chown=${USER_NAME}:${USER_NAME} \
  /built/node_modules/ /built/node_modules/
