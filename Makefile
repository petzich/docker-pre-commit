# Makefile for petzi/docker-pre-commit
# Make targets to help in the development of this docker image

.DEFAULT_GOAL := help

# Docker configuration
DOCKER=docker
# Docker build configuration
DOCKER_TAG=petzi/pre-commit
DOCKER_TAG_ALPINE=$(DOCKER_TAG):alpine
DOCKER_TAG_UBUNTU=$(DOCKER_TAG):ubuntu

# Docker run configuration for the main image
DOCKER_VOL=-v "${PWD}:/src"
DOCKER_WD=-w "/src"
DOCKER_RUN=$(DOCKER) run --rm $(DOCKER_VOL) $(DOCKER_WD)

# Configuration for wagoodman/dive
DIVE_IMAGE=wagoodman/dive
DIVE_VERSION=v0.7.2
DIVE=$(DIVE_IMAGE):$(DIVE_VERSION)
DIVE_VOL=-v "/var/run/docker.sock:/var/run/docker.sock"
DIVE_CI=-e CI=true
DIVE_RUN=$(DOCKER) run --rm $(DIVE_CI) $(DIVE_VOL) $(DIVE)

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

.PHONY: ci-image-size
ci-image-size: ## Run docker image size analysis
	$(DIVE_RUN) $(DOCKER_TAG_ALPINE)
	$(DIVE_RUN) $(DOCKER_TAG_UBUNTU)

.PHONY: test-run
test-run: ## Run each image once to test the build result
	$(DOCKER_RUN) $(DOCKER_TAG)
	$(DOCKER_RUN) $(DOCKER_TAG_ALPINE)
	$(DOCKER_RUN) $(DOCKER_TAG_UBUNTU)
