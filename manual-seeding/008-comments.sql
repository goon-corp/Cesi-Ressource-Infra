-- =============================================================================
-- 008-comments.sql
-- Commentaires sur les ressources, avec quelques réponses imbriquées.
-- Comments IDs : f8000001-...-001 à 030
-- =============================================================================

BEGIN;

-- ─── Commentaires sur l'article CNV (001) ────────────────────────────────────

INSERT INTO comments (id, content, comment_id, ressource_id, user_id, creation_time, update_time) VALUES

('f8000001-0000-0000-0000-000000000001',
 'Article absolument remarquable. J''applique la CNV depuis 6 mois et ça a transformé mes échanges avec mon conjoint. La distinction observation/jugement est la clé.',
 NULL, 'f1000001-0000-0000-0000-000000000001', 'a1000001-0000-0000-0000-000000000002',
 NOW() - INTERVAL '50 days', NOW() - INTERVAL '50 days'),

('f8000001-0000-0000-0000-000000000002',
 'Merci Thomas ! La pratique régulière est vraiment essentielle. Les premiers mois sont les plus difficiles car on revient vite à nos automatismes.',
 'f8000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000001', 'a1000001-0000-0000-0000-000000000001',
 NOW() - INTERVAL '49 days', NOW() - INTERVAL '49 days'),

('f8000001-0000-0000-0000-000000000003',
 'La partie sur l''empathie envers l''autre m''a beaucoup touchée. On a tendance à se concentrer sur l''expression de soi et oublier que la CNV c''est aussi recevoir.',
 NULL, 'f1000001-0000-0000-0000-000000000001', 'a1000001-0000-0000-0000-000000000003',
 NOW() - INTERVAL '47 days', NOW() - INTERVAL '47 days'),

('f8000001-0000-0000-0000-000000000004',
 'Est-ce qu''il existe des ressources pour pratiquer la CNV avec des enfants ? Je travaille en école primaire et ça m''intéresserait beaucoup.',
 NULL, 'f1000001-0000-0000-0000-000000000001', 'a1000001-0000-0000-0000-000000000004',
 NOW() - INTERVAL '44 days', NOW() - INTERVAL '44 days'),

-- ─── Commentaires sur l'article Conflits de couple (002) ─────────────────────

('f8000001-0000-0000-0000-000000000005',
 'La technique du "soft startup" a changé ma vie. J''avais tendance à attaquer directement et mon partenaire se fermait complètement. Maintenant on peut enfin se parler.',
 NULL, 'f1000001-0000-0000-0000-000000000002', 'a1000001-0000-0000-0000-000000000005',
 NOW() - INTERVAL '45 days', NOW() - INTERVAL '45 days'),

('f8000001-0000-0000-0000-000000000006',
 'Les travaux de Gottman sont vraiment solides. J''ai lu "The Seven Principles for Making Marriage Work" et c''est une mine d''or. Merci de partager ces recherches.',
 NULL, 'f1000001-0000-0000-0000-000000000002', 'a1000001-0000-0000-0000-000000000006',
 NOW() - INTERVAL '43 days', NOW() - INTERVAL '43 days'),

('f8000001-0000-0000-0000-000000000007',
 'La pause de 20 minutes est ce qui nous a le plus aidés. On avait un signal (lever la main) et ça permettait de sortir de l''escalade sans que l''autre se sente abandonné.',
 'f8000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000002', 'a1000001-0000-0000-0000-000000000001',
 NOW() - INTERVAL '42 days', NOW() - INTERVAL '42 days'),

-- ─── Commentaires sur l'article Écoute active (003) ──────────────────────────

('f8000001-0000-0000-0000-000000000008',
 'Le point sur le silence m''a surpris. J''avais toujours tendance à remplir les blancs par peur du malaise. Depuis que je laisse des espaces, mes proches vont naturellement plus loin.',
 NULL, 'f1000001-0000-0000-0000-000000000003', 'a1000001-0000-0000-0000-000000000004',
 NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days'),

('f8000001-0000-0000-0000-000000000009',
 'La reformulation c''est vraiment un art. Au début ça semble artificiel, mais avec la pratique ça devient naturel et les gens se sentent tellement mieux compris.',
 NULL, 'f1000001-0000-0000-0000-000000000003', 'a1000001-0000-0000-0000-000000000002',
 NOW() - INTERVAL '39 days', NOW() - INTERVAL '39 days'),

('f8000001-0000-0000-0000-000000000010',
 'Article très clair et bien structuré. Je l''ai partagé à toute mon équipe. Merci Camille !',
 NULL, 'f1000001-0000-0000-0000-000000000003', 'a1000001-0000-0000-0000-000000000006',
 NOW() - INTERVAL '37 days', NOW() - INTERVAL '37 days'),

-- ─── Commentaires sur l'article Intelligence émotionnelle (005) ──────────────

('f8000001-0000-0000-0000-000000000011',
 'La règle des 90 secondes de Jill Bolte Taylor est fascinante. Je l''explique maintenant à mes ados et ça les aide à comprendre pourquoi ils se sentent "pris" par leurs émotions.',
 NULL, 'f1000001-0000-0000-0000-000000000005', 'a1000001-0000-0000-0000-000000000003',
 NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days'),

('f8000001-0000-0000-0000-000000000012',
 'L''étape 1 sur le vocabulaire émotionnel m''a ouvert les yeux. J''utilisais "stressé" pour tout. Maintenant je distingue anxieux, appréhensif, épuisé... et ça change vraiment quelque chose.',
 NULL, 'f1000001-0000-0000-0000-000000000005', 'a1000001-0000-0000-0000-000000000005',
 NOW() - INTERVAL '33 days', NOW() - INTERVAL '33 days'),

-- ─── Commentaires sur l'atelier CNV Paris (009) ───────────────────────────────

('f8000001-0000-0000-0000-000000000013',
 'Je suis inscrite ! Est-ce qu''il faut avoir lu des choses sur la CNV au préalable ou l''atelier est accessible aux débutants ?',
 NULL, 'f1000001-0000-0000-0000-000000000009', 'a1000001-0000-0000-0000-000000000004',
 NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days'),

('f8000001-0000-0000-0000-000000000014',
 'L''atelier est totalement accessible aux débutants ! Nous partons des bases et progressons ensemble. Bienvenue Emma !',
 'f8000001-0000-0000-0000-000000000013', 'f1000001-0000-0000-0000-000000000009', 'a1000001-0000-0000-0000-000000000003',
 NOW() - INTERVAL '14 days', NOW() - INTERVAL '14 days'),

('f8000001-0000-0000-0000-000000000015',
 'J''ai participé à l''édition précédente. C''est une journée qui m''a profondément marqué. Les exercices en binômes sont particulièrement puissants.',
 NULL, 'f1000001-0000-0000-0000-000000000009', 'a1000001-0000-0000-0000-000000000002',
 NOW() - INTERVAL '13 days', NOW() - INTERVAL '13 days'),

-- ─── Commentaires sur la conférence Attachement (010) ────────────────────────

('f8000001-0000-0000-0000-000000000016',
 'La théorie de l''attachement m''a aidé à comprendre pourquoi je réagis si fortement dans certaines situations relationnelles. Hâte d''approfondir avec cette conférence.',
 NULL, 'f1000001-0000-0000-0000-000000000010', 'a1000001-0000-0000-0000-000000000006',
 NOW() - INTERVAL '12 days', NOW() - INTERVAL '12 days'),

('f8000001-0000-0000-0000-000000000017',
 'Y aura-t-il un replay disponible ? Je ne peux pas être là en direct mais le sujet m''intéresse beaucoup.',
 NULL, 'f1000001-0000-0000-0000-000000000010', 'a1000001-0000-0000-0000-000000000004',
 NOW() - INTERVAL '11 days', NOW() - INTERVAL '11 days'),

-- ─── Commentaires sur le quiz "Quel communicant êtes-vous ?" (015) ────────────

('f8000001-0000-0000-0000-000000000018',
 'Quiz très bien fait et les questions sont vraiment pertinentes. J''aurais adoré avoir un résultat plus détaillé à la fin pour comprendre mon profil.',
 NULL, 'f1000001-0000-0000-0000-000000000015', 'a1000001-0000-0000-0000-000000000005',
 NOW() - INTERVAL '42 days', NOW() - INTERVAL '42 days'),

('f8000001-0000-0000-0000-000000000019',
 'Merci pour ce retour ! Un profil détaillé est prévu dans la prochaine version. En attendant, l''article sur la CNV complète bien ce quiz.',
 'f8000001-0000-0000-0000-000000000018', 'f1000001-0000-0000-0000-000000000015', 'a1000001-0000-0000-0000-000000000001',
 NOW() - INTERVAL '41 days', NOW() - INTERVAL '41 days'),

('f8000001-0000-0000-0000-000000000020',
 'Je l''ai fait faire à mon équipe lors d''un atelier team building. Ça a lancé une belle conversation sur nos façons de communiquer.',
 NULL, 'f1000001-0000-0000-0000-000000000015', 'a1000001-0000-0000-0000-000000000006',
 NOW() - INTERVAL '38 days', NOW() - INTERVAL '38 days'),

-- ─── Commentaires sur le quiz "Ma relation est-elle saine ?" (017) ───────────

('f8000001-0000-0000-0000-000000000021',
 'Quiz courageux. Ce genre d''outil peut aider des personnes à prendre conscience de situations difficiles. Merci de l''avoir créé.',
 NULL, 'f1000001-0000-0000-0000-000000000017', 'a1000001-0000-0000-0000-000000000002',
 NOW() - INTERVAL '32 days', NOW() - INTERVAL '32 days'),

('f8000001-0000-0000-0000-000000000022',
 'J''ai hésité à le partager à une amie dont je m''inquiète pour la relation. Finalement je l''ai fait et ça a ouvert une vraie discussion entre nous.',
 NULL, 'f1000001-0000-0000-0000-000000000017', 'a1000001-0000-0000-0000-000000000004',
 NOW() - INTERVAL '30 days', NOW() - INTERVAL '30 days'),

-- ─── Commentaires sur le sondage "Difficulté relationnelle" (020) ────────────

('f8000001-0000-0000-0000-000000000023',
 'J''ai voté "gestion des conflits" mais c''est souvent lié à la communication. Les deux sont tellement imbriqués.',
 NULL, 'f1000001-0000-0000-0000-000000000020', 'a1000001-0000-0000-0000-000000000001',
 NOW() - INTERVAL '48 days', NOW() - INTERVAL '48 days'),

('f8000001-0000-0000-0000-000000000024',
 'Intéressant de voir que "exprimer ses émotions" arrive si haut. Les hommes en particulier ont souvent été peu outillés pour ça.',
 NULL, 'f1000001-0000-0000-0000-000000000020', 'a1000001-0000-0000-0000-000000000003',
 NOW() - INTERVAL '46 days', NOW() - INTERVAL '46 days'),

('f8000001-0000-0000-0000-000000000025',
 'Le manque de temps est pour moi le vrai défi. On est tellement sollicités que même avec les meilleures intentions on ne prend pas le temps d''être vraiment présents.',
 'f8000001-0000-0000-0000-000000000023', 'f1000001-0000-0000-0000-000000000020', 'a1000001-0000-0000-0000-000000000005',
 NOW() - INTERVAL '45 days', NOW() - INTERVAL '45 days'),

-- ─── Commentaires sur le sondage "Compétence à développer" (024) ─────────────

('f8000001-0000-0000-0000-000000000026',
 'J''ai voté assertivité. C''est la compétence la plus difficile à développer pour quelqu''un comme moi qui a tendance au "fawning" (apaiser à tout prix).',
 NULL, 'f1000001-0000-0000-0000-000000000024', 'a1000001-0000-0000-0000-000000000006',
 NOW() - INTERVAL '24 days', NOW() - INTERVAL '24 days'),

('f8000001-0000-0000-0000-000000000027',
 'L''écoute active pour moi, sans hésitation. On peut avoir toutes les compétences du monde, si on n''écoute pas vraiment ça ne sert à rien.',
 NULL, 'f1000001-0000-0000-0000-000000000024', 'a1000001-0000-0000-0000-000000000002',
 NOW() - INTERVAL '23 days', NOW() - INTERVAL '23 days'),

-- ─── Commentaires sur l'article Relation toxique (007) ───────────────────────

('f8000001-0000-0000-0000-000000000028',
 'Merci pour cet article. J''aurais eu besoin de le lire il y a 3 ans. Les cycles tension-réconciliation sont si bien décrits. La phase lune de miel rend tout si confus.',
 NULL, 'f1000001-0000-0000-0000-000000000007', 'a1000001-0000-0000-0000-000000000004',
 NOW() - INTERVAL '26 days', NOW() - INTERVAL '26 days'),

('f8000001-0000-0000-0000-000000000029',
 'La partie sur "l''après" est essentielle et souvent oubliée. Quitter une relation toxique est une chose, reconstruire son estime de soi en est une autre. Merci d''en parler.',
 NULL, 'f1000001-0000-0000-0000-000000000007', 'a1000001-0000-0000-0000-000000000003',
 NOW() - INTERVAL '24 days', NOW() - INTERVAL '24 days'),

-- ─── Commentaires sur l'article Bienveillance (008) ─────────────────────────

('f8000001-0000-0000-0000-000000000030',
 'J''ai commencé le défi hier. Déjà la semaine 1 sur la bienveillance envers soi-même est un vrai défi pour moi. Je réalise à quel point je me malmène souvent.',
 NULL, 'f1000001-0000-0000-0000-000000000008', 'a1000001-0000-0000-0000-000000000005',
 NOW() - INTERVAL '21 days', NOW() - INTERVAL '21 days');

COMMIT;
