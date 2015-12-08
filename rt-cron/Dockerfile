FROM larsks/rt-base

RUN apk --update add fetchmail
COPY entrypoint.sh /scripts
COPY crontab /etc/crontabs/rt4
ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["/usr/sbin/crond", "-f", "-L", "/dev/stderr"]

