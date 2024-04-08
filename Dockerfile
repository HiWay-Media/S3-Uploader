FROM swift:focal-slim
RUN  apt update && apt-get -y install cron curl mysql-client-core-8.0 jq iproute2
# Setup cron to run every minute to print (you can add/update your cron here)
RUN touch /var/log/cron-1.log
# Download and copy the Caddy executable
RUN wget -O caddy https://github.com/caddyserver/caddy/releases/download/v2.7.6/caddy_2.7.6_linux_amd64.tar.gz
#https://github.com/caddyserver/caddy/releases/download/v2.4.6/caddy_2.4.6_linux_amd64
#
#ADD caddy /
ADD template.txt /
#ADD start.sh /
#ADD route.sh /
ADD Caddyfile /
# Set permissions to make the Caddy executable
RUN chmod +x caddy
#RUN chmod +x /start.sh
#RUN chmod +x /route.sh
#CMD ./start.sh
#