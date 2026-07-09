-- =============================================================================
-- 002-tags.sql
-- Tags thématiques pour la démonstration.
-- =============================================================================

BEGIN;

INSERT INTO tags (id, label, creation_time, update_time) VALUES
('e1000001-0000-0000-0000-000000000001', 'Communication',          NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days'),
('e1000001-0000-0000-0000-000000000002', 'Gestion du stress',      NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days'),
('e1000001-0000-0000-0000-000000000003', 'Couple',                 NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days'),
('e1000001-0000-0000-0000-000000000004', 'Famille',                NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days'),
('e1000001-0000-0000-0000-000000000005', 'Développement personnel', NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days'),
('e1000001-0000-0000-0000-000000000006', 'Médiation',              NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days'),
('e1000001-0000-0000-0000-000000000007', 'Empathie',               NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days'),
('e1000001-0000-0000-0000-000000000008', 'Bien-être',              NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days');

COMMIT;
