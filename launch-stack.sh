#!/bin/bash
# sudo chmod +x *.sh
# ./launch-stack.sh


aws cloudformation create-stack --stack-name pmd-codebuild-postman --capabilities CAPABILITY_NAMED_IAM --disable-rollback --template-body file://pipeline-cb.yml