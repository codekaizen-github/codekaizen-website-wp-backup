#! /usr/bin/env bash
docker build -t codekaizen-website-wp-backup:local-test .
# docker run --entrypoint /bin/bash -it --rm -v $HOME/.ssh/home_lab_ansible:/root/.ssh/id_rsa codekaizen-website-wp-deploy:local-test
docker run --rm -v $HOME/.ssh/home_lab_ansible:/root/.ssh/id_rsa codekaizen-website-wp-backup:local-test
