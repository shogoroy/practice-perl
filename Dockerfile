FROM perl

WORKDIR /app

RUN cpanm Server::Starter
RUN cpanm HTTP::Router
RUN cpanm Plack
RUN cpanm Gazelle
