FROM mcr.microsoft.com/devcontainers/base:jammy AS devcontainer
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
RUN \
  --mount=type=cache,target=/var/lib/apt/lists \
  --mount=type=cache,target=/var/cache/apt/archives \
  apt-get update \
  && apt-get install --yes \
    nodejs
