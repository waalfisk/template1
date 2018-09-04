#!/bin/bash

#cosmetic stuff
hline=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -)

#check if docker is online
aw=$(docker stats --no-stream)
if [ -z "${aw}" ]; then
    echo "Your docker daemon is offline. Please start your docker daemon first!"
    echo "Call On MacOS: 'open /Applications/Docker.app'"
    exit 1
fi

#load settings
source config.conf

#get and goto current directory (required to keep relative links working)
folder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd "${folder}"

#abort if no subcommands given
if [ $# -lt 1 ]; then
    echo "no subcommands supplied."
    echo "Usage: ./$0 {build|run|start|uninstall}"
    exit 1
fi


#loop over all arguments
for inarg in "$@"; do 
#for each $inarg do case-switch
case "${inarg}" in
build)
    echo $hline
    echo "Building Image '${imagename}:${version}' now"
    docker build -t "${imagename}:${version}" . -f "Dockerfile"
    echo "*** Image Build Completed ***"
    ;;
run)
    echo $hline
    echo "Instantiate container '${containername}' from the '${imagename}:${version}' image now"
    docker run -it \
        --name "${containername}" \
        -d "${imagename}:${version}"
    echo "*** Container Instantiation Completed ***"
    ;;
start)
    #no fancy echo/print messages
    docker start -a ${containername} #attach container
    ;;
uninstall)
    echo $line
    echo "Delete '${containername}' now"
    docker stop ${containername}
    docker rm ${containername}
    echo "Delete '${imagename}:${version}' now"
    docker rmi ${imagename}:${version}
    echo "*** Container and Image Deletion Completed ***"
    ;;
*)
    echo "Usage: ./$0 {build|run|start|uninstall}"
    exit 1
esac #end case-switch
done #end for-loop

#successfully done
exit 0
