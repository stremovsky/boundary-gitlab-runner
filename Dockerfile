FROM gitlab/gitlab-runner
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update ; apt install -y lsb-release gnupg2 apt-utils ; apt -y upgrade ; \
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg ; \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list ; \
    apt update ; apt install -y boundary
CMD boundary-login.sh ; gitlab-runner run
