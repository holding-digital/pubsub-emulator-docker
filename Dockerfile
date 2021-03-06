# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=183.0.0-alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
# MAINTAINER Singularities

# Install Java 8 for Pub/Sub emulator
RUN apk --update add openjdk8-jre
RUN gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pub/Sub data
VOLUME /opt/data

WORKDIR /emulator

COPY start-pubsub .

EXPOSE 8432

ENTRYPOINT ["/emulator/start-pubsub"]