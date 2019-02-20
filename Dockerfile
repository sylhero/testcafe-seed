# Node image
FROM circleci/node:10.14-browsers

# set working directory
RUN mkdir /tmp/app
WORKDIR /tmp/app

# copy source code
COPY . /tmp/app/

RUN sudo chmod -R 777 /tmp/app

# run sonarqube
RUN /tmp/sonar-scanner-3.2.0.1227-linux/bin/sonar-scanner -D project.settings=./sonar-project.properties 2>&1 | tee sonar.txt && if grep -qF "FAILURE" sonar.txt;then exit 1; fi

