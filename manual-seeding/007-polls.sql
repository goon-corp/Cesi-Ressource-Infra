-- =============================================================================
-- 007-polls.sql
-- 5 sondages de démonstration avec options multiples.
-- Ressources IDs  : f1000001-...-020 à 024
-- Polls IDs       : f6000001-...-001 à 005
-- Options IDs     : f7000001-...-001 à 022
-- =============================================================================

BEGIN;

-- ─── Ressources parentes ─────────────────────────────────────────────────────

INSERT INTO ressources (id, title, description, view_count, thumbnail_id, ressource_confidentiality_type_id, ressource_status_id, user_id, ressource_type_id, creation_time, update_time) VALUES

('f1000001-0000-0000-0000-000000000020',
 'Quelle est votre plus grande difficulté relationnelle ?',
 'Un sondage pour mieux comprendre les défis que vous rencontrez le plus souvent dans vos relations. Les résultats nous aideront à orienter nos futures ressources.',
 487,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000006',
 (SELECT id FROM ressource_types WHERE label = 'Sondage'),
 NOW() - INTERVAL '52 days', NOW() - INTERVAL '52 days'),

('f1000001-0000-0000-0000-000000000021',
 'Combien de temps consacrez-vous à vos proches chaque semaine ?',
 'Le temps de qualité est l''un des principaux langages de l''amour. Ce sondage dresse un état des lieux de la place accordée aux relations dans nos emplois du temps.',
 312,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressource_types WHERE label = 'Sondage'),
 NOW() - INTERVAL '46 days', NOW() - INTERVAL '46 days'),

('f1000001-0000-0000-0000-000000000022',
 'Quel format de ressource vous aide le plus ?',
 'Pour améliorer continuellement la plateforme, nous voulons connaître vos préférences. Quel type de contenu vous apporte le plus de valeur dans votre développement relationnel ?',
 276,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000002',
 (SELECT id FROM ressource_types WHERE label = 'Sondage'),
 NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days'),

('f1000001-0000-0000-0000-000000000023',
 'Avez-vous déjà consulté un thérapeute ou un coach relationnel ?',
 'La thérapie et le coaching sont encore tabous pour beaucoup. Ce sondage permet de prendre le pouls de la communauté sur le recours à l''accompagnement professionnel.',
 398,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000003',
 (SELECT id FROM ressource_types WHERE label = 'Sondage'),
 NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days'),

('f1000001-0000-0000-0000-000000000024',
 'Quelle compétence relationnelle souhaitez-vous développer en priorité ?',
 'Parmi les grandes compétences relationnelles, laquelle vous semble la plus importante à renforcer pour améliorer vos relations dans les prochains mois ?',
 351,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000005',
 (SELECT id FROM ressource_types WHERE label = 'Sondage'),
 NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days');

-- ─── Polls enfants ────────────────────────────────────────────────────────────

INSERT INTO polls (id, vote_count, ressource_id) VALUES
('f6000001-0000-0000-0000-000000000001', 214, 'f1000001-0000-0000-0000-000000000020'),
('f6000001-0000-0000-0000-000000000002', 143, 'f1000001-0000-0000-0000-000000000021'),
('f6000001-0000-0000-0000-000000000003', 121, 'f1000001-0000-0000-0000-000000000022'),
('f6000001-0000-0000-0000-000000000004', 178, 'f1000001-0000-0000-0000-000000000023'),
('f6000001-0000-0000-0000-000000000005', 162, 'f1000001-0000-0000-0000-000000000024');

-- ─── Options du sondage 1 : Difficulté relationnelle ─────────────────────────

INSERT INTO polls_options (id, option, creation_time, update_time, poll_id) VALUES
('f7000001-0000-0000-0000-000000000001', 'La communication (se faire comprendre et comprendre l''autre)',      NOW() - INTERVAL '52 days', NOW() - INTERVAL '52 days', 'f6000001-0000-0000-0000-000000000001'),
('f7000001-0000-0000-0000-000000000002', 'La gestion des conflits sans escalade',                             NOW() - INTERVAL '52 days', NOW() - INTERVAL '52 days', 'f6000001-0000-0000-0000-000000000001'),
('f7000001-0000-0000-0000-000000000003', 'Le manque de temps pour entretenir les relations',                  NOW() - INTERVAL '52 days', NOW() - INTERVAL '52 days', 'f6000001-0000-0000-0000-000000000001'),
('f7000001-0000-0000-0000-000000000004', 'Exprimer ses émotions sans vulnérabilité excessive',                NOW() - INTERVAL '52 days', NOW() - INTERVAL '52 days', 'f6000001-0000-0000-0000-000000000001'),
('f7000001-0000-0000-0000-000000000005', 'Maintenir la confiance sur le long terme',                         NOW() - INTERVAL '52 days', NOW() - INTERVAL '52 days', 'f6000001-0000-0000-0000-000000000001');

-- ─── Options du sondage 2 : Temps consacré aux proches ───────────────────────

INSERT INTO polls_options (id, option, creation_time, update_time, poll_id) VALUES
('f7000001-0000-0000-0000-000000000006', 'Moins de 5 heures par semaine',       NOW() - INTERVAL '46 days', NOW() - INTERVAL '46 days', 'f6000001-0000-0000-0000-000000000002'),
('f7000001-0000-0000-0000-000000000007', 'Entre 5 et 10 heures par semaine',    NOW() - INTERVAL '46 days', NOW() - INTERVAL '46 days', 'f6000001-0000-0000-0000-000000000002'),
('f7000001-0000-0000-0000-000000000008', 'Entre 10 et 20 heures par semaine',   NOW() - INTERVAL '46 days', NOW() - INTERVAL '46 days', 'f6000001-0000-0000-0000-000000000002'),
('f7000001-0000-0000-0000-000000000009', 'Plus de 20 heures par semaine',       NOW() - INTERVAL '46 days', NOW() - INTERVAL '46 days', 'f6000001-0000-0000-0000-000000000002');

-- ─── Options du sondage 3 : Format de ressource préféré ──────────────────────

INSERT INTO polls_options (id, option, creation_time, update_time, poll_id) VALUES
('f7000001-0000-0000-0000-000000000010', 'Articles de fond à lire à mon rythme',          NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days', 'f6000001-0000-0000-0000-000000000003'),
('f7000001-0000-0000-0000-000000000011', 'Vidéos et podcasts',                            NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days', 'f6000001-0000-0000-0000-000000000003'),
('f7000001-0000-0000-0000-000000000012', 'Ateliers et événements en présentiel',          NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days', 'f6000001-0000-0000-0000-000000000003'),
('f7000001-0000-0000-0000-000000000013', 'Quiz et exercices interactifs en ligne',        NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days', 'f6000001-0000-0000-0000-000000000003'),
('f7000001-0000-0000-0000-000000000014', 'Sondages communautaires pour partager son vécu', NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days', 'f6000001-0000-0000-0000-000000000003');

-- ─── Options du sondage 4 : Thérapie ou coaching ─────────────────────────────

INSERT INTO polls_options (id, option, creation_time, update_time, poll_id) VALUES
('f7000001-0000-0000-0000-000000000015', 'Oui, et c''était très bénéfique pour moi ou notre relation',   NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days', 'f6000001-0000-0000-0000-000000000004'),
('f7000001-0000-0000-0000-000000000016', 'Oui, mais les résultats ont été mitigés',                      NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days', 'f6000001-0000-0000-0000-000000000004'),
('f7000001-0000-0000-0000-000000000017', 'Non, mais j''envisage sérieusement de le faire',               NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days', 'f6000001-0000-0000-0000-000000000004'),
('f7000001-0000-0000-0000-000000000018', 'Non, je ne pense pas en avoir besoin pour l''instant',         NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days', 'f6000001-0000-0000-0000-000000000004');

-- ─── Options du sondage 5 : Compétence à développer ──────────────────────────

INSERT INTO polls_options (id, option, creation_time, update_time, poll_id) VALUES
('f7000001-0000-0000-0000-000000000019', 'L''écoute active et la présence à l''autre',                    NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days', 'f6000001-0000-0000-0000-000000000005'),
('f7000001-0000-0000-0000-000000000020', 'La gestion de mes émotions en situation tendue',                NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days', 'f6000001-0000-0000-0000-000000000005'),
('f7000001-0000-0000-0000-000000000021', 'L''assertivité (m''affirmer sans blesser ni me soumettre)',     NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days', 'f6000001-0000-0000-0000-000000000005'),
('f7000001-0000-0000-0000-000000000022', 'L''empathie et la compréhension des besoins de l''autre',      NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days', 'f6000001-0000-0000-0000-000000000005'),
('f7000001-0000-0000-0000-000000000023', 'La résolution de conflits de façon constructive',              NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days', 'f6000001-0000-0000-0000-000000000005');

-- ─── Tags sur les sondages ────────────────────────────────────────────────────

INSERT INTO ressource_tag (tag_id, ressource_id) VALUES
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000020'), -- Communication
('e1000001-0000-0000-0000-000000000003', 'f1000001-0000-0000-0000-000000000020'), -- Couple
('e1000001-0000-0000-0000-000000000004', 'f1000001-0000-0000-0000-000000000021'), -- Famille
('e1000001-0000-0000-0000-000000000008', 'f1000001-0000-0000-0000-000000000021'), -- Bien-être
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000022'), -- Développement personnel
('e1000001-0000-0000-0000-000000000003', 'f1000001-0000-0000-0000-000000000023'), -- Couple
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000024'), -- Développement personnel
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000024'); -- Communication

COMMIT;
