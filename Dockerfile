FROM swift:focal-slim
RUN  apt update && apt-get -y install cron curl mysql-client-core-8.0 jq iproute2
# Setup cron to run every minute to print (you can add/update your cron here)
RUN touch /var/log/cron-1.log
#
ADD caddy /
ADD template.txt /
#ADD start.sh /
#ADD route.sh /
ADD Caddyfile /
RUN chmod +x /caddy
#RUN chmod +x /start.sh
#RUN chmod +x /route.sh
#CMD ./start.sh
#