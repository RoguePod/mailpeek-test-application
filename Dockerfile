FROM ruby:2.6.5

ENV DEBIAN_FRONTEND noninteractive

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update -qq
RUN apt-get install -y build-essential libxml2-dev libxslt1-dev nodejs sqlite3 libsqlite3-dev vim imagemagick libmagickwand-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -u 1000 -g 100 --create-home --home-dir /home/user --shell /bin/bash user

ENV TZ=America/Denver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo 'user    ALL=(ALL:ALL) ALL' >> /etc/sudoers
RUN mkdir -p /bundle
RUN chown -R user /bundle

RUN echo '#!/bin/bash\nbundle exec "$@"' > /usr/bin/be
RUN chmod +x /usr/bin/be

USER user
ENV HOME=/home/user

ENV APP_HOME=$HOME/public_html
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile
ENV BUNDLE_JOBS=8
ENV BUNDLE_PATH=$APP_HOME/.bundle265
ENV GEM_HOME=$APP_HOME/.bundle265

RUN mkdir -p $APP_HOME/.bundle265
ADD .irbrc $HOME/.irbrc
WORKDIR $APP_HOME

VOLUME ["$APP_HOME"]

EXPOSE 3000
