---
layout: blog-posts
title:  "Handling jar compressed files"
date:   2024-04-07
categories: tech
tags:
- shellscript
---

## Handling jar compressed files

Quick notes about handling jars on the CLI in maven projects with java. Dependencies:
- jar
- unzip
- mvn

generate jar passing the directory the pom.xml is located:
```sh
; mvn package -f ./server/
```
path to the jar:
```sh
; file ./server/target/server-1.0-SNAPSHOT.jar
./server/target/server-1.0-SNAPSHOT.jar: Java archive data (JAR)
```

list contents with index of the jar
```sh
; jar tf ./server/target/server-1.0-SNAPSHOT.jar
```

to find the mainClass of the generated jar, you can decompress the META-INF/MANIFEST.MF file to stdout:
```sh
; unzip -p ./server/target/server-1.0-SNAPSHOT.jar META-INF/MANIFEST.MF
Manifest-Version: 1.0
Created-By: Maven JAR Plugin 3.3.0
Build-Jdk-Spec: 17
Implementation-Title: server
Implementation-Version: 1.0-SNAPSHOT
Main-Class: org.springframework.boot.loader.launch.JarLauncher
Start-Class: com.organization.app.App
Spring-Boot-Version: 3.2.4
Spring-Boot-Classes: BOOT-INF/classes/
Spring-Boot-Lib: BOOT-INF/lib/
Spring-Boot-Classpath-Index: BOOT-INF/classpath.idx
Spring-Boot-Layers-Index: BOOT-INF/layers.idx

;
```

Above, the mainClass is "Main-Class: org.springframework.boot.loader.launch.JarLauncher".  Now, you can execute the app in these two ways:

1. directly execute the mainClass app in the jar:
```sh
; java -cp ./server/target/server-1.0-SNAPSHOT.jar org.springframework.boot.loader.launch.JarLauncher
Hello World!
;
```

2. ...or just pass the jar file as parameter using the jar flag:
```sh
; java -jar ./server/target/server-1.0-SNAPSHOT.jar
Hello World!
;
```

### Layered jars
Spring boot provides the default 4 layers on jars:

- dependencies: dependencies from third parties
- snapshot-dependencies: snapshot dependencies from third parties
- resources: static resources
- application: application code and resources

to examine the layers of any layered jar (example using Spring Boot):
```sh
; java -Djarmode=layertools -jar ./server/target/server-1.0-SNAPSHOT.jar list
dependencies
spring-boot-loader
snapshot-dependencies
application
;
```

to extract the layers of any layered jar:
```sh
; java -Djarmode=layertools -jar ./server/target/server-1.0-SNAPSHOT.jar extract
```
