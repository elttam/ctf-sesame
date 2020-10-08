# :latest isn't latest, but should be fixed soon - https://github.com/phusion/passenger-docker/issues/197
FROM phusion/passenger-ruby24:latest

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD nginx/app.conf /etc/nginx/sites-enabled/app.conf

COPY webapp/ /home/app/webapp
RUN gem update --system
RUN bundle install --gemfile /home/app/webapp/Gemfile


RUN chown -R root:root /home/app/
RUN find /home/app/ -type d -exec chmod 755 {} \;
RUN find /home/app/ -type f -exec chmod 644 {} \;

# hopefully this doesn't break anything
RUN deluser app rvm

ADD readflag.c /readflag.c
ADD flag.txt /flag.txt
RUN groupadd flag && \
  gcc /readflag.c -o /readflag && \
  chown root:flag /readflag && \
  chmod 2755 /readflag && \
  rm /readflag.c && \
  chown root:flag /flag.txt && \
  chmod 040 /flag.txt

CMD ["/sbin/my_init"]
