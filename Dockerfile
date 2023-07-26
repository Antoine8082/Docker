# On utilise l'image Jenkins officielle disponible sur Docker Hub comme base
FROM jenkins/jenkins:lts

# On utilise l'utilisateur "root" pour pouvoir installer des packages
USER root

# On met à jour le système et on installe les packages nécessaires
RUN apt-get update && apt-get upgrade -y && apt-get install -y git curl

# On repasse à l'utilisateur jenkins pour la suite
USER jenkins

# On installe les plugins Jenkins que l'on souhaite utiliser
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# On expose le port 8080 pour accéder à l'interface Jenkins depuis l'extérieur du conteneur
EXPOSE 8080
