
### template1
The `template1` docker example calls `script.sh` as `ENTRYPOINT`. 

### Purpose
* run simple bash scripts (`script.sh`)
* does not store anything attached to the container (i.e. no file downloads, no attached volumes, etc.)
* might process data on a remote machine (e.g. login into another database and run commands there)

### Commands
Use the following commands to install, start, or uninstall the images or container.

| command | description |
|:-------:|:-----------:|
| `./config uninstall` | Cleanup previous installations |
| `vi config.conf` | Increment the version |
| `./config.sh build run` | Build the Image and instantiate the Container |
| `./config.sh start` | Start the Container again |

Requires execution rights for `config.sh`.
For example, run `chmod u+x config.sh` to call `./config.sh ...`.
Otherwise call `bash config.sh ...`.


### script.sh
Contains code called by `ENTRYPOINT`.

Make the script executable for the docker container,
i.e. `chmod u+x script.sh`.

### Dockerfile
Nothing to say about it.


### Links
* [template1](https://github.com/ulf1/waalfisk/tree/master/template1)