FROM alpine

RUN apk --update add rt4 msmtp
RUN apk --update add mysql-client postgresql-client
RUN mkdir /home/rt4; chown rt4:rt4 /home/rt4
RUN mv /etc/rt4/RT_SiteConfig.pm /etc/rt4/RT_SiteConfig_Original.pm
COPY scripts /scripts
