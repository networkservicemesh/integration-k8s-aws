# integration-k8s-aws

Integration K8s AWS runs NSM system tests on an AWS EKS instance.

Effectively you need just set these environment variables and create clusters
```bash
KUBECONFIG
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_CLUSTER_NAME
```

## Create cluster

```bash
eksctl create cluster  \
    --name "${AWS_CLUSTER_NAME}" \
    --version 1.27 \
    --nodegroup-name "${AWS_CLUSTER_NAME}-workers" \
    --node-type t3.xlarge \
    --nodes 2
```

## Destroy cluster

```bash
eksctl delete cluster --name "${AWS_CLUSTER_NAME}"
```