-- =============================================================================
-- flush.sql
-- Supprime toutes les données créées par le seeding manuel.
-- Respecte l'ordre des dépendances (FK) pour éviter les erreurs de contrainte.
-- =============================================================================

BEGIN;

-- GUIDs fixes des ressources de démo
CREATE TEMP TABLE _seed_ressource_ids (id UUID) ON COMMIT DROP;
INSERT INTO _seed_ressource_ids VALUES
('f1000001-0000-0000-0000-000000000001'),
('f1000001-0000-0000-0000-000000000002'),
('f1000001-0000-0000-0000-000000000003'),
('f1000001-0000-0000-0000-000000000004'),
('f1000001-0000-0000-0000-000000000005'),
('f1000001-0000-0000-0000-000000000006'),
('f1000001-0000-0000-0000-000000000007'),
('f1000001-0000-0000-0000-000000000008'),
('f1000001-0000-0000-0000-000000000009'),
('f1000001-0000-0000-0000-000000000010'),
('f1000001-0000-0000-0000-000000000011'),
('f1000001-0000-0000-0000-000000000012'),
('f1000001-0000-0000-0000-000000000013'),
('f1000001-0000-0000-0000-000000000014'),
('f1000001-0000-0000-0000-000000000015'),
('f1000001-0000-0000-0000-000000000016'),
('f1000001-0000-0000-0000-000000000017'),
('f1000001-0000-0000-0000-000000000018'),
('f1000001-0000-0000-0000-000000000019'),
('f1000001-0000-0000-0000-000000000020'),
('f1000001-0000-0000-0000-000000000021'),
('f1000001-0000-0000-0000-000000000022'),
('f1000001-0000-0000-0000-000000000023'),
('f1000001-0000-0000-0000-000000000024');

-- GUIDs fixes des utilisateurs de démo
CREATE TEMP TABLE _seed_user_ids (id UUID) ON COMMIT DROP;
INSERT INTO _seed_user_ids VALUES
('a1000001-0000-0000-0000-000000000001'),
('a1000001-0000-0000-0000-000000000002'),
('a1000001-0000-0000-0000-000000000003'),
('a1000001-0000-0000-0000-000000000004'),
('a1000001-0000-0000-0000-000000000005'),
('a1000001-0000-0000-0000-000000000006');

-- ─── Votes sur les sondages ───────────────────────────────────────────────────
DELETE FROM poll_vote
WHERE poll_option_id IN (
  SELECT po.id FROM polls_options po
  JOIN polls p ON po.poll_id = p.id
  WHERE p.ressource_id IN (SELECT id FROM _seed_ressource_ids)
);

-- ─── Réponses aux questions de quiz ──────────────────────────────────────────
DELETE FROM question_answer
WHERE quizz_question_id IN (
  SELECT qq.id FROM quizzes_questions qq
  JOIN quizzes q ON qq.quizz_id = q.id
  WHERE q.ressource_id IN (SELECT id FROM _seed_ressource_ids)
);

-- ─── Membres des événements ───────────────────────────────────────────────────
DELETE FROM event_member
WHERE event_id IN (
  SELECT e.id FROM events e
  WHERE e.ressource_id IN (SELECT id FROM _seed_ressource_ids)
);

-- ─── Interactions (likes, favoris, progressions, tags) ────────────────────────
DELETE FROM ressource_like        WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids);
DELETE FROM ressource_favorite    WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids);
DELETE FROM ressource_progression WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids);
DELETE FROM ressource_tag         WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids);

-- ─── Commentaires ─────────────────────────────────────────────────────────────
-- Sous-commentaires d'abord (contrainte auto-référente)
DELETE FROM comments
WHERE comment_id IN (
  SELECT id FROM comments WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids)
);
DELETE FROM comments WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids);

-- ─── Options de sondage et questions de quiz ─────────────────────────────────
DELETE FROM polls_options
WHERE poll_id IN (
  SELECT id FROM polls WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids)
);
DELETE FROM quizzes_questions
WHERE quizz_id IN (
  SELECT id FROM quizzes WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids)
);

-- ─── Tables enfants sans cascade depuis ressources ────────────────────────────
DELETE FROM quizzes WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids);
DELETE FROM polls   WHERE ressource_id IN (SELECT id FROM _seed_ressource_ids);

-- ─── Ressources (cascade sur articles et events) ─────────────────────────────
DELETE FROM ressources WHERE id IN (SELECT id FROM _seed_ressource_ids);

-- ─── Miniature partagée ───────────────────────────────────────────────────────
DELETE FROM ressources_medias WHERE id = 'd1000001-0000-0000-0000-000000000001';

-- ─── Tags ─────────────────────────────────────────────────────────────────────
DELETE FROM tags WHERE id IN (
  'e1000001-0000-0000-0000-000000000001',
  'e1000001-0000-0000-0000-000000000002',
  'e1000001-0000-0000-0000-000000000003',
  'e1000001-0000-0000-0000-000000000004',
  'e1000001-0000-0000-0000-000000000005',
  'e1000001-0000-0000-0000-000000000006',
  'e1000001-0000-0000-0000-000000000007',
  'e1000001-0000-0000-0000-000000000008'
);

-- ─── Données utilisateurs ─────────────────────────────────────────────────────
DELETE FROM logins          WHERE user_id IN (SELECT id FROM _seed_user_ids);
DELETE FROM passwords_infos WHERE user_id IN (SELECT id FROM _seed_user_ids);
DELETE FROM users           WHERE id      IN (SELECT id FROM _seed_user_ids);

COMMIT;
