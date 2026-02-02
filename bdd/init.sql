-- ----------------------------------------------------------
-- Script POSTGRESQL pour mcd 
-- ----------------------------------------------------------


-- ----------------------------
-- Table: ressource_types
-- ----------------------------
CREATE TABLE ressource_types (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  label VARCHAR(50) NOT NULL,
  CONSTRAINT ressource_types_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: reports_types
-- ----------------------------
CREATE TABLE reports_types (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  label VARCHAR(50) NOT NULL,
  CONSTRAINT reports_types_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: regions
-- ----------------------------
CREATE TABLE regions (
  id INTEGER NOT NULL,
  code VARCHAR(3) NOT NULL,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL,
  CONSTRAINT regions_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: users_roles
-- ----------------------------
CREATE TABLE users_roles (
  id UUID NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  creation_time TIMESTAMPTZ NOT NULL,
  role_label VARCHAR(50) NOT NULL,
  CONSTRAINT users_roles_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: ressources_confidentiality_types
-- ----------------------------
CREATE TABLE ressources_confidentiality_types (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  label VARCHAR(50) NOT NULL,
  CONSTRAINT ressources_confidentiality_types_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: departments
-- ----------------------------
CREATE TABLE departments (
  id INTEGER NOT NULL,
  region_code VARCHAR(3) NOT NULL,
  code VARCHAR(3) NOT NULL,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL,
  CONSTRAINT departments_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: cities
-- ----------------------------
CREATE TABLE cities (
  id INTEGER NOT NULL,
  department_code VARCHAR(3) NOT NULL,
  insee_code VARCHAR(5),
  zip_code VARCHAR(5),
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL,
  gps_lat REAL NOT NULL,
  gps_lng REAL NOT NULL,
  CONSTRAINT cities_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: email_logs
-- ----------------------------
CREATE TABLE email_logs (
  id UUID NOT NULL,
  sent_time TIMESTAMPTZ NOT NULL,
  content TEXT NOT NULL,
  sender_email VARCHAR(100) NOT NULL,
  receiver_email VARCHAR(100) NOT NULL,
  operation_type VARCHAR(255) NOT NULL,
  CONSTRAINT email_logs_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: backoffice_log_levels
-- ----------------------------
CREATE TABLE backoffice_log_levels (
  id UUID NOT NULL,
  label VARCHAR(50) NOT NULL,
  CONSTRAINT backoffice_log_levels_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: tags
-- ----------------------------
CREATE TABLE tags (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  label VARCHAR(50) NOT NULL,
  CONSTRAINT tags_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: backoffice_operation_types
-- ----------------------------
CREATE TABLE backoffice_operation_types (
  id UUID NOT NULL,
  label VARCHAR(50) NOT NULL,
  CONSTRAINT backoffice_operation_types_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: ressources_status
-- ----------------------------
CREATE TABLE ressources_status (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  label VARCHAR(50) NOT NULL,
  CONSTRAINT ressources_status_PK PRIMARY KEY (id)
);


-- ----------------------------
-- Table: backoffice_logs
-- ----------------------------
CREATE TABLE backoffice_logs (
  id UUID NOT NULL,
  event_time TIMESTAMPTZ NOT NULL,
  log_content TEXT NOT NULL,
  backoffice_log_level_id UUID NOT NULL,
  backoffice_operation_type_id UUID NOT NULL,
  CONSTRAINT backoffice_logs_PK PRIMARY KEY (id),
  CONSTRAINT backoffice_logs_backoffice_log_level_id_FK FOREIGN KEY (backoffice_log_level_id) REFERENCES backoffice_log_levels (id),
  CONSTRAINT backoffice_logs_backoffice_operation_type_id_FK FOREIGN KEY (backoffice_operation_type_id) REFERENCES backoffice_operation_types (id)
);


-- ----------------------------
-- Table: users
-- ----------------------------
CREATE TABLE users (
  id UUID NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  activation_code UUID,
  is_active BOOLEAN NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  user_role_id UUID NOT NULL,
  CONSTRAINT users_PK PRIMARY KEY (id),
  CONSTRAINT users_user_role_id_FK FOREIGN KEY (user_role_id) REFERENCES users_roles (id)
);


-- ----------------------------
-- Table: addresses
-- ----------------------------
CREATE TABLE addresses (
  id UUID NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  creation_time TIMESTAMPTZ NOT NULL,
  region_id INTEGER NOT NULL,
  department_id INTEGER NOT NULL,
  city_id INTEGER NOT NULL,
  user_id UUID NOT NULL,
  CONSTRAINT addresses_PK PRIMARY KEY (id),
  CONSTRAINT addresses_region_id_FK FOREIGN KEY (region_id) REFERENCES regions (id),
  CONSTRAINT addresses_department_id_FK FOREIGN KEY (department_id) REFERENCES departments (id),
  CONSTRAINT addresses_city_id_FK FOREIGN KEY (city_id) REFERENCES cities (id),
  CONSTRAINT addresses_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: refresh_tokens
-- ----------------------------
CREATE TABLE refresh_tokens (
  id UUID NOT NULL,
  refresh_token TEXT NOT NULL,
  is_active BOOLEAN NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  user_id UUID NOT NULL,
  CONSTRAINT refresh_tokens_PK PRIMARY KEY (id),
  CONSTRAINT refresh_tokens_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: ressources
-- ----------------------------
CREATE TABLE ressources (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  view_count BIGINT NOT NULL,
  thumbnail_url TEXT NOT NULL,
  ressource_confidentiality_type_id UUID NOT NULL,
  ressource_status_id UUID NOT NULL,
  user_id UUID NOT NULL,
  ressource_type_id UUID NOT NULL,
  CONSTRAINT ressources_PK PRIMARY KEY (id),
  CONSTRAINT ressources_ressource_confidentiality_type_id_FK FOREIGN KEY (ressource_confidentiality_type_id) REFERENCES ressources_confidentiality_types (id),
  CONSTRAINT ressources_ressource_status_id_FK FOREIGN KEY (ressource_status_id) REFERENCES ressources_status (id),
  CONSTRAINT ressources_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT ressources_ressource_type_id_FK FOREIGN KEY (ressource_type_id) REFERENCES ressource_types (id)
);


-- ----------------------------
-- Table: profiles_pictures
-- ----------------------------
CREATE TABLE profiles_pictures (
  id UUID NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  creation_time TIMESTAMPTZ NOT NULL,
  image_url TEXT NOT NULL,
  user_id UUID NOT NULL,
  CONSTRAINT profiles_pictures_PK PRIMARY KEY (id),
  CONSTRAINT profiles_pictures_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: friends_requests
-- ----------------------------
CREATE TABLE friends_requests (
  user_sender_id UUID NOT NULL,
  user_receiver_id UUID NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  creation_time TIMESTAMPTZ NOT NULL,
  request_status VARCHAR(255) NOT NULL CHECK (request_status IN ('Pending', 'Cancelled', 'Declined', 'Accepted')),
  CONSTRAINT friends_requests_PK PRIMARY KEY (user_sender_id, user_receiver_id),
  CONSTRAINT friends_requests_user_sender_id_FK FOREIGN KEY (user_sender_id) REFERENCES users (id),
  CONSTRAINT friends_requests_user_receiver_id_FK FOREIGN KEY (user_receiver_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: passwords_infos
-- ----------------------------
CREATE TABLE passwords_infos (
  id UUID NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  creation_time TIMESTAMPTZ NOT NULL,
  attempt_count INTEGER NOT NULL,
  reset_token UUID,
  reset_date TIMESTAMPTZ,
  user_id UUID NOT NULL,
  CONSTRAINT passwords_infos_PK PRIMARY KEY (id),
  CONSTRAINT passwords_infos_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: logins
-- ----------------------------
CREATE TABLE logins (
  id UUID NOT NULL,
  email VARCHAR(100) NOT NULL,
  password_hash TEXT NOT NULL,
  password_salt TEXT NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  user_id UUID NOT NULL,
  CONSTRAINT logins_PK PRIMARY KEY (id),
  CONSTRAINT logins_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: notifications
-- ----------------------------
CREATE TABLE notifications (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  marked_as_read BOOLEAN NOT NULL,
  content TEXT NOT NULL,
  user_id UUID NOT NULL,
  CONSTRAINT notifications_PK PRIMARY KEY (id),
  CONSTRAINT notifications_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: passwords_history
-- ----------------------------
CREATE TABLE passwords_history (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  password_hash TEXT NOT NULL,
  password_salt TEXT NOT NULL,
  password_infos_id UUID NOT NULL,
  CONSTRAINT passwords_history_PK PRIMARY KEY (id),
  CONSTRAINT passwords_history_password_infos_id_FK FOREIGN KEY (password_infos_id) REFERENCES passwords_infos (id)
);


-- ----------------------------
-- Table: reports
-- ----------------------------
CREATE TABLE reports (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  is_checked_by_moderator BOOLEAN NOT NULL,
  report_type_id UUID NOT NULL,
  user_id UUID NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT reports_PK PRIMARY KEY (id),
  CONSTRAINT reports_report_type_id_FK FOREIGN KEY (report_type_id) REFERENCES reports_types (id),
  CONSTRAINT reports_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT reports_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: polls
-- ----------------------------
CREATE TABLE polls (
  id UUID NOT NULL,
  vote_count BIGINT NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT polls_PK PRIMARY KEY (id),
  CONSTRAINT polls_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: ressource_favorite
-- ----------------------------
CREATE TABLE ressource_favorite (
  user_id UUID NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT ressource_favorite_PK PRIMARY KEY (user_id, ressource_id),
  CONSTRAINT ressource_favorite_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT ressource_favorite_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: ressource_progression
-- ----------------------------
CREATE TABLE ressource_progression (
  ressource_id UUID NOT NULL,
  user_id UUID NOT NULL,
  is_aside BOOLEAN NOT NULL,
  is_exploited BOOLEAN NOT NULL,
  CONSTRAINT ressource_progression_PK PRIMARY KEY (ressource_id, user_id),
  CONSTRAINT ressource_progression_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id),
  CONSTRAINT ressource_progression_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ----------------------------
-- Table: events
-- ----------------------------
CREATE TABLE events (
  id UUID NOT NULL,
  is_virtual BOOLEAN NOT NULL,
  date_start TIMESTAMPTZ NOT NULL,
  date_end TIMESTAMPTZ NOT NULL,
  event_link TEXT,
  location VARCHAR(255) NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT events_PK PRIMARY KEY (id),
  CONSTRAINT events_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: ressources_medias
-- ----------------------------
CREATE TABLE ressources_medias (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  media_url TEXT NOT NULL,
  mime_type VARCHAR(50) NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT ressources_medias_PK PRIMARY KEY (id),
  CONSTRAINT ressources_medias_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: sessions
-- ----------------------------
CREATE TABLE sessions (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  id_ws TEXT NOT NULL,
  status VARCHAR(255) NOT NULL CHECK (status IN ('open', 'closed')),
  ressource_id UUID NOT NULL,
  CONSTRAINT sessions_PK PRIMARY KEY (id),
  CONSTRAINT sessions_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: ressource_tag
-- ----------------------------
CREATE TABLE ressource_tag (
  tag_id UUID NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT ressource_tag_PK PRIMARY KEY (tag_id, ressource_id),
  CONSTRAINT ressource_tag_tag_id_FK FOREIGN KEY (tag_id) REFERENCES tags (id),
  CONSTRAINT ressource_tag_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: ressource_like
-- ----------------------------
CREATE TABLE ressource_like (
  user_id UUID NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT ressource_like_PK PRIMARY KEY (user_id, ressource_id),
  CONSTRAINT ressource_like_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT ressource_like_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: quizzes
-- ----------------------------
CREATE TABLE quizzes (
  id UUID NOT NULL,
  participation_count BIGINT NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT quizzes_PK PRIMARY KEY (id),
  CONSTRAINT quizzes_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: articles
-- ----------------------------
CREATE TABLE articles (
  id UUID NOT NULL,
  content TEXT NOT NULL,
  ressource_id UUID NOT NULL,
  CONSTRAINT articles_PK PRIMARY KEY (id),
  CONSTRAINT articles_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id)
);


-- ----------------------------
-- Table: sessions_messages
-- ----------------------------
CREATE TABLE sessions_messages (
  id UUID NOT NULL,
  sent_time TIMESTAMPTZ NOT NULL,
  content VARCHAR(255) NOT NULL,
  user_id UUID NOT NULL,
  session_id UUID NOT NULL,
  CONSTRAINT sessions_messages_PK PRIMARY KEY (id),
  CONSTRAINT sessions_messages_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT sessions_messages_session_id_FK FOREIGN KEY (session_id) REFERENCES sessions (id)
);


-- ----------------------------
-- Table: event_member
-- ----------------------------
CREATE TABLE event_member (
  user_id UUID NOT NULL,
  event_id UUID NOT NULL,
  CONSTRAINT event_member_PK PRIMARY KEY (user_id, event_id),
  CONSTRAINT event_member_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT event_member_event_id_FK FOREIGN KEY (event_id) REFERENCES events (id)
);


-- ----------------------------
-- Table: polls_options
-- ----------------------------
CREATE TABLE polls_options (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  option VARCHAR(255) NOT NULL,
  poll_id UUID NOT NULL,
  CONSTRAINT polls_options_PK PRIMARY KEY (id),
  CONSTRAINT polls_options_poll_id_FK FOREIGN KEY (poll_id) REFERENCES polls (id)
);


-- ----------------------------
-- Table: quizzes_questions
-- ----------------------------
CREATE TABLE quizzes_questions (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  question VARCHAR(255) NOT NULL,
  possible_answers JSONB NOT NULL,
  correct_answer VARCHAR(255) NOT NULL,
  quizz_id UUID NOT NULL,
  CONSTRAINT quizzes_questions_PK PRIMARY KEY (id),
  CONSTRAINT quizzes_questions_quizz_id_FK FOREIGN KEY (quizz_id) REFERENCES quizzes (id)
);


-- ----------------------------
-- Table: poll_vote
-- ----------------------------
CREATE TABLE poll_vote (
  user_id UUID NOT NULL,
  poll_option_id UUID NOT NULL,
  CONSTRAINT poll_vote_PK PRIMARY KEY (user_id, poll_option_id),
  CONSTRAINT poll_vote_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT poll_vote_poll_option_id_FK FOREIGN KEY (poll_option_id) REFERENCES polls_options (id)
);


-- ----------------------------
-- Table: question_answer
-- ----------------------------
CREATE TABLE question_answer (
  answer VARCHAR(1) NOT NULL,
  user_id UUID NOT NULL,
  quizz_question_id UUID NOT NULL,
  CONSTRAINT question_answer_PK PRIMARY KEY (user_id, quizz_question_id),
  CONSTRAINT question_answer_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT question_answer_quizz_question_id_FK FOREIGN KEY (quizz_question_id) REFERENCES quizzes_questions (id)
);


-- ----------------------------
-- Table: comments
-- ----------------------------
CREATE TABLE comments (
  id UUID NOT NULL,
  creation_time TIMESTAMPTZ NOT NULL,
  update_time TIMESTAMPTZ,
  deletion_time TIMESTAMPTZ,
  content VARCHAR(255) NOT NULL,
  comment_id UUID,
  ressource_id UUID NOT NULL,
  user_id UUID NOT NULL,
  CONSTRAINT comments_PK PRIMARY KEY (id),
  CONSTRAINT comments_comment_id_FK FOREIGN KEY (comment_id) REFERENCES comments (id),
  CONSTRAINT comments_ressource_id_FK FOREIGN KEY (ressource_id) REFERENCES ressources (id),
  CONSTRAINT comments_user_id_FK FOREIGN KEY (user_id) REFERENCES users (id)
);


-- ===== INDEX =====
CREATE INDEX region_code_IDX ON departments (region_code);
CREATE INDEX code_IDX ON departments (code);
CREATE INDEX email_IDX ON logins (email);
CREATE INDEX token_hash_IDX ON refresh_tokens (refresh_token);
