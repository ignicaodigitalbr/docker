FROM ubuntu:14.04

RUN apt-get update -y

RUN apt-get install wget unzip -y

RUN wget https://releases.hashicorp.com/terraform/0.9.1/terraform_0.9.1_linux_amd64.zip

RUN unzip terraform_0.9.1_linux_amd64.zip
RUN rm terraform_0.9.1_linux_amd64.zip
RUN mv terraform /bin/

ENTRYPOINT terraform
