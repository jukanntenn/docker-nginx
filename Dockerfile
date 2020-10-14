FROM nginx:1.17.1

RUN apt-get update && apt-get install -y --allow-unauthenticated certbot python-certbot-nginx cron

RUN rm /etc/nginx/conf.d/default.conf

# Proxy configurations
COPY ./includes/ /etc/nginx/includes/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]


