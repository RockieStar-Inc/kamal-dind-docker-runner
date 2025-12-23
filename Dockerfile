FROM docker:dind

# System dependencies
RUN apk update && apk add --no-cache \
    bash \
    curl \
    git \
    yaml-dev \
    build-base \
    openssl-dev \
    readline-dev \
    zlib-dev \
    libffi-dev \
    nodejs \
    npm \
    ruby-dev \
    docker \
    openrc \
    openssh-client-default

# Install Kamal
RUN gem install kamal --no-document

# Install Bitwarden CLI
RUN npm install -g @bitwarden/cli

# Install 1Password CLI
COPY --from=1password/op:2 /usr/local/bin/op /usr/local/bin/op

