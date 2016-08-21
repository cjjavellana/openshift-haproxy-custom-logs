#!/usr/bin/make

IMAGE := default/origin-haproxy-router
VERSION := v2

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
