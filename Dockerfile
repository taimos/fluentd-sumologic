FROM fluent/fluentd:latest-onbuild
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root
RUN apk --no-cache --update add sudo build-base ruby-dev && \

    sudo -u fluent gem install fluent-plugin-sumologic-2 && \

    rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem && sudo -u fluent gem sources -c && \
    apk del sudo build-base ruby-dev && rm -rf /var/cache/apk/*

EXPOSE 24284

COPY out_sumologic.rb /home/fluent/.gem/ruby/2.3.0/gems/fluent-plugin-sumologic-2-0.1.0/lib/fluent/plugin/out_sumologic.rb
COPY run.sh /home/fluent/run.sh

USER fluent
CMD /home/fluent/run.sh