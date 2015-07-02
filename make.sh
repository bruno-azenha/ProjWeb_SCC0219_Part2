#!/bin/bash
rm -rf WEB-INF/classes/Bridgeport/*.*
javac -classpath ../../lib/servlet-api.jar:./WEB-INF/lib/* java/*.java -d WEB-INF/classes/