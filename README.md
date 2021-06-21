# integration-k8s-aws

Integration K8s AWS runs NSM system tests on an AWS EKS instance.

[cloudtest](https://github.com/networkservicemesh/cloudtest) is used to run the tests from [deployments-k8s](https://github.com/networkservicemesh/deployments-k8s/) in GKE.

You can see exactly what cloudtest does to setup a cluster in AWS [here](cloudtest/aws.yaml).

Effectively it just sets the indicated environment variables
```bash
AWS_CLUSTER_NAME=$(cluster-name)-$(date)-${GITHUB_RUN_NUMBER}-$(rands10)
KUBECONFIG
NSM_AWS_SERVICE_SUFFIX=${AWS_CLUSTER_NAME}
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
GITHUB_RUN_NUMBER
```

and then runs the [aws-start.sh](scripts/aws-start.sh)
