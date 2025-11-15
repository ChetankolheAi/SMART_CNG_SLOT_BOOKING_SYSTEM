# Use official Tomcat 10 with Java 17
FROM tomcat:10.1-jdk17

# Remove default webapps (ROOT, examples, docs)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your app into Tomcat webapps
COPY ./ /usr/local/tomcat/webapps/ROOT/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
