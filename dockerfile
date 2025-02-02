FROM ubuntu
ARG TARGETPLATFORM

RUN echo "Target platform: ${TARGETPLATFORM}"
RUN mkdir -p /app/
RUN apt-get update && apt-get install -y curl
RUN if [ "${TARGETPLATFORM}" = "linux/arm/v7" ]; then \
        curl https://frontend.bredbandskollen.se/download/bbk_cli_linux_armhf-1.0 --output /app/bbk; \
    elif [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        curl https://frontend.bredbandskollen.se/download/bbk_cli_linux_aarch64-1.0 --output /app/bbk; \
    elif [ "${TARGETPLATFORM}" = "linux/amd64" ]; then \
        curl https://frontend.bredbandskollen.se/download/bbk_cli_linux_amd64-1.0 --output /app/bbk; \
    fi

RUN chmod +x /app/bbk

ADD scripts/ /app/
RUN chmod +x /app/measurebb.sh

CMD bash -c /app/measurebb.sh