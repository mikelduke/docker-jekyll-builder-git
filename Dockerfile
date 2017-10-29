from jekyll/builder

RUN apk --no-cache add git
RUN gem install bundler

RUN chown -R jekyll:root /usr/local/* && \
    chmod -R 777 /usr/local/*
RUN chmod u+s /sbin/su-exec

ADD build.sh /srv/jekyll/
RUN chown jekyll:root /srv/jekyll/build.sh && \
    chmod -R 777 /srv/jekyll/build.sh

USER jekyll
CMD ["./build.sh"]
