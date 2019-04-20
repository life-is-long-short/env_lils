# Env LILS
Easy-to-Use Python virtualenv manager

## Installation
Run ```make install``` to install.

Run ```. reload_bash.sh``` to load the commands into bash.

Run ```env_init``` to load all packages.

Run ```env_activate``` to load the virtual environment

Run ```env_deactivate``` to unload the virtual environment

## How to use
Package (in virtualenv) management:
* env_add
  * ex) ```env_add package1 package2 package3```
* env_remove
  * ex) ```env_remove package1 package2 package3```
* env_list

Virtualenv management:
* env_init
  * to install all libraries in ```requirements.txt``` into your environment
* env_refresh
* env_clean

Environment activate/deactivate:
* env_activate
  * to activate the virtual environment
  * make sure you see ```(env_lils)``` at the beginning of your command prompt.
* env_deactivate
