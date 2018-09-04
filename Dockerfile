FROM ubuntu:xenial

LABEL maintainter="tinkercode@gmail.com"

COPY script.sh /root/script.sh

ENTRYPOINT ["/bin/bash", "-c",  "/root/script.sh"]
