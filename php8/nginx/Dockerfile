FROM nginx:1.21.3-alpine

ADD ./config/nginx.conf /etc/nginx/conf.d/default.conf
ADD ./config/includes/default.conf /etc/nginx/includes/default.conf
ADD ./config/includes/health-check.conf /etc/nginx/includes/health-check.conf
ADD ./config/includes/logs.conf /etc/nginx/includes/logs.conf
