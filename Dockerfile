
FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       curl \
       gnupg \
       unzip \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg \
       -o /etc/apt/keyrings/hashicorp.asc \
    && chmod a+r /etc/apt/keyrings/hashicorp.asc \
    && echo "deb [signed-by=/etc/apt/keyrings/hashicorp.asc] https://apt.releases.hashicorp.com $(. /etc/os-release && echo "$VERSION_CODENAME") main" \
       > /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends terraform \
    && rm -rf /var/lib/apt/lists/*

USER jenkins
