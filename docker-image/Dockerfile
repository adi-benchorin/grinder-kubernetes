FROM java:8-jdk-alpine

ENV GRINDER_VERSION 3.11

RUN mkdir -p /opt/grinder

RUN apk --update --no-cache add wget bash && \
    cd /tmp && \
    wget 'http://downloads.sourceforge.net/project/grinder/The%20Grinder%203/'${GRINDER_VERSION}/grinder-${GRINDER_VERSION}-binary.zip && \
    cd /opt/grinder && unzip /tmp/grinder-${GRINDER_VERSION}-binary.zip && rm /tmp/grinder-${GRINDER_VERSION}-binary.zip

EXPOSE 6373

ADD scripts /opt/grinder/scripts

COPY run.sh /opt/grinder/

RUN chmod 755 /opt/grinder/run.sh

ENV CLASSPATH /opt/grinder/grinder-${GRINDER_VERSION}/lib/grinder.jar

WORKDIR /opt/grinder

ENTRYPOINT ["sh", "run.sh"]
