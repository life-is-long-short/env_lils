#!/bin/bash
# Install commands into ~/.bash_profile

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ "${DIR}" = "$(pwd)" ]; then
    DIR_TO_USER=""
else
    DIR_TO_USER=${DIR}/
fi
line_to_add=". ${DIR}/load_env_commands.sh"
target_file=~/.bash_profile

read -r -d '' reload_message << EOM
I have installed the env_* command loader into ${target_file}.

Upon reloading your bash environment,
you will be able to run commands like:
Component management:
* env_add
* env_remove
* env_list
Virtual env management:
* env_init
* env_refresh
* env_clean
Environment activate/deactivate
* env_activate
* env_deactivate

Run '. ${DIR_TO_USER}reload_bash.sh' to reload your bash environment and enable these commands.
EOM

found=false
while read -r line
do
    if [[ $line == ${line_to_add}* ]] ; then
        found=true
        break
    fi
done < ${target_file}
if [ "$found" = true ] ; then
    echo "${target_file} already has a necessary loading command"
else
    # add to ${target_file}
    echo "" >> ${target_file}
    echo "# Load env commands for env_lils:" >> ${target_file}
    echo ${line_to_add} >> ${target_file}
    # show reload guide message
    echo "$reload_message"
fi
