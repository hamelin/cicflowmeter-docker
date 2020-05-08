#!/bin/bash
if [ "$1" = "sh" ]; then
    exec sh -l
elif [ "$1" = "bash" ]; then
    exec bash --login
else
    gradle --no-daemon -Pcmdargs=$1:$2 runcmd
fi
