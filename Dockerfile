FROM nvidia/cuda:11.0.3-base-ubuntu20.04

LABEL maintainer='Michaël "e7d" Ferrand <michael@e7d.io>'

RUN apt-get update && \
    apt-get -y install golang --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

WORKDIR /go

COPY src/app.go app.go

RUN go build -v -o bin/app app.go

EXPOSE 9202

CMD [ "./bin/app" ]
