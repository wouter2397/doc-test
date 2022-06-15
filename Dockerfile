FROM registry.access.redhat.com/ubi8/nodejs-16 as build

WORKDIR /app

COPY . .

USER 1001

RUN npm install create-docusaurus

RUN ls /app/src
RUN ls /app

RUN npm run build

FROM registry.access.redhat.com/ubi8/httpd-24

COPY --from=build /app/build /var/www/html

CMD run-httpd
