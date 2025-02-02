FROM ubuntu
ARG TARGETARCH

RUN echo "Target architecture: ${TARGETARCH}"
RUN mkdir -p /app/
RUN apt-get update && apt-get install -y curl
RUN if [ "${TARGETARCH}" = "arm" ]; then \
        curl https://frontend.bredbandskollen.se/download/bbk_cli_linux_armhf-1.0 --output /app/bbk; \
    elif [ "${TARGETARCH}" = "arm64" ]; then \
        curl https://frontend.bredbandskollen.se/download/bbk_cli_linux_arm64-1.0 --output /app/bbk; \
    elif [ "${TARGETARCH}" = "amd64" ]; then \
        curl https://frontend.bredbandskollen.se/download/bbk_cli_linux_amd64-1.0 --output /app/bbk; \
    fi

RUN chmod +x /app/bbk

ADD scripts/ /app/
RUN chmod +x /app/measurebb.sh

CMD bash -c /app/measurebb.sh