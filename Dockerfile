from jekyll/builder

RUN apk --no-cache add git
RUN gem install bundler

RUN chown -R jekyll:jekyll /usr/local/* && \
    chmod -R 777 /usr/local/*
RUN chmod u+s /sbin/su-exec

ADD build.sh /home/jekyll
RUN chown jekyll:jekyll /home/jekyll/build.sh && \
    chmod -R 777 /home/jekyll/build.sh

USER jekyll
CMD ["/home/jekyll/build.sh"]
