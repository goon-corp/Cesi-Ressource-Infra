#!/bin/bash

# =============================================================================
# flush.sh
# Supprime toutes les données insérées par le seeding manuel.
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
FLUSH_SCRIPT="$(dirname "$0")/manual-seeding/flush.sql"

# Lecture du mot de passe Redis depuis le .env.dev
ENV_FILE="$(dirname "$0")/.env.dev"
REDIS_PASSWORD=""
if [[ -f "$ENV_FILE" ]]; then
  REDIS_PASSWORD=$(grep -E '^REDIS_PASSWORD=' "$ENV_FILE" | cut -d'=' -f2-)
fi

echo -e "${BOLD}=== Flush du seeding manuel — Ressources Relationnelles ===${RESET}"
echo ""
echo -e "${YELLOW}Attention : cette opération supprime toutes les données de démonstration.${RESET}"
echo -n "Confirmer ? [y/N] "
read -r confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Annulé."
  exit 0
fi

# Vérifier que les containers tournent
if ! docker inspect --format='{{.State.Running}}' "$CONTAINER_PG" 2>/dev/null | grep -q "true"; then
  echo -e "${RED}Erreur : le container '${CONTAINER_PG}' n'est pas démarré.${RESET}"
  exit 1
fi
if ! docker inspect --format='{{.State.Running}}' "$CONTAINER_REDIS" 2>/dev/null | grep -q "true"; then
  echo -e "${YELLOW}Avertissement : le container '${CONTAINER_REDIS}' n'est pas démarré — cache ignoré.${RESET}"
  CONTAINER_REDIS=""
fi

echo ""
echo -e "${YELLOW}→ Application de flush.sql...${RESET}"
if docker exec -i "$CONTAINER_PG" psql -U "$DB_USER" -d "$DB_NAME" -v ON_ERROR_STOP=1 < "$FLUSH_SCRIPT"; then
  echo -e "  ${GREEN}✔ Base de données nettoyée.${RESET}"
else
  echo -e "${RED}✖ Le flush SQL a échoué. Vérifiez les logs ci-dessus.${RESET}"
  exit 1
fi

if [[ -n "$CONTAINER_REDIS" ]]; then
  echo -e "${YELLOW}→ Flush du cache Redis...${RESET}"
  if [[ -n "$REDIS_PASSWORD" ]]; then
    docker exec "$CONTAINER_REDIS" redis-cli -a "$REDIS_PASSWORD" FLUSHALL > /dev/null
  else
    docker exec "$CONTAINER_REDIS" redis-cli FLUSHALL > /dev/null
  fi
  echo -e "  ${GREEN}✔ Cache Redis vidé.${RESET}"
fi

echo ""
echo -e "${GREEN}${BOLD}✔ Flush terminé avec succès.${RESET}"
