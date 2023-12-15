FROM anapsix/alpine-java:8

ARG HatH_PORT=11112
ARG HatH_ID=12345
ARG Hath_KEY=HentaiAtHomeKeyHere
ARG HatH_VERSION=1.6.2

# Install dependencies and clean up
RUN apk --no-cache add curl unzip && \
    adduser -D hath && \
    mkdir -p /home/hath/client && \
    cd /home/hath/client && \
    curl -kfsSL "https://repo.e-hentai.org/hath/HentaiAtHome_$HatH_VERSION.zip" -o hath.zip && \
    unzip hath.zip && \
    rm hath.zip HentaiAtHomeGUI.jar autostartgui.bat && \
    echo -n "$HatH_ID-$Hath_KEY" > "/home/hath/client/data/client_login" && \
    chmod -R 775 /home/hath/client && \
    apk del curl unzip

WORKDIR /home/hath/client

# Expose the port
EXPOSE $HatH_PORT

CMD ["java", "-jar", "HentaiAtHome.jar"]
