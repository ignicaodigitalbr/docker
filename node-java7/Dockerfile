FROM ignicaodigital/java7

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y git-all build-essential nodejs


ENTRYPOINT ["/bin/bash"]
