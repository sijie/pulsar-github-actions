#!/bin/bash

read -r -a TARGET_DIRS <<< "$*"

CHANGED_DIRS=$(git diff --dirstat=files,0 HEAD~$(jq '.commits | length' "${GITHUB_EVENT_PATH}") | awk '{ print $2 }')

found_changed_dir_not_in_target_dirs="no"
for changed_dir in ${CHANGED_DIRS}
do
    matched="no"
    for target_dir in "${TARGET_DIRS[@]}"
    do
        if [[ ${changed_dir} == "${target_dir}"* ]]; then
            matched="yes"
            break
        fi
    done
    if [[ ${matched} == "no" ]]; then
        found_changed_dir_not_in_target_dirs="yes"
        break
    fi
done

if [[ ${found_changed_dir_not_in_target_dirs} == "yes" ]]; then
    echo "Changes not only in $*, setting 'changed_only' to 'no'"
    echo ::set-output name=changed_only::no
else
    echo "Changes only in $*, setting 'changed_only' to 'yes'"
    echo ::set-output name=changed_only::yes
fi