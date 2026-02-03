BEGIN;

INSERT INTO users_roles (id, creation_time, role_label) VALUES
(gen_random_uuid(), NOW(), 'Administrateur'),
(gen_random_uuid(), NOW(), 'Modérateur'),
(gen_random_uuid(), NOW(), 'Utilisateur');

INSERT INTO backoffice_log_levels (id, label) VALUES
(gen_random_uuid(), 'INFO'),
(gen_random_uuid(), 'WARNING'),
(gen_random_uuid(), 'ERROR'),
(gen_random_uuid(), 'CRITICAL');

INSERT INTO backoffice_operation_types (id, label) VALUES
(gen_random_uuid(), 'CREATE'),
(gen_random_uuid(), 'UPDATE'),
(gen_random_uuid(), 'DELETE'),
(gen_random_uuid(), 'LOGIN');

INSERT INTO ressources_confidentiality_types (id, creation_time, label) VALUES
(gen_random_uuid(), NOW(), 'Public'),
(gen_random_uuid(), NOW(), 'Privé'),
(gen_random_uuid(), NOW(), 'Interne Citoyen');

INSERT INTO reports_types (id, creation_time, label) VALUES
(gen_random_uuid(), NOW(), 'Contenu Inapproprié'),
(gen_random_uuid(), NOW(), 'Spam'),
(gen_random_uuid(), NOW(), 'Erreur Technique');

INSERT INTO ressources_status (id, creation_time, label) VALUES
(gen_random_uuid(), NOW(), 'Brouillon'),
(gen_random_uuid(), NOW(), 'Validé'),
(gen_random_uuid(), NOW(), 'Archivé');

INSERT INTO ressource_types (id, creation_time, label) VALUES
(gen_random_uuid(), NOW(), 'Article'),
(gen_random_uuid(), NOW(), 'Défi'),
(gen_random_uuid(), NOW(), 'Cours PDF'),
(gen_random_uuid(), NOW(), 'Événement');

INSERT INTO regions (id, code, name, slug) VALUES
(1, '11', 'Île-de-France', 'ile-de-france'),
(2, '84', 'Auvergne-Rhône-Alpes', 'auvergne-rhone-alpes'),
(3, '76', 'Occitanie', 'occitanie');

COMMIT;