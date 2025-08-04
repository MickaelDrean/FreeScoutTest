#!/bin/bash

# Transforme l'URL Gitpod (https://<id>.ws.gitpod.io) pour remplacer le port
export PUBLIC_URL=${GITPOD_WORKSPACE_URL/https:\/\//https:\/\/8080-}
export PUBLIC_URL=${PUBLIC_URL/ws/ws-eu}

# Ajoute le fichier .env attendu par docker-compose avec la bonne URL
cat <<EOF > .env
SITE_URL=$PUBLIC_URL
DB_HOST=db
DB_NAME=freescout
DB_USER=freescout
DB_PASSWORD=freescout
DB_PASS=freescout
ADMIN_EMAIL=admin@example.com
ADMIN_PASS=Admin1234
EOF

# Lance les containers
docker-compose up -d
