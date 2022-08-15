#!/bin/sh

APP=$1
CONTAINER=$2
NAMESPACE=$3

if [ -z "$APP" ]; then
  echo "You must provide part of the pod name as argument!"
  exit 1
fi

if [ -z "$CONTAINER" ]; then
  CONTAINER=fpm
fi

if [ -z "$NAMESPACE" ]; then
  NAMESPACE=NYCL
fi

POD=$(kubectl get pods -n $NAMESPACE | grep $APP | awk '{print $1}')

if [ -z "$POD" ]; then
  echo "Pod not found!"
  exit 1
fi

kubectl exec -n $NAMESPACE -it $POD -c $CONTAINER -- sh

exit 0
