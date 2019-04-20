#!/bin/bash
# Environments
export PATH_TO_ENV_LILS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Component management
function env_add()
{
    while (( "$#" )); do
        echo "$1" >> ${PATH_TO_ENV_LILS}/requirements.txt
        shift
    done
    env_reorganize
}
function env_reorganize()
{
    filename=${PATH_TO_ENV_LILS}/requirements.txt
    # Sort the lines
    sort -n -o ${filename} ${filename}
    # Remove empty lines
    sed -i .backup '/^$/d' ${filename}
    # Remove duplicate lines
    perl -i -ne 'print if ! $x{$_}++' ${filename}
}

function env_remove()
{
    while (( "$#" )); do
        pattern=$1
        # convert all "/" to "\/" so that we can use it within a regex pattern
        new_pattern=$(echo ${pattern} | sed 's/\//\\\//g')
        sed -i "/^${new_pattern}$/d" ${PATH_TO_ENV_LILS}/requirements.txt
        shift
    done
}
alias env_list='cat ${PATH_TO_ENV_LILS}/requirements.txt'

# Virtual env management
alias env_init='cd ${PATH_TO_ENV_LILS};make init;cd -'
alias env_clean='cd ${PATH_TO_ENV_LILS};make clean;cd -'
alias env_refresh='cd ${PATH_TO_ENV_LILS};make refresh;cd -'

# Environment activate/deactivate
alias env_activate='. ${PATH_TO_ENV_LILS}/bin/activate'
alias env_deactivate='deactivate'
