## Lancement des differents env

```zsh
# Développement (charge base + override automatiquement)
docker compose up -d

# Production (base + prod, ignore override)
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

```

Exemple de fusion:

```YAML
# Fichier 1
environment:
  DEBUG: "false"
  API_KEY: "dev-key"

# Fichier 2
environment:
  DEBUG: "true"
  LOG_LEVEL: "info"

# Résultat fusionné
environment:
  DEBUG: "true"       # Écrasé
  API_KEY: "dev-key"  # Conservé
  LOG_LEVEL: "info"   # Ajouté
```

### Fichier env

creez en dev un fichier `.env.dev` et `.env.prod` qui contient les variables suivantes:

```
DB_HOST
DB_PORT
DB_USER
DB_PASSWORD
DB_NAME
POOL_MODE
MAX_CLIENT_CONN
DEFAULT_POOL_SIZE
MIN_POOL_SIZE
RESERVE_POOL_SIZE
LISTEN_ADDRESS
LISTEN_PORT
AUTH_TYPE
POSTGRES_USER
POSTGRES_PASSWORD
POSTGRES_DB
```

## Gestion des secrets en fonction de l'environnment

En regle generale si un service n'est pas compilé, les secrets build ne fonctionnent pas. Lorsqu'un service est basé sur une image existante, donc seulement au RUNTIME on passe par un `.env` classique, sur le docker-compose de dev:

```YAML
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
```

Quand on va passer à la production, important de créer les secrets avant de deployer la solution, comme ça:

```
# Depuis stdin (plus sûr)
echo "mon_mot_de_passe" | docker secret create db_password -
```

### En dev

SEULEMENT si le service vient d'une image custom, et donc est build:

```YAML
secrets:
  # Depuis un fichier
  from_file:
    file: ./secrets/api_key.txt

  # Depuis une variable d'environnement
  from_env:
    environment: API_KEY
```

### En production

En production, on passera par la pipeline de deploiement continue (pas encore intégrée). Les secrets seront presents dans settings du repo concerné, puis `secrets and variables`.

exemple de pipeline:

```YAML
name: Build and Push

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Build with secrets
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ghcr.io/${{ github.repository }}:latest
          secrets: |
            "npm_token=${{ secrets.NPM_TOKEN }}"
```
