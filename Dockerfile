FROM debian:trixie-slim AS downloader
ARG TARGETPLATFORM
RUN apt-get update && apt-get install -y curl
RUN mkdir -p /app/
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        curl -L https://frontend.bredbandskollen.se/download/bbk_cli_linux_aarch64-1.2.2 --output /app/bbk; \
    elif [ "${TARGETPLATFORM}" = "linux/amd64" ]; then \
        curl -L https://frontend.bredbandskollen.se/download/bbk_cli_linux_amd64-1.2.2 --output /app/bbk; \
    fi
RUN chmod +x /app/bbk

FROM debian:trixie-slim
ARG TARGETPLATFORM
COPY --from=downloader /app/bbk /app/bbk
ADD scripts/ /app/
RUN chmod +x /app/bbk /app/measurebb.sh
CMD bash -c /app/measurebb.sh