FROM postgres:17-alpine

# Install Build-Tools, compile pgvector v0.8.2 and clean up
RUN apk add --no-cache --virtual .build-deps \
        git \
        make \
        gcc \
        musl-dev \
    && git clone --branch v0.8.2 https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make with_llvm=no \
    && make install with_llvm=no \
    && rm -rf /tmp/pgvector \
    && apk del .build-deps
