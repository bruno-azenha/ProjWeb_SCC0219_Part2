all:
	javac -classpath ../../lib/servlet-api.jar java/*.java -d WEB-INF/classes/

clean:
	rm -rf WEB-INF/classes/*.*
