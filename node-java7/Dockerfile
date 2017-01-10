FROM ignicaodigital/java7

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y git-all && \
    apt-get install -y build-essential && \
    apt-get install -y nodejs


ENTRYPOINT ["/bin/bash"]
