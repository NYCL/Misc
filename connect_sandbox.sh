#!/bin/bash
if [ -z "$1" ]; then
    echo "No argument supplied"
    exit 1
fi

default_user=""
if [ -z "$2" ]; then
    default_user=NYCL
fi

default_host=""
if [ -z "$3" ]; then
    default_host=127.0.0.1
fi

case $1 in
    node1)
        ssh $default_user@$default_host -p $PORT_NODE1
        ;;
    node0)
    	ssh $default_user@$default_host -p $PORT_NODE0
    	;;
    *)
        echo "Unknown Connection"
        ;;
esac

exit 0
