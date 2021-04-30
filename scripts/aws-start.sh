#!/bin/bash

pushd scripts && \
AWS_REGION=us-east-2 go run ./... Create && \
popd || exit 0