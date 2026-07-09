#!/bin/bash

# =============================================================================
# hard-flush.sh
# Remet la base à son état post-migrations initial et vide le cache Redis.
# Conserve uniquement default_user et default_administrator.
# =============================================================================

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BOLD="\e[1m"
RESET="\e[0m"

CONTAINER_PG="postgres"
CONTAINER_REDIS="redis"
DB_NAME="cesi_ressource_db"
DB_USER="user"
HARD_FLUSH_SCRIPT="$(dirname "$0")/manual-seeding/hard-flush.sql"

ENV_FILE="$(dirname "$0")/.env.dev"
REDIS_PASSWORD=""
if [[ -f "$ENV_FILE" ]]; then
  REDIS_PASSWORD=$(grep -E '^REDIS_PASSWORD=' "$ENV_FILE" | cut -d'=' -f2-)
fi

echo -e "${BOLD}=== Hard Flush — Ressources Relationnelles ===${RESET}"
echo ""
echo -e "${RED}${BOLD}ATTENTION : cette opération efface TOUTES les données (ressources,${RESET}"
echo -e "${RED}${BOLD}commentaires, signalements, utilisateurs, cache...).${RESET}"
echo -e "${RED}${BOLD}Seuls default_user et default_administrator seront conservés.${RESET}"
echo ""
echo -n "Confirmer ? [y/N] "
read -r confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Annulé."
  exit 0
fi

# Vérifier que le container PostgreSQL tourne
if ! docker inspect --format='{{.State.Running}}' "$CONTAINER_PG" 2>/dev/null | grep -q "true"; then
  echo -e "${RED}Erreur : le container '${CONTAINER_PG}' n'est pas démarré.${RESET}"
  exit 1
fi

echo ""
echo -e "${YELLOW}→ Hard flush de la base de données...${RESET}"
if docker exec -i "$CONTAINER_PG" psql -U "$DB_USER" -d "$DB_NAME" -v ON_ERROR_STOP=1 < "$HARD_FLUSH_SCRIPT"; then
  echo -e "  ${GREEN}✔ Base de données réinitialisée.${RESET}"
else
  echo -e "${RED}✖ Le hard flush a échoué. Vérifiez les logs ci-dessus.${RESET}"
  exit 1
fi

# Flush Redis si disponible
if docker inspect --format='{{.State.Running}}' "$CONTAINER_REDIS" 2>/dev/null | grep -q "true"; then
  echo -e "${YELLOW}→ Flush du cache Redis...${RESET}"
  if [[ -n "$REDIS_PASSWORD" ]]; then
    docker exec "$CONTAINER_REDIS" redis-cli -a "$REDIS_PASSWORD" FLUSHALL > /dev/null
  else
    docker exec "$CONTAINER_REDIS" redis-cli FLUSHALL > /dev/null
  fi
  echo -e "  ${GREEN}✔ Cache Redis vidé.${RESET}"
else
  echo -e "${YELLOW}  Avertissement : container '${CONTAINER_REDIS}' non démarré — cache ignoré.${RESET}"
fi

echo ""
echo -e "${GREEN}${BOLD}✔ Hard flush terminé.${RESET}"
echo -e "Comptes conservés : ${BOLD}default_user${RESET} et ${BOLD}default_administrator${RESET}"
