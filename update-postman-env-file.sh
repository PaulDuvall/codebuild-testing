#!/usr/bin/env bash

#This shell script updates Postman environment file with the API Gateway URL created
# via the api gateway deployment

echo "Running update-postman-env-file.sh"

api_gateway_url=`aws cloudformation describe-stacks \
  --stack-name pmd-serverless-app-us-east-1 \
  --query "Stacks[0].Outputs[3].{OutputValueValue:OutputValue}" --output text`

echo "API Gateway URL:" ${api_gateway_url}

jq -e --arg apigwurl "$api_gateway_url" '(.values[] | select(.key=="GetDataApi") | .value) = $apigwurl' \
  postman_environment.json > postman_environment.json.tmp \
  && cp postman_environment.json.tmp postman_environment.json \
  && rm postman_environment.json.tmp

echo "Updated postman_environment.json"

cat postman_environment.json