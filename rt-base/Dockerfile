FROM alpine

RUN apk --update add \
	rt4 \
	mysql-client \
	postgresql-client \
	make
RUN mkdir /home/rt4; chown rt4:rt4 /home/rt4
RUN mv /etc/rt4/RT_SiteConfig.pm /etc/rt4/RT_SiteConfig_Original.pm

# install Text::Markdown
RUN (echo y;echo o conf prerequisites_policy follow;echo o conf commit)|cpan; \
	cpan Text::Markdown

COPY scripts /scripts
