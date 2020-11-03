# CONTENTS OF THIS FILE

* Setup
* Library
* Reference

## Setup

### Security
We used Mulesoft Secure Configuration Properties to encrypt password, the password to development environment is in global properties **encrypt.key**.
you can use this password like environment variable in Runtime Configuration/Environment or in global properties.

> to get the **encrypt.key** to production environment consult the security team or architect team (or request the deploy to devops team)

to create a new password use the Mulesoft documentation to guide you. (link in Reference)

In deploy using maven command, use:
mvn deploy -DmuleDeploy -Dencrypt.key=y@ra202!

### Apps Commons
we used an application with common flow like main errors, health application. To use tgis project get this applicatio in [github](https://github.com/yarabr/apps-commons.git).
add in your maven local folder (./m2) using the command bellow and add your bom file in project.

``` bash
mvn clean install -U
```

add this maven dependency in your project: 

```xml
<dependency>
  <groupId>com.yara.br.api</groupId>
  <artifactId>apps-commons</artifactId>
  <version>${apps.commons.version}</version>
  <classifier>mule-plugin</classifier>
</dependency>
```
if you need example, some projects used this project like order-sapi, service-portal-eapi and etc

### Maven
#### Settings
We used maven encryption to passwords (link in Reference).
you need create a settings-security.xml file in ./m2 folder and add this sintaxe bellow inside file:

```xml
<settingsSecurity>
  <master>{F9ymQU3kQbwHP++RmYmZFcNILjbJ+JQXkq/4U0H9/6Q=}</master>
</settingsSecurity>
```

now you can you this example bellow or similiar in your seetings.xml file

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                            http://maven.apache.org/xsd/settings-1.0.0.xsd">

  <localRepository>${user.home}/.m2/repository</localRepository>

  <servers>
    <server>
      <id>MuleRepository</id>
      <username>yara.international.asa.nexus</username>
      <password>{AOCq6HDbzpoHedS/obPLWuT1uDb+Ej1mOHjwZRUZJcg=}</password>
    </server>
    <server>
      <id>ExchangeRepository</id>
      <username>{YOUR ANYPOPINT USERNAME}</username>
      <password>{YOUR ANYPOINT PASSWORD (if your prefer, encrypt your password using mater password by settings-security.xml)}</password>
    </server>
  </servers>

  <profiles>
    <profile>
      <id>Mule-ee</id>
      
      <activation>
        <activeByDefault>true</activeByDefault>
      </activation>

      <repositories>
        <repository>
          <id>ExchangeRepository</id>
          <name>Anypoint Exchange</name>
          <url>https://maven.anypoint.mulesoft.com/api/v2/maven</url>
          <layout>default</layout>
        </repository>
      
        <repository>
          <id>MuleRepository</id>
          <name>MuleRepository</name>
          <url>https://repository.mulesoft.org/nexus-ee/content/repositories/releases-ee/</url>
          <layout>default</layout>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>

  <activeProfiles>
    <activeProfile>Mule-ee</activeProfile>
  </activeProfiles>
</settings>
```

#### Project
We used maven with parent reference and bom (bill of material). to install this file and avoid problem in your project use the command bellow inside project folder.

``` bash
mvn install:install-file -Dpackaging=pom -Dfile=bom.xml -DpomFile=bom.xml
mvn install:install-file -Dpackaging=pom -Dfile=parent-pom.xml -DpomFile=parent-pom.xml
```

## Library
if the project needs library specifies as SAP, look for library in the repository folder

## Reference
https://docs.mulesoft.com/mule-runtime/4.3/secure-configuration-properties
https://maven.apache.org/guides/mini/guide-encryption.html

##### License
brunosouzas.co