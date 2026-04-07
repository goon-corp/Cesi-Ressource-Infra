-- =============================================================================
-- 006-quizzes.sql
-- 5 quiz interactifs avec 4 questions chacun.
-- Ressources IDs  : f1000001-...-015 à 019
-- Quizzes IDs     : f4000001-...-001 à 005
-- Questions IDs   : f5000001-...-001 à 020
-- =============================================================================

BEGIN;

-- ─── Ressources parentes ─────────────────────────────────────────────────────

INSERT INTO ressources (id, title, description, view_count, thumbnail_id, ressource_confidentiality_type_id, ressource_status_id, user_id, ressource_type_id, creation_time, update_time) VALUES

('f1000001-0000-0000-0000-000000000015',
 'Quel communicant êtes-vous ?',
 'Découvrez votre style de communication dominant à travers 4 questions clés. Ce quiz vous aidera à identifier vos points forts et les axes à développer pour des échanges plus fluides.',
 412,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressource_types WHERE label = 'Quizz'),
 NOW() - INTERVAL '48 days', NOW() - INTERVAL '48 days'),

('f1000001-0000-0000-0000-000000000016',
 'Testez votre intelligence émotionnelle',
 'L''intelligence émotionnelle (QE) est l''une des compétences les plus importantes dans vos relations. Ce quiz évalue votre niveau actuel et vous donne des pistes pour progresser.',
 387,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000002',
 (SELECT id FROM ressource_types WHERE label = 'Quizz'),
 NOW() - INTERVAL '43 days', NOW() - INTERVAL '43 days'),

('f1000001-0000-0000-0000-000000000017',
 'Ma relation est-elle saine ?',
 'Répondez honnêtement à ces 4 questions pour évaluer la santé de votre relation actuelle. Un outil de réflexion, pas de jugement. Pour les couples, amis, et relations familiales.',
 524,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000003',
 (SELECT id FROM ressource_types WHERE label = 'Quizz'),
 NOW() - INTERVAL '38 days', NOW() - INTERVAL '38 days'),

('f1000001-0000-0000-0000-000000000018',
 'Connaissez-vous les 5 langages de l''amour ?',
 'Gary Chapman a identifié 5 façons d''exprimer et de recevoir l''amour. Testez vos connaissances sur cette théorie qui a transformé des millions de relations.',
 298,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000004',
 (SELECT id FROM ressource_types WHERE label = 'Quizz'),
 NOW() - INTERVAL '32 days', NOW() - INTERVAL '32 days'),

('f1000001-0000-0000-0000-000000000019',
 'Gérez-vous bien le stress relationnel ?',
 'Le stress dans les relations est souvent sous-estimé. Ce quiz vous aide à identifier comment vous réagissez sous pression relationnelle et quelles stratégies seraient les plus adaptées.',
 341,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000005',
 (SELECT id FROM ressource_types WHERE label = 'Quizz'),
 NOW() - INTERVAL '27 days', NOW() - INTERVAL '27 days');

-- ─── Quizzes enfants ──────────────────────────────────────────────────────────

INSERT INTO quizzes (id, participation_count, ressource_id) VALUES
('f4000001-0000-0000-0000-000000000001', 187, 'f1000001-0000-0000-0000-000000000015'),
('f4000001-0000-0000-0000-000000000002', 154, 'f1000001-0000-0000-0000-000000000016'),
('f4000001-0000-0000-0000-000000000003', 231, 'f1000001-0000-0000-0000-000000000017'),
('f4000001-0000-0000-0000-000000000004', 112, 'f1000001-0000-0000-0000-000000000018'),
('f4000001-0000-0000-0000-000000000005', 143, 'f1000001-0000-0000-0000-000000000019');

-- ─── Questions du quiz 1 : Quel communicant êtes-vous ? ──────────────────────

INSERT INTO quizzes_questions (id, question, possible_answers, correct_answer, creation_time, update_time, quizz_id) VALUES

('f5000001-0000-0000-0000-000000000001',
 'En situation de désaccord, vous avez tendance à...',
 '["Éviter le sujet pour garder la paix", "Exprimer vos besoins clairement et écouter l''autre", "Imposer votre point de vue", "Chercher immédiatement un compromis sans vous exprimer"]'::jsonb,
 'Exprimer vos besoins clairement et écouter l''autre',
 NOW() - INTERVAL '48 days', NOW() - INTERVAL '48 days',
 'f4000001-0000-0000-0000-000000000001'),

('f5000001-0000-0000-0000-000000000002',
 'Quand quelqu''un vous parle, vous...',
 '["Préparez mentalement votre réponse pendant qu''il parle", "Êtes pleinement à l''écoute sans autre pensée", "Interrompez pour montrer que vous comprenez", "Regardez souvent votre téléphone ou autour de vous"]'::jsonb,
 'Êtes pleinement à l''écoute sans autre pensée',
 NOW() - INTERVAL '48 days', NOW() - INTERVAL '48 days',
 'f4000001-0000-0000-0000-000000000001'),

('f5000001-0000-0000-0000-000000000003',
 'Face à une critique, votre réaction spontanée est de...',
 '["Vous défendre immédiatement", "Écouter et prendre du recul avant de répondre", "Vous sentir blessé(e) et vous taire", "Retourner la critique à votre interlocuteur"]'::jsonb,
 'Écouter et prendre du recul avant de répondre',
 NOW() - INTERVAL '48 days', NOW() - INTERVAL '48 days',
 'f4000001-0000-0000-0000-000000000001'),

('f5000001-0000-0000-0000-000000000004',
 'Pour vous, une bonne communication repose avant tout sur...',
 '["La clarté du message exprimé", "L''équilibre entre expression et écoute", "Éviter les sujets qui créent des tensions", "Convaincre l''autre de votre point de vue"]'::jsonb,
 'L''équilibre entre expression et écoute',
 NOW() - INTERVAL '48 days', NOW() - INTERVAL '48 days',
 'f4000001-0000-0000-0000-000000000001');

-- ─── Questions du quiz 2 : Intelligence émotionnelle ─────────────────────────

INSERT INTO quizzes_questions (id, question, possible_answers, correct_answer, creation_time, update_time, quizz_id) VALUES

('f5000001-0000-0000-0000-000000000005',
 'Êtes-vous capable d''identifier précisément vos émotions en temps réel ?',
 '["Rarement, je ressens surtout du bien-être ou du malaise", "Parfois, selon l''intensité de l''émotion", "Souvent, j''ai un vocabulaire émotionnel assez riche", "Toujours, je nomme mes émotions avec précision"]'::jsonb,
 'Toujours, je nomme mes émotions avec précision',
 NOW() - INTERVAL '43 days', NOW() - INTERVAL '43 days',
 'f4000001-0000-0000-0000-000000000002'),

('f5000001-0000-0000-0000-000000000006',
 'Lorsque vous êtes en colère, que faites-vous généralement ?',
 '["Vous emportez et le regrettez souvent", "Refoulez et faites comme si rien n''était", "Prenez du recul puis exprimez calmement", "Dirigez votre énergie vers une activité physique"]'::jsonb,
 'Prenez du recul puis exprimez calmement',
 NOW() - INTERVAL '43 days', NOW() - INTERVAL '43 days',
 'f4000001-0000-0000-0000-000000000002'),

('f5000001-0000-0000-0000-000000000007',
 'En présence d''un ami qui souffre, vous...',
 '["Cherchez immédiatement des solutions pratiques", "Écoutez attentivement en vous mettant à sa place", "Relativisez pour l''aider à aller mieux", "Partagez une expérience similaire que vous avez vécue"]'::jsonb,
 'Écoutez attentivement en vous mettant à sa place',
 NOW() - INTERVAL '43 days', NOW() - INTERVAL '43 days',
 'f4000001-0000-0000-0000-000000000002'),

('f5000001-0000-0000-0000-000000000008',
 'Les émotions des autres vous...',
 '["Laissent globalement indifférent(e)", "Affectent parfois très fortement", "Permettent de mieux les comprendre et adapter votre attitude", "Mettent souvent mal à l''aise"]'::jsonb,
 'Permettent de mieux les comprendre et adapter votre attitude',
 NOW() - INTERVAL '43 days', NOW() - INTERVAL '43 days',
 'f4000001-0000-0000-0000-000000000002');

-- ─── Questions du quiz 3 : Ma relation est-elle saine ? ──────────────────────

INSERT INTO quizzes_questions (id, question, possible_answers, correct_answer, creation_time, update_time, quizz_id) VALUES

('f5000001-0000-0000-0000-000000000009',
 'Dans votre relation, chacun peut exprimer ses opinions librement ?',
 '["Non, l''un d''entre nous domine clairement les décisions", "Parfois, selon les sujets abordés", "Oui, mais cela crée parfois des tensions importantes", "Oui, toujours dans un respect mutuel"]'::jsonb,
 'Oui, toujours dans un respect mutuel',
 NOW() - INTERVAL '38 days', NOW() - INTERVAL '38 days',
 'f4000001-0000-0000-0000-000000000003'),

('f5000001-0000-0000-0000-000000000010',
 'Comment réagit votre partenaire quand vous voyez vos amis ou votre famille ?',
 '["Il/elle me l''interdit ou me le reproche systématiquement", "Il/elle est parfois jaloux(se) ou possessif(ve)", "Il/elle encourage mon autonomie et ma vie sociale", "Il/elle préfère être présent(e) à chaque fois"]'::jsonb,
 'Il/elle encourage mon autonomie et ma vie sociale',
 NOW() - INTERVAL '38 days', NOW() - INTERVAL '38 days',
 'f4000001-0000-0000-0000-000000000003'),

('f5000001-0000-0000-0000-000000000011',
 'Après une dispute, comment se passe généralement la réconciliation ?',
 '["L''un cède toujours sans vraie discussion", "On évite le sujet et on passe à autre chose", "On discute calmement et on cherche ensemble des solutions", "Le silence peut durer plusieurs jours"]'::jsonb,
 'On discute calmement et on cherche ensemble des solutions',
 NOW() - INTERVAL '38 days', NOW() - INTERVAL '38 days',
 'f4000001-0000-0000-0000-000000000003'),

('f5000001-0000-0000-0000-000000000012',
 'Vous sentez-vous respecté(e) dans votre relation ?',
 '["Non, je me sens souvent dévalorisé(e) ou ignoré(e)", "Ça dépend de l''humeur de l''autre", "Oui, la plupart du temps", "Oui, toujours, même en situation de désaccord"]'::jsonb,
 'Oui, toujours, même en situation de désaccord',
 NOW() - INTERVAL '38 days', NOW() - INTERVAL '38 days',
 'f4000001-0000-0000-0000-000000000003');

-- ─── Questions du quiz 4 : Les 5 langages de l'amour ────────────────────────

INSERT INTO quizzes_questions (id, question, possible_answers, correct_answer, creation_time, update_time, quizz_id) VALUES

('f5000001-0000-0000-0000-000000000013',
 'Vous vous sentez le plus aimé(e) quand votre partenaire...',
 '["Vous dit des mots doux et vous complimente", "Vous offre des cadeaux attentionnés", "Passe du temps de qualité avec vous, sans distraction", "Vous aide concrètement dans les tâches du quotidien"]'::jsonb,
 'Passe du temps de qualité avec vous, sans distraction',
 NOW() - INTERVAL '32 days', NOW() - INTERVAL '32 days',
 'f4000001-0000-0000-0000-000000000004'),

('f5000001-0000-0000-0000-000000000014',
 'Les mots d''affirmation dans une relation, c''est...',
 '["Peu important, les actes comptent bien plus", "Essentiel pour se sentir valorisé(e) au quotidien", "Agréable mais absolument pas indispensable", "Un signe de dépendance affective"]'::jsonb,
 'Essentiel pour se sentir valorisé(e) au quotidien',
 NOW() - INTERVAL '32 days', NOW() - INTERVAL '32 days',
 'f4000001-0000-0000-0000-000000000004'),

('f5000001-0000-0000-0000-000000000015',
 'Selon Gary Chapman, combien de langages de l''amour existent-ils ?',
 '["3", "4", "5", "7"]'::jsonb,
 '5',
 NOW() - INTERVAL '32 days', NOW() - INTERVAL '32 days',
 'f4000001-0000-0000-0000-000000000004'),

('f5000001-0000-0000-0000-000000000016',
 'Lequel de ces éléments N''est PAS un langage de l''amour selon Chapman ?',
 '["Les paroles valorisantes", "Le toucher physique", "L''humour et la complicité partagée", "Les cadeaux"]'::jsonb,
 'L''humour et la complicité partagée',
 NOW() - INTERVAL '32 days', NOW() - INTERVAL '32 days',
 'f4000001-0000-0000-0000-000000000004');

-- ─── Questions du quiz 5 : Gestion du stress relationnel ─────────────────────

INSERT INTO quizzes_questions (id, question, possible_answers, correct_answer, creation_time, update_time, quizz_id) VALUES

('f5000001-0000-0000-0000-000000000017',
 'Quand une situation vous stresse dans votre relation, vous...',
 '["Exprimez votre frustration immédiatement sans filtre", "Gardez tout pour vous jusqu''à l''explosion", "En parlez calmement quand vous êtes prêt(e)", "Fuyez la discussion aussi longtemps que possible"]'::jsonb,
 'En parlez calmement quand vous êtes prêt(e)',
 NOW() - INTERVAL '27 days', NOW() - INTERVAL '27 days',
 'f4000001-0000-0000-0000-000000000005'),

('f5000001-0000-0000-0000-000000000018',
 'Quelle technique aide le mieux à désamorcer une tension relationnelle ?',
 '["Ignorer le problème jusqu''à ce qu''il se résolve seul", "La respiration consciente et le recul avant de répondre", "Exprimer directement sa frustration sans filtre", "Consulter ses amis pour obtenir leur validation"]'::jsonb,
 'La respiration consciente et le recul avant de répondre',
 NOW() - INTERVAL '27 days', NOW() - INTERVAL '27 days',
 'f4000001-0000-0000-0000-000000000005'),

('f5000001-0000-0000-0000-000000000019',
 'Le stress chronique dans une relation peut entraîner...',
 '["Un renforcement des liens par l''adversité partagée", "Une distanciation émotionnelle progressive", "Une meilleure communication sur le long terme", "Des habitudes de vie plus saines"]'::jsonb,
 'Une distanciation émotionnelle progressive',
 NOW() - INTERVAL '27 days', NOW() - INTERVAL '27 days',
 'f4000001-0000-0000-0000-000000000005'),

('f5000001-0000-0000-0000-000000000020',
 'Quel est le premier réflexe sain face à un désaccord stressant ?',
 '["Convaincre l''autre qu''il a tort le plus vite possible", "Se donner du temps pour se calmer avant d''aborder le sujet", "Demander l''avis d''un tiers immédiatement", "Mettre fin à la relation si le stress dépasse un seuil"]'::jsonb,
 'Se donner du temps pour se calmer avant d''aborder le sujet',
 NOW() - INTERVAL '27 days', NOW() - INTERVAL '27 days',
 'f4000001-0000-0000-0000-000000000005');

-- ─── Tags sur les quizzes ─────────────────────────────────────────────────────

INSERT INTO ressource_tag (tag_id, ressource_id) VALUES
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000015'), -- Communication
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000016'), -- Développement personnel
('e1000001-0000-0000-0000-000000000007', 'f1000001-0000-0000-0000-000000000016'), -- Empathie
('e1000001-0000-0000-0000-000000000003', 'f1000001-0000-0000-0000-000000000017'), -- Couple
('e1000001-0000-0000-0000-000000000003', 'f1000001-0000-0000-0000-000000000018'), -- Couple
('e1000001-0000-0000-0000-000000000008', 'f1000001-0000-0000-0000-000000000018'), -- Bien-être
('e1000001-0000-0000-0000-000000000002', 'f1000001-0000-0000-0000-000000000019'), -- Gestion du stress
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000019'); -- Communication

COMMIT;
