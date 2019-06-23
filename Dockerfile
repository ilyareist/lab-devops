FROM python:3.7-alpine

ENV APP_HOME="/app"

ENV PYTHONDONTWRITEBYTECODE 1

RUN addgroup -S tgrgroup && \
    adduser -Ss /bin/bash -h /ap -G tgrgroup tgr

RUN mkdir -p ${APP_HOME}

WORKDIR ${APP_HOME}

ADD . ${APP_HOME}

RUN apk add --no-cache bash make && \
    pip install --upgrade pip && \
    pip install -r requirements


RUN chown -R tgr:tgrgroup /app

USER tgr

EXPOSE 8080

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["help"]
