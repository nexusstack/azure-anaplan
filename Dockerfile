FROM alpine:latest
 
RUN apk add --no-cache \
 openjdk8-jre \
 mailx \
 postfix \
 unzip \
 libc6-compat \
 curl \
 tzdata \
 sed

RUN mkdir /tmp/pkg \
 && cd /tmp/pkg \
 && wget https://aka.ms/downloadazcopy-v10-linux \
 && tar -xvf downloadazcopy-v10-linux \
 && cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

RUN cd /tmp/pkg \
 && wget https://downloads.anaplan.com/add-ins/connect/anaplan-connect-1.4.4.zip \
 && cd /usr/local/ && unzip /tmp/pkg/anaplan-connect-1.4.4.zip

RUN rm -rf /tmp/pkg

CMD ["/anaplan/scripts/entrypoint.sh"]
