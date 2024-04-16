# Используем базовый образ Jenkins LTS
FROM jenkins/jenkins:lts

# Переключаемся в режим root, чтобы установить Docker
USER root

# Устанавливаем необходимые пакеты для установки Docker
RUN apt-get update && \
    apt-get install -y apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg2 \
                       software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Возвращаемся в режим пользователя jenkins
USER jenkins
