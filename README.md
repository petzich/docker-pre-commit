# petzich/pre-commit

This is a Docker image containing [pre-commit].

## Goal

This image provides a base to create derived images containing specific pre-commit tools. There is one image based on Ubuntu and one image based on Alpine.

1. Use the `ubuntu` variant for a higher chance of installing software from the package repository of the operating system.
1. Use the `alpine` variant if you want a smaller docker image size.

Example derived image Dockerfile:

```
FROM petzi/pre-commit:1.15.2-ubuntu
RUN apt-get install -y --no-install-recommends \
    yamllint
```

## Versioning

### Git

The project uses semantic versioning.

1. The main version number denotes the pre-commit version used.
1. The pre-release part refers to a revision used inside this repository.

A git tag will typically look like this.

```
1.15.2-6
```

### Docker image tag

This repository uses docker hub autobuild and creates many different docker image tags form the same git tag. A docker hub build from git tag `1.15.2-6` will thus create the following docker image tags:

1. `1.15.2`
1. `1.15.2-6`
1. `1.15.2-alpine`
1. `1.15.2-alpine-6`
1. `1.15.2-alpine.3.9`
1. `1.15.2-alpine.3.9-6`
1. `1.15.2-ubuntu`
1. `1.15.2-ubuntu-6`
1. `1.15.2-ubuntu.18.10`
1. `1.15.2-ubuntu.18.10-6`

Choosing the right version to base your derived image on depends on your need for stability. If you reliably need to depend on the correct version of Ubuntu, use a tag such as `1.15.2-ubuntu.18.10`. If you reliably need to depend on a certain revision from within this repository, but the operating system is irrelevant, use a tag such as `1.15.2-6`.

[pre-commit]: https://pre-commit.com
