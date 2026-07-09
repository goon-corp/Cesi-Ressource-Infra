-- =============================================================================
-- 005-events.sql
-- 6 événements de démonstration (présentiel et en ligne).
-- Ressources IDs : f1000001-...-009 à 014
-- Events IDs     : f3000001-...-001 à 006
-- =============================================================================

BEGIN;

-- ─── Ressources parentes ─────────────────────────────────────────────────────

INSERT INTO ressources (id, title, description, view_count, thumbnail_id, ressource_confidentiality_type_id, ressource_status_id, user_id, ressource_type_id, creation_time, update_time) VALUES

('f1000001-0000-0000-0000-000000000009',
 'Atelier Communication Non Violente — Paris',
 'Une journée d''immersion pratique pour découvrir et expérimenter la CNV en petits groupes. Exercices en binômes, mises en situation et retours collectifs animés par une praticienne certifiée.',
 142,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000003',
 (SELECT id FROM ressource_types WHERE label = 'Événement'),
 NOW() - INTERVAL '20 days', NOW() - INTERVAL '20 days'),

('f1000001-0000-0000-0000-000000000010',
 'Conférence : Comprendre la théorie de l''attachement',
 'Webinaire gratuit d''1h30 animé par une psychologue clinicienne. Comment notre style d''attachement formé dans l''enfance influence-t-il nos relations adultes ? Avec session de questions-réponses.',
 198,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressource_types WHERE label = 'Événement'),
 NOW() - INTERVAL '18 days', NOW() - INTERVAL '18 days'),

('f1000001-0000-0000-0000-000000000011',
 'Séminaire : Gérer les conflits en milieu professionnel — Lyon',
 'Deux jours intensifs pour les managers et équipes RH souhaitant développer des compétences en résolution de conflits, gestion des tensions d''équipe et communication assertive.',
 87,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Interne Citoyen'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000006',
 (SELECT id FROM ressource_types WHERE label = 'Événement'),
 NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days'),

('f1000001-0000-0000-0000-000000000012',
 'Webinaire : Parentalité à l''ère numérique',
 'Comment maintenir un lien fort et authentique avec ses enfants dans un monde d''écrans et de connexions permanentes ? Un échange interactif avec des parents et des experts du développement de l''enfant.',
 176,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000002',
 (SELECT id FROM ressource_types WHERE label = 'Événement'),
 NOW() - INTERVAL '12 days', NOW() - INTERVAL '12 days'),

('f1000001-0000-0000-0000-000000000013',
 'Atelier pratique : Développer l''empathie au quotidien — Bordeaux',
 'Cet atelier de 3h combine apports théoriques et exercices pratiques pour renforcer votre capacité d''empathie. Ouvert à tous, en petit groupe de 8 personnes maximum pour favoriser les échanges.',
 93,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000005',
 (SELECT id FROM ressource_types WHERE label = 'Événement'),
 NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),

('f1000001-0000-0000-0000-000000000014',
 'Journée reconnexion : Méditation, nature et relations — Toulouse',
 'Une journée de ressourcement en pleine nature pour se reconnecter à soi et aux autres. Au programme : méditation guidée, marche en silence, partage en cercle et ateliers de communication bienveillante.',
 121,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000004',
 (SELECT id FROM ressource_types WHERE label = 'Événement'),
 NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days');

-- ─── Events enfants ───────────────────────────────────────────────────────────

INSERT INTO events (id, is_virtual, date_start, date_end, event_link, location, ressource_id) VALUES

('f3000001-0000-0000-0000-000000000001',
 false,
 NOW() + INTERVAL '14 days',
 NOW() + INTERVAL '14 days' + INTERVAL '8 hours',
 NULL,
 '12 rue de la Paix, 75001 Paris',
 'f1000001-0000-0000-0000-000000000009'),

('f3000001-0000-0000-0000-000000000002',
 true,
 NOW() + INTERVAL '30 days',
 NOW() + INTERVAL '30 days' + INTERVAL '90 minutes',
 'https://meet.exemple.fr/conference-attachement',
 'En ligne',
 'f1000001-0000-0000-0000-000000000010'),

('f3000001-0000-0000-0000-000000000003',
 false,
 NOW() + INTERVAL '21 days',
 NOW() + INTERVAL '23 days',
 NULL,
 'Centre de conférences Confluence, 69002 Lyon',
 'f1000001-0000-0000-0000-000000000011'),

('f3000001-0000-0000-0000-000000000004',
 true,
 NOW() + INTERVAL '10 days',
 NOW() + INTERVAL '10 days' + INTERVAL '2 hours',
 'https://zoom.exemple.fr/webinaire-parentalite',
 'En ligne',
 'f1000001-0000-0000-0000-000000000012'),

('f3000001-0000-0000-0000-000000000005',
 false,
 NOW() + INTERVAL '35 days',
 NOW() + INTERVAL '35 days' + INTERVAL '3 hours',
 NULL,
 'Espace associatif Les Capucins, 33000 Bordeaux',
 'f1000001-0000-0000-0000-000000000013'),

('f3000001-0000-0000-0000-000000000006',
 false,
 NOW() + INTERVAL '42 days',
 NOW() + INTERVAL '42 days' + INTERVAL '9 hours',
 NULL,
 'Domaine de la Saudrune, 31000 Toulouse',
 'f1000001-0000-0000-0000-000000000014');

-- ─── Tags sur les événements ──────────────────────────────────────────────────

INSERT INTO ressource_tag (tag_id, ressource_id) VALUES
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000009'), -- Communication
('e1000001-0000-0000-0000-000000000007', 'f1000001-0000-0000-0000-000000000009'), -- Empathie
('e1000001-0000-0000-0000-000000000004', 'f1000001-0000-0000-0000-000000000010'), -- Famille
('e1000001-0000-0000-0000-000000000007', 'f1000001-0000-0000-0000-000000000010'), -- Empathie
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000011'), -- Communication
('e1000001-0000-0000-0000-000000000002', 'f1000001-0000-0000-0000-000000000011'), -- Gestion du stress
('e1000001-0000-0000-0000-000000000004', 'f1000001-0000-0000-0000-000000000012'), -- Famille
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000012'), -- Développement personnel
('e1000001-0000-0000-0000-000000000007', 'f1000001-0000-0000-0000-000000000013'), -- Empathie
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000013'), -- Développement personnel
('e1000001-0000-0000-0000-000000000008', 'f1000001-0000-0000-0000-000000000014'), -- Bien-être
('e1000001-0000-0000-0000-000000000002', 'f1000001-0000-0000-0000-000000000014'); -- Gestion du stress

COMMIT;
