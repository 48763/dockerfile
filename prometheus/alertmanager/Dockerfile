FROM lab.yukifans.com/library/golang-alpine:1.11

ENV alertmanager alertmanager-0.15.2.linux-amd64

WORKDIR /go/src/alertmanager
COPY    ${alertmanager}/ ./${alertmanager}

RUN cp ${alertmanager}/alertmanager /bin/ \
    && cp ${alertmanager}/amtool /bin/ \
    && mkdir -p /etc/alertmanager/template \
    && mv ./${alertmanager}/alertmanager.yml /etc/alertmanager/config.yml \
    && rm -rf /go

EXPOSE     9093

VOLUME     /alertmanager

ENTRYPOINT ["/bin/alertmanager"]
CMD        ["--config.file=/etc/alertmanager/config.yml", \
            "--storage.path=/alertmanager"]