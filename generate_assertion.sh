#!/bin/bash
if [ -z "$1" ]; then
    echo "No argument supplied"
    exit 1
fi

cd ~/AssertionFlow || exit 1

if [ ! -f "$1.properties" ]; then
    echo "$1 config does not exist."
    exit 1
fi

\cp "$1.properties" config.properties > /dev/null

java -jar JWTAuthenticationTest.jar

cd - > /dev/null || exit 1

exit 0

