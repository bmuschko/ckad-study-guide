# Building the Docker Image

Run the following command to compile the code and build the JAR file.

```
$ ./mvnw package spring-boot:repackage
```

Then build the image with the following command:

```
$ docker build -t java-hello-world:1.0.0 .
```
