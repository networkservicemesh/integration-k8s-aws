#!/bin/bash

out=$(eksctl get clusters)
for clusterName in $out
do
    if [[ $clusterName =~ ^aws- ]]
    then
        eksctl delete cluster --name $clusterName
    fi
done