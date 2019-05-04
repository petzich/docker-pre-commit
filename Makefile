# Makefile for petzi/docker-pre-commit
# Make targets to help in the development of this docker image

.DEFAULT_GOAL := help
DOCKER=docker
DOCKER_TAG=petzi/pre-commit
DOCKER_TAG_ALPINE=$(DOCKER_TAG):alpine
DOCKER_TAG_UBUNTU=$(DOCKER_TAG):ubuntu

# The help command is inspired by this post:
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build:  ## Build the images on development
	$(DOCKER) build -t $(DOCKER_TAG) .
	$(DOCKER) build -f Dockerfile.alpine -t $(DOCKER_TAG_ALPINE) .
	$(DOCKER) build -f Dockerfile.ubuntu -t $(DOCKER_TAG_UBUNTU) .
