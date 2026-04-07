-- =============================================================================
-- 001-users.sql
-- Utilisateurs de démonstration avec GUIDs fixes.
-- Le hash du mot de passe est copié depuis le compte default_user :
-- ce script doit donc être joué APRÈS que l'API ait démarré une première fois.
-- =============================================================================

BEGIN;

INSERT INTO users (id, first_name, last_name, user_name, activation_code, is_active, creation_time, update_time, user_role_id) VALUES
('a1000001-0000-0000-0000-000000000001', 'Sophie',   'Martin',   'sophie.martin',    gen_random_uuid(), true, NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days', (SELECT id FROM users_roles WHERE role_label = 'Utilisateur')),
('a1000001-0000-0000-0000-000000000002', 'Thomas',   'Dubois',   'thomas.dubois',    gen_random_uuid(), true, NOW() - INTERVAL '55 days', NOW() - INTERVAL '55 days', (SELECT id FROM users_roles WHERE role_label = 'Utilisateur')),
('a1000001-0000-0000-0000-000000000003', 'Camille',  'Bernard',  'camille.bernard',  gen_random_uuid(), true, NOW() - INTERVAL '50 days', NOW() - INTERVAL '50 days', (SELECT id FROM users_roles WHERE role_label = 'Utilisateur')),
('a1000001-0000-0000-0000-000000000004', 'Lucas',    'Moreau',   'lucas.moreau',     gen_random_uuid(), true, NOW() - INTERVAL '45 days', NOW() - INTERVAL '45 days', (SELECT id FROM users_roles WHERE role_label = 'Utilisateur')),
('a1000001-0000-0000-0000-000000000005', 'Emma',     'Petit',    'emma.petit',       gen_random_uuid(), true, NOW() - INTERVAL '40 days', NOW() - INTERVAL '40 days', (SELECT id FROM users_roles WHERE role_label = 'Utilisateur')),
('a1000001-0000-0000-0000-000000000006', 'Antoine',  'Rousseau', 'antoine.rousseau', gen_random_uuid(), true, NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days', (SELECT id FROM users_roles WHERE role_label = 'Utilisateur'));

INSERT INTO logins (id, email, password_hash, creation_time, update_time, user_id) VALUES
('b1000001-0000-0000-0000-000000000001', 'sophie.martin@exemple.fr',    (SELECT password_hash FROM logins WHERE user_id = (SELECT id FROM users WHERE user_name = 'default_user') LIMIT 1), NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days', 'a1000001-0000-0000-0000-000000000001'),
('b1000001-0000-0000-0000-000000000002', 'thomas.dubois@exemple.fr',    (SELECT password_hash FROM logins WHERE user_id = (SELECT id FROM users WHERE user_name = 'default_user') LIMIT 1), NOW() - INTERVAL '55 days', NOW() - INTERVAL '55 days', 'a1000001-0000-0000-0000-000000000002'),
('b1000001-0000-0000-0000-000000000003', 'camille.bernard@exemple.fr',  (SELECT password_hash FROM logins WHERE user_id = (SELECT id FROM users WHERE user_name = 'default_user') LIMIT 1), NOW() - INTERVAL '50 days', NOW() - INTERVAL '50 days', 'a1000001-0000-0000-0000-000000000003'),
('b1000001-0000-0000-0000-000000000004', 'lucas.moreau@exemple.fr',     (SELECT password_hash FROM logins WHERE user_id = (SELECT id FROM users WHERE user_name = 'default_user') LIMIT 1), NOW() - INTERVAL '45 days', NOW() - INTERVAL '45 days', 'a1000001-0000-0000-0000-000000000004'),
('b1000001-0000-0000-0000-000000000005', 'emma.petit@exemple.fr',       (SELECT password_hash FROM logins WHERE user_id = (SELECT id FROM users WHERE user_name = 'default_user') LIMIT 1), NOW() - INTERVAL '40 days', NOW() - INTERVAL '40 days', 'a1000001-0000-0000-0000-000000000005'),
('b1000001-0000-0000-0000-000000000006', 'antoine.rousseau@exemple.fr', (SELECT password_hash FROM logins WHERE user_id = (SELECT id FROM users WHERE user_name = 'default_user') LIMIT 1), NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days', 'a1000001-0000-0000-0000-000000000006');

INSERT INTO passwords_infos (id, creation_time, update_time, attempt_count, user_id) VALUES
('c1000001-0000-0000-0000-000000000001', NOW() - INTERVAL '60 days', NOW() - INTERVAL '60 days', 0, 'a1000001-0000-0000-0000-000000000001'),
('c1000001-0000-0000-0000-000000000002', NOW() - INTERVAL '55 days', NOW() - INTERVAL '55 days', 0, 'a1000001-0000-0000-0000-000000000002'),
('c1000001-0000-0000-0000-000000000003', NOW() - INTERVAL '50 days', NOW() - INTERVAL '50 days', 0, 'a1000001-0000-0000-0000-000000000003'),
('c1000001-0000-0000-0000-000000000004', NOW() - INTERVAL '45 days', NOW() - INTERVAL '45 days', 0, 'a1000001-0000-0000-0000-000000000004'),
('c1000001-0000-0000-0000-000000000005', NOW() - INTERVAL '40 days', NOW() - INTERVAL '40 days', 0, 'a1000001-0000-0000-0000-000000000005'),
('c1000001-0000-0000-0000-000000000006', NOW() - INTERVAL '35 days', NOW() - INTERVAL '35 days', 0, 'a1000001-0000-0000-0000-000000000006');

COMMIT;
