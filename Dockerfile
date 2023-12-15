FROM anapsix/alpine-java:8

ARG HatH_ID=13245
ARG Hath_KEY=YourClientKeyHere
ARG HatH_PORT=11112

ARG HatH_VERSION=1.6.2

RUN apk --no-cache add unzip && \
    adduser -D hath && \
    mkdir -p /home/hath/client /home/hath/client/data && \
    cd /home/hath/client && \
    wget "https://repo.e-hentai.org/hath/HentaiAtHome_$HatH_VERSION.zip" && \
    unzip "HentaiAtHome_$HatH_VERSION.zip" && rm "HentaiAtHome_$HatH_VERSION.zip" &&\
    chmod -R 775 /home/hath/client && \
    apk del unzip

WORKDIR /home/hath/client

EXPOSE $HatH_PORT

CMD echo -n "$HatH_ID-$Hath_KEY" > "data/client_login" && java -jar HentaiAtHome.jar --disable_logging
