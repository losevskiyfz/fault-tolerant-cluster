FROM citusdata/citus:latest

RUN apt-get update && \
    apt-get install -y git make gcc postgresql-server-dev-16 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /extensions
WORKDIR /extensions
RUN git clone https://github.com/omniti-labs/pg_jobmon.git pg_jobmon
RUN git clone https://github.com/pgpartman/pg_partman.git pg_partman

WORKDIR /extensions/pg_jobmon
RUN make && make install

WORKDIR /extensions/pg_partman
RUN make && make install

WORKDIR /
