FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="http://github.com/sijie/pulsar-github-actions"
LABEL homepage="http://github.com/sijie/pulsar-github-actions/trigger-phrase"
LABEL maintainer="Sijie Guo"
LABEL "com.github.actions.name"="Phrase trigger"
LABEL "com.github.actions.description"="Phrase  trigger"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="gray-dark"

RUN apk add --update git jq bash && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]