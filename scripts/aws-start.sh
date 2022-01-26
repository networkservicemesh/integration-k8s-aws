#!/bin/bash

pushd scripts && \
AWS_REGION=us-east-2 go run ./... Create
kubectl describe nodes
kubectl get pods --all-namespaces -o wide
kubectl delete deployment -n kube-system coredns
kubectl apply -f coredns.yaml
popd || exit 0
