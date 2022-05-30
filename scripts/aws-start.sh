#!/bin/bash

apt-get update && apt-get -y install curl dnsutils

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp; \
    mv /tmp/eksctl /usr/local/bin; \
    eksctl version

curl -o aws-iam-authenticator https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator; \
    chmod 755 aws-iam-authenticator; \
    mv ./aws-iam-authenticator /usr/local/bin

eksctl create cluster  \
      --name "${AWS_CLUSTER_NAME}" \
      --version 1.22 \
      --nodegroup-name "${AWS_CLUSTER_NAME}-workers" \
      --node-type t2.xlarge \
      --nodes 2
