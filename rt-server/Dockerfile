FROM larsks/rt-base

RUN apk --update add apache2 apache-mod-fcgid
COPY entrypoint.sh /scripts/
COPY rt.conf /etc/apache2/conf.d/rt.conf
RUN chown -R apache:apache /var/cache/mason_data /var/cache/session_data
ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
