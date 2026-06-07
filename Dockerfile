FROM postgres:17-alpine

# Install Build-Tools, compile pgvector v0.8.2 and clean up
RUN apk add --no-cache --virtual .build-deps \
        git \
        make \
        gcc \
        musl-dev \
        clang16 \
        llvm16 \
    && git clone --branch v0.8.2 https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make \
    && make install \
    && rm -rf /tmp/pgvector \
    && apk del .build-deps
