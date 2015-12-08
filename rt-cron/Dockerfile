FROM larsks/rt-base

COPY entrypoint.sh /scripts
ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["/usr/sbin/crond", "-f", "-L", "/dev/stderr"]

