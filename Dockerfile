FROM alpine:3.14

# Install git, node & npm
RUN apk update && apk add --no-cache \
                  openssh-client \
                  git

# Update npm and install yarn and workspace-tools as root
RUN npm install -g npm && npm i -g yarn yarn-workspace-tools && apk del npm

# Create filesystem user
RUN addgroup -S 1000 && \
    adduser -S 1000 -G 1000 && \
    mkdir /home/1000/.ssh && \
    chown -R 1000:1000 /home/1000
ENV HOME /home/1000

# Login as filesystem user
USER 1000
