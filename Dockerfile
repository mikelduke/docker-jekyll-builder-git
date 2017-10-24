from jekyll/builder

ADD build.sh /srv
RUN apk --no-cache add git

CMD ["/srv/build.sh"]
