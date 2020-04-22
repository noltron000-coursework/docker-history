# ------------------------------- DO NOT MODIFY ------------------------------ #
FROM alpine:latest
# ------------------------- IMPLEMENT SOLUTION BELOW ------------------------- #

RUN apk add curl

RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

FROM homebrew/brew

RUN brew install tldr

RUN tldr history

# tldr for history
CMD ["tldr", "history"]
