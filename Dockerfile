FROM node:lts
WORKDIR /app
USER 1000
COPY ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]