all:
	javac -classpath ../../lib/servlet-api.jar:./WEB-INF/lib/* java/*.java -d WEB-INF/classes/

clean:
	rm -rf WEB-INF/classes/*.*
