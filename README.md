# petzich/pre-commit

This is a Docker image containing pre-commit.

## Goal

This image provides a base to create derived images containing specific pre-commit tools. It is based on Ubuntu, which should increase the chance that a derived image can simply use the package manager to install a required package.

Example derived image Dockerfile:

```
FROM petzi/pre-commit:1.15-2-ubuntu.18.10
RUN apt-get install -y --no-install-recommends \
    yamllint
```

## Versioning

The project uses semantic versioning.

1. The main version number denotes the pre-commit version used.
1. The pre-release part denotes the base docker image used. Codenames of the distributions are not used, as version numbers of the distributions are better suited to produce semver-like precedence. 

`1.15.2-ubuntu.18.10` is pre-commit version 1.15.2 built from Ubuntu 18.10 base image.
