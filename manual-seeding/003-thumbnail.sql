-- =============================================================================
-- 003-thumbnail.sql
-- Entrée media partagée utilisée comme miniature pour toutes les ressources.
-- =============================================================================

BEGIN;

INSERT INTO ressources_medias (id, media_url, mime_type, creation_time, update_time) VALUES
('d1000001-0000-0000-0000-000000000001',
 'https://07db11ec23c7129d0b8acc1ddd5bfc4c.r2.cloudflarestorage.com/ressources/medias/5156fa06-d10f-42f7-9a9a-f568bc949497.jpeg',
 'image/jpeg',
 NOW() - INTERVAL '60 days',
 NOW() - INTERVAL '60 days');

COMMIT;
