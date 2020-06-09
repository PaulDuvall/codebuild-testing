#!/bin/bash
# sudo chmod +x *.sh
# ./delete-stack.sh

aws s3api list-buckets --query 'Buckets[?starts_with(Name, `pmd-codebuild-`) == `true`].[Name]' --output text | xargs -I {} aws s3 rb s3://{} --force

aws cloudformation delete-stack --stack-name pmd-codebuild-postman

aws cloudformation wait stack-delete-complete --stack-name pmd-codebuild-postman