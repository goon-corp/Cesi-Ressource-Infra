-- =============================================================================
-- hard-flush.sql
-- Remet la base à son état post-migrations initial.
-- Conserve uniquement les comptes default_user et default_administrator
-- (avec leurs logins, passwords_infos et refresh_tokens).
-- Toutes les tables de ressources, commentaires, signalements, sessions,
-- logs, notifications, amis, adresses et utilisateurs tiers sont vidées.
-- =============================================================================

BEGIN;

-- ─── Votes et réponses ────────────────────────────────────────────────────────
TRUNCATE TABLE poll_vote       RESTART IDENTITY CASCADE;
TRUNCATE TABLE question_answer RESTART IDENTITY CASCADE;

-- ─── Membres événements ───────────────────────────────────────────────────────
TRUNCATE TABLE event_member RESTART IDENTITY CASCADE;

-- ─── Interactions ressources ──────────────────────────────────────────────────
TRUNCATE TABLE ressource_like        RESTART IDENTITY CASCADE;
TRUNCATE TABLE ressource_favorite    RESTART IDENTITY CASCADE;
TRUNCATE TABLE ressource_progression RESTART IDENTITY CASCADE;
TRUNCATE TABLE ressource_tag         RESTART IDENTITY CASCADE;

-- ─── Sessions de chat ─────────────────────────────────────────────────────────
TRUNCATE TABLE sessions_messages RESTART IDENTITY CASCADE;
TRUNCATE TABLE sessions          RESTART IDENTITY CASCADE;

-- ─── Signalements ─────────────────────────────────────────────────────────────
TRUNCATE TABLE reports RESTART IDENTITY CASCADE;

-- ─── Commentaires (auto-référents : une seule passe suffit avec CASCADE) ──────
TRUNCATE TABLE comments RESTART IDENTITY CASCADE;

-- ─── Contenu des ressources ───────────────────────────────────────────────────
TRUNCATE TABLE polls_options     RESTART IDENTITY CASCADE;
TRUNCATE TABLE quizzes_questions RESTART IDENTITY CASCADE;
TRUNCATE TABLE polls             RESTART IDENTITY CASCADE;
TRUNCATE TABLE quizzes           RESTART IDENTITY CASCADE;
TRUNCATE TABLE articles          RESTART IDENTITY CASCADE;
TRUNCATE TABLE events            RESTART IDENTITY CASCADE;

-- ─── Ressources et médias ─────────────────────────────────────────────────────
TRUNCATE TABLE ressources        RESTART IDENTITY CASCADE;
TRUNCATE TABLE ressources_medias RESTART IDENTITY CASCADE;

-- ─── Tags ─────────────────────────────────────────────────────────────────────
TRUNCATE TABLE tags RESTART IDENTITY CASCADE;

-- ─── Logs backoffice et emails ────────────────────────────────────────────────
TRUNCATE TABLE backoffice_logs RESTART IDENTITY CASCADE;
TRUNCATE TABLE email_logs      RESTART IDENTITY CASCADE;

-- ─── Données sociales utilisateurs ───────────────────────────────────────────
TRUNCATE TABLE friends_requests   RESTART IDENTITY CASCADE;
TRUNCATE TABLE notifications      RESTART IDENTITY CASCADE;
TRUNCATE TABLE addresses          RESTART IDENTITY CASCADE;
TRUNCATE TABLE profiles_pictures  RESTART IDENTITY CASCADE;

-- ─── Suppression des utilisateurs tiers ──────────────────────────────────────
-- On supprime d'abord les tokens, logins et infos de mot de passe
-- des comptes qui ne sont PAS default_user / default_administrator,
-- puis les comptes eux-mêmes.

DELETE FROM refresh_tokens
WHERE user_id NOT IN (
  SELECT id FROM users WHERE user_name IN ('default_user', 'default_administrator')
);

DELETE FROM passwords_history
WHERE password_infos_id IN (
  SELECT id FROM passwords_infos
  WHERE user_id NOT IN (
    SELECT id FROM users WHERE user_name IN ('default_user', 'default_administrator')
  )
);

DELETE FROM passwords_infos
WHERE user_id NOT IN (
  SELECT id FROM users WHERE user_name IN ('default_user', 'default_administrator')
);

DELETE FROM logins
WHERE user_id NOT IN (
  SELECT id FROM users WHERE user_name IN ('default_user', 'default_administrator')
);

DELETE FROM users
WHERE user_name NOT IN ('default_user', 'default_administrator');

COMMIT;
