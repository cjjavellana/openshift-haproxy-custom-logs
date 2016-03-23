#!/usr/bin/make

IMAGE := ramr/origin-haproxy-router
VERSION := v1

all:	build

build:
	docker build -t $(IMAGE) ./
	docker tag $(IMAGE) $(IMAGE):$(VERSION)

run:	build
	oadm router --images=$(IMAGE):$(VERSION)

clean:
	docker rmi $(IMAGE) || :
	docker rmi $(IMAGE):$(VERSION) || :

.PHONY:	clean
