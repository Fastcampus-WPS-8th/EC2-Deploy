FROM        ubuntu:17.10
MAINTAINER  dev@lhy.kr

# update, upgrade
RUN         apt -y update && apt -y dist-upgrade

# zsh
RUN         apt -y install zsh curl git
RUN         curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN         chsh -s /usr/bin/zsh

# pyenv
RUN         curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
RUN         apt -y install make build-essential libssl-dev zlib1g-dev libbz2-dev \
                   libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
                   xz-utils tk-dev libffi-dev
# pyenv settings
RUN         echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.zshrc
RUN         echo 'eval "$(pyenv init -)"' >> ~/.zshrc
RUN         echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# install python
ENV         PATH /root/.pyenv/bin:$PATH
RUN         pyenv install 3.6.5

