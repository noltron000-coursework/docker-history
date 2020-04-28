# --------------------- DO NOT MODIFY -------------------- #
FROM alpine:latest
# --------------- IMPLEMENT SOLUTION BELOW --------------- #

# add curl so we can grab homebrew.
RUN apk add curl

# grab homebrew.
RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

# add bash
RUN apk update
RUN apk upgrade
RUN apk add bash

# use homebrew.
FROM homebrew/brew

# use bash
SHELL ["/bin/bash", "-c"]

# install tldr & tree from homebrew.
RUN brew install tldr
RUN brew install tree


# set up output markdown file.
RUN echo $'# Command Line TLDR\n> *for `bash` commands* > OUTPUT.md'


RUN echo $'\n\n---\n\n## History' > OUTPUT.md
# use tldr on history
RUN tldr history >> OUTPUT.md
RUN echo $'\n\n---\n\n' >> OUTPUT.md
# ...history won't remember anything here.
# history remembers all *previous* terminal sessions.
# but there aren't any. so, expect its results to be empty.
RUN history -c -w
RUN history >> OUTPUT.md
RUN echo "<!--there should be nothing here since there has been no previous terminal sessions.-->" >> OUTPUT.md


RUN echo $'\n\n---\n\n## Time' >> OUTPUT.md
# use tldr on time
RUN tldr time >> OUTPUT.md
RUN echo $'\n\n---' >> OUTPUT.md
# according to stack overflow:
# https://stackoverflow.com/questions/13356628/how-to-redirect-the-output-of-the-time-command-to-a-file-in-linux
# this is needed to get time into a file.
RUN { time sleep 1 ; } 2>> OUTPUT.md

# create a small tree structure
RUN touch hello.txt
RUN mkdir contents
RUN touch contents/cool.txt
RUN touch contents/nice.txt


RUN echo $'\n\n---\n\n## Tree' >> OUTPUT.md
# use tldr on tree
RUN tldr tree >> OUTPUT.md
RUN echo $'\n\n---' >> OUTPUT.md
RUN tree >> OUTPUT.md

# print output file.
CMD cat OUTPUT.md
