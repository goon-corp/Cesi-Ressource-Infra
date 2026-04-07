#!/bin/bash

# =============================================================================
# seed.sh
# Applique tous les scripts SQL du dossier manual-seeding sur le container
# PostgreSQL. Doit être exécuté après la première démarrage de l'API
# (le compte default_user doit exister pour que le hash de mot de passe
# soit copié correctement).
# =============================================================================

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BOLD="\e[1m"
RESET="\e[0m"

CONTAINER="postgres"
DB_NAME="cesi_ressource_db"
DB_USER="user"
SCRIPTS_DIR="$(dirname "$0")/manual-seeding"

echo -e "${BOLD}=== Seeding manuel — Ressources Relationnelles ===${RESET}"
echo ""

# Vérifier que le container tourne
if ! docker inspect --format='{{.State.Running}}' "$CONTAINER" 2>/dev/null | grep -q "true"; then
  echo -e "${RED}Erreur : le container '${CONTAINER}' n'est pas démarré.${RESET}"
  exit 1
fi

# Appliquer chaque script dans l'ordre alphabétique (exclure flush.sql)
for script in $(ls "$SCRIPTS_DIR"/*.sql | grep -v flush.sql | sort); do
  filename=$(basename "$script")
  echo -e "${YELLOW}→ Application de ${filename}...${RESET}"
  if docker exec -i "$CONTAINER" psql -U "$DB_USER" -d "$DB_NAME" -v ON_ERROR_STOP=1 < "$script"; then
    echo -e "  ${GREEN}✔ OK${RESET}"
  else
    echo -e "  ${RED}✖ Échec sur ${filename} — seeding interrompu.${RESET}"
    exit 1
  fi
done

echo ""
echo -e "${GREEN}${BOLD}Seeding terminé avec succès.${RESET}"
echo ""
echo -e "Comptes créés (mot de passe identique au compte default_user) :"
echo "  sophie.martin@exemple.fr"
echo "  thomas.dubois@exemple.fr"
echo "  camille.bernard@exemple.fr"
echo "  lucas.moreau@exemple.fr"
echo "  emma.petit@exemple.fr"
echo "  antoine.rousseau@exemple.fr"
