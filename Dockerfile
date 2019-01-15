FROM letsencrypt/boulder-tools-go1.11.4:2019-01-09

RUN apt-get update && apt-get upgrade -y && apt-get install -y git && \
  mkdir -p /go/src/github.com/letsencrypt && \
  git clone https://github.com/letsencrypt/boulder /go/src/github.com/letsencrypt/boulder && \
  apt-get remove git -y && apt-get autoremove -y
WORKDIR /go/src/github.com/letsencrypt/boulder
ENTRYPOINT ["test/entrypoint.sh"]
