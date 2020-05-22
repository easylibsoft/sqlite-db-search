# sqlite-db-search
A JSP Web Application that allows you to insert records, edit records and search through records in an SQLite Database Table made using Java EE.  
Requires TomEE 9 or Tomcat 9, and a minimum of Java 8 to run  


### Run
* Copy the contents of the `web` folder
* Paste them into a folder inside $TOMEE/webapps
* Visit `localhost:8080/<directory_name>`

### Build & Run
* Fork and clone this repository
* Import the directory in your IDE
* Add /web/WEB-INF/lib/sqlite-jdbc-3.31.1.jar to the classpath as an external dependency
* Build the Project
* Copy the generated artifact to $TOMEE/webapps
* Run $TOMEE/bin/starup.sh
* Visit `localhost:8080/<directory_name>`

### License
Licensed under the MIT License  

