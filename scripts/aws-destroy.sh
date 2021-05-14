#!/bin/bash

pushd scripts && \
AWS_REGION=us-east-2 go run ./... Delete && \
popd || exit 0