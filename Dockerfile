# --------------------- DO NOT MODIFY -------------------- #
FROM alpine:latest
# --------------- IMPLEMENT SOLUTION BELOW --------------- #
# add curl so we can grab homebrew.
RUN apk add curl
# grab homebrew.
RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

# add bash
RUN apk add bash
RUN apk update
RUN apk upgrade
RUN apk add bash

# use bash
SHELL ["/bin/bash", "-c"]

# TODO: cannot get history to run :(
CMD ["history", "-3"]

# use homebrew.
FROM homebrew/brew

# install tldr from homebrew.
RUN brew install tldr

# use tldr on history
CMD tldr history
