FROM alpine:3.4

MAINTAINER Nabil Servais "nabil@eml.cc"

RUN apk update
RUN apk add --no-cache build-base git perl zlib-dev
RUN git clone https://github.com/rbsec/sslscan.git


RUN \
	cd sslscan && \
	make static && \
	make install && \
	cd / && \
	rm -rf sslscan

RUN apk del build-base git perl zlib-dev

ENTRYPOINT ["/usr/bin/sslscan"]