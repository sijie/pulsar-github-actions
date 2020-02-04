#!/bin/bash

read -r -a TARGET_DIRS <<< "$*"

cat ${GITHUB_EVENT_PATH}
COMMITS=$(jq '.pull_request.commits' "${GITHUB_EVENT_PATH}")
echo "COMMITS: ${COMMITS}"