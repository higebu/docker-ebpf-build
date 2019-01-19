FROM debian:sid
LABEL maintainer="yuya.kusakabe@gmail.com"

RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc clang llvm make linux-source-4.19 linux-headers-amd64 bison flex libelf-dev bc libssl-dev \
  && rm -rf /var/lib/apt/lists/* \
  && cd /usr/src && tar xf linux-source-4.19.tar.xz \
  && apt-get purge -y linux-source-4.19
WORKDIR /usr/src/linux-source-4.19
RUN make olddefconfig && make headers_install

RUN mkdir -p /src
WORKDIR /
COPY entrypoint.sh /entrypoint.sh
COPY Makefile-bpf /Makefile-bpf
ENTRYPOINT ["/entrypoint.sh"]
