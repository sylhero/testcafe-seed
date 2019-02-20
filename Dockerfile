# Node image
FROM images.ormuco.com:5000/ormuco/node as builder

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# copy source code
COPY . /usr/src/app/

# install and cache app dependencies
RUN npm install

# build application
RUN npm run production

# run sonarqube
RUN /tmp/sonar-scanner-3.2.0.1227-linux/bin/sonar-scanner -D project.settings=./sonar-project.properties 2>&1 | tee sonar.txt && if grep -qF "FAILURE" sonar.txt;then exit 1; fi

# Nginx
FROM nginx:1.15
RUN rm -rf /etc/nginx/conf.d
COPY ssl /etc/ssl/certs
COPY conf /etc/nginx
COPY --from=builder /usr/src/app/app-build /usr/share/nginx/html
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
