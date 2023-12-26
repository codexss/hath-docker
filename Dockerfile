FROM anapsix/alpine-java:8

ARG HatH_ID=12345
ARG Hath_KEY=YourClientKeyHere

ARG HatH_VERSION=1.6.2

WORKDIR /hath

RUN apk --no-cache add unzip && \
    wget "https://repo.e-hentai.org/hath/HentaiAtHome_$HatH_VERSION.zip" && \
    unzip "HentaiAtHome_$HatH_VERSION.zip" && \
    rm "HentaiAtHome_$HatH_VERSION.zip" && \
    apk del unzip

CMD mkdir -p data && echo -n "$HatH_ID-$Hath_KEY" > "data/client_login" && java -jar HentaiAtHome.jar
