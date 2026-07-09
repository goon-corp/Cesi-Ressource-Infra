-- =============================================================================
-- 004-articles.sql
-- 8 articles de démonstration sur les relations interpersonnelles.
-- Ressources IDs : f1000001-...-001 à 008
-- Articles IDs   : f2000001-...-001 à 008
-- =============================================================================

BEGIN;

-- ─── Ressources parentes ─────────────────────────────────────────────────────

INSERT INTO ressources (id, title, description, view_count, thumbnail_id, ressource_confidentiality_type_id, ressource_status_id, user_id, ressource_type_id, creation_time, update_time) VALUES

('f1000001-0000-0000-0000-000000000001',
 'Les 5 clés de la Communication Non Violente',
 'Découvrez la méthode CNV de Marshall Rosenberg pour transformer vos échanges et créer des relations authentiques basées sur l''empathie et le respect mutuel.',
 342,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '55 days', NOW() - INTERVAL '55 days'),

('f1000001-0000-0000-0000-000000000002',
 'Gérer les conflits de couple : guide pratique',
 'Le conflit est inévitable dans toute relation durable. Apprenez à en faire un levier de croissance plutôt qu''une source de souffrance grâce à des outils concrets.',
 278,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000002',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '50 days', NOW() - INTERVAL '50 days'),

('f1000001-0000-0000-0000-000000000003',
 'L''écoute active : technique et pratique au quotidien',
 'L''écoute active est bien plus que se taire pendant que l''autre parle. C''est une posture complète qui transforme profondément la qualité de vos relations.',
 195,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000003',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '47 days', NOW() - INTERVAL '47 days'),

('f1000001-0000-0000-0000-000000000004',
 'Décoder les besoins émotionnels de votre enfant',
 'Comprendre ce que vit réellement votre enfant derrière ses comportements difficiles est la première étape vers une parentalité bienveillante et efficace.',
 214,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000005',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '44 days', NOW() - INTERVAL '44 days'),

('f1000001-0000-0000-0000-000000000005',
 'Développer son intelligence émotionnelle en 7 étapes',
 'L''intelligence émotionnelle (IE) est aujourd''hui reconnue comme un facteur clé de réussite personnelle et professionnelle. Voici comment la cultiver concrètement.',
 389,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000004',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '40 days', NOW() - INTERVAL '40 days'),

('f1000001-0000-0000-0000-000000000006',
 'La médiation familiale : quand y recourir et comment ça marche',
 'La médiation familiale offre un cadre structuré pour résoudre les conflits de façon apaisée. Découvrez son fonctionnement, ses avantages et les situations où elle s''impose.',
 167,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Interne Citoyen'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000006',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '36 days', NOW() - INTERVAL '36 days'),

('f1000001-0000-0000-0000-000000000007',
 'Identifier et sortir d''une relation toxique',
 'Les relations toxiques ne sont pas toujours évidentes à repérer. Cet article vous donne les signaux d''alerte, les mécanismes en jeu et les étapes pour s''en libérer.',
 451,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '30 days', NOW() - INTERVAL '30 days'),

('f1000001-0000-0000-0000-000000000008',
 '30 jours de bienveillance : défi quotidien pour transformer vos relations',
 'Et si chaque jour pendant un mois vous posiez un geste intentionnel de bienveillance ? Découvrez ce programme progressif pour révolutionner votre rapport aux autres.',
 223,
 'd1000001-0000-0000-0000-000000000001',
 (SELECT id FROM ressources_confidentiality_types WHERE label = 'Public'),
 (SELECT id FROM ressources_status WHERE label = 'Validé'),
 'a1000001-0000-0000-0000-000000000002',
 (SELECT id FROM ressource_types WHERE label = 'Article'),
 NOW() - INTERVAL '25 days', NOW() - INTERVAL '25 days');

-- ─── Articles enfants ─────────────────────────────────────────────────────────

INSERT INTO articles (id, content, ressource_id) VALUES

('f2000001-0000-0000-0000-000000000001',
'La Communication Non Violente (CNV), développée par Marshall Rosenberg dans les années 1960, repose sur une conviction simple mais profonde : nos actes, même les plus destructeurs, sont des tentatives maladroites de satisfaire des besoins fondamentaux. Comprendre cela change tout.

La première clé est l''OBSERVATION sans jugement. Plutôt que de dire "Tu es toujours en retard", on décrit les faits : "Ce soir, tu es arrivé à 21h alors que nous avions prévu 19h". Cette distinction semble anodine ; elle est en réalité révolutionnaire car elle retire le sentiment d''attaque.

La deuxième clé est l''expression des ÉMOTIONS authentiques. La CNV distingue les émotions réelles (peur, tristesse, joie, colère) des pseudo-émotions qui masquent un jugement ("Je me sens ignoré" sous-entend que l''autre vous ignore intentionnellement). Nommer ce que vous ressentez vraiment ouvre un espace de vulnérabilité qui invite à la connexion.

La troisième clé est l''identification des BESOINS. Derrière chaque émotion se cache un besoin satisfait ou non. La colère signale souvent un besoin de respect ou de justice bafoué. La tristesse révèle un besoin de connexion ou de compréhension. Prendre conscience de ses propres besoins, c''est déjà avancer vers leur satisfaction.

La quatrième clé est la DEMANDE claire et réaliste. Une vraie demande est différente d''une exigence : elle accepte un "non". Elle est concrète, réalisable maintenant, et formulée positivement. "Serais-tu disponible pour qu''on se parle 20 minutes ce soir ?" vaut mieux que "Tu ne m''écoutes jamais."

La cinquième clé, souvent oubliée, est l''EMPATHIE envers l''autre. La CNV n''est pas qu''un outil d''expression de soi ; c''est aussi une façon de recevoir ce que l''autre exprime, même maladroitement, en cherchant les besoins derrière ses mots. Quand quelqu''un crie, il souffre. Entendre la souffrance avant d''entendre l''attaque est un acte de courage et d''amour.',
'f1000001-0000-0000-0000-000000000001'),

('f2000001-0000-0000-0000-000000000002',
'Dans toute relation de couple durable, les conflits sont inévitables. Ce n''est pas leur absence qui caractérise les couples heureux, mais la manière dont ils les traversent. Les recherches du Dr John Gottman, qui a étudié des milliers de couples pendant 40 ans, montrent que la façon de gérer les désaccords prédit la solidité d''une relation avec une précision remarquable.

Le premier piège à éviter est ce que Gottman appelle les "quatre cavaliers de l''Apocalypse" : la critique (attaquer la personnalité de l''autre), le mépris (se sentir supérieur), l''attitude défensive (refuser toute responsabilité) et la dérobade (se murer dans le silence). Reconnaître ces comportements chez soi est un premier pas décisif.

La technique du "soft startup" consiste à aborder un sujet difficile sans attaque ni reproche. On commence par décrire la situation, on exprime son ressenti à la première personne, puis on formule un besoin ou une demande. Cette séquence réduit considérablement les réactions défensives.

Apprendre à demander une pause est également fondamental. Quand l''intensité émotionnelle dépasse un certain seuil, le cortex préfrontal (siège de la rationalité) se désactive et la discussion devient contre-productive. Convenir d''un signal pour marquer une pause de 20 à 30 minutes — pas pour fuir, mais pour se calmer — peut sauver de nombreuses soirées.

Enfin, la réparation est une compétence précieuse. Même maladroitement, faire un geste de paix pendant un conflit — une touche d''humour, un "je t''aime même si je suis en colère", un contact physique — signale à l''autre que la relation est plus importante que le désaccord. Ces réparations, pratiquées régulièrement, construisent une résilience relationnelle durable.',
'f1000001-0000-0000-0000-000000000002'),

('f2000001-0000-0000-0000-000000000003',
'L''écoute active est un concept introduit par Carl Rogers dans les années 1950 dans le cadre de la psychologie humaniste. Aujourd''hui largement appliquée en coaching, en médiation et en thérapie, c''est aussi une compétence précieuse dans la vie quotidienne que chacun peut développer.

La première dimension de l''écoute active est la présence totale. Écouter activement, c''est suspendre mentalement ses propres pensées, jugements et réponses anticipées. C''est un acte volontaire difficile dans un monde saturé de distractions. Commencez par ranger votre téléphone et adopter une posture ouverte, légèrement inclinée vers votre interlocuteur.

La reformulation est l''outil central de l''écoute active. Il s''agit de refléter ce que vous avez compris, tant sur le plan du contenu que de l''émotion. "Si je comprends bien, tu te sens débordé parce que tu as l''impression de tout porter seul ?" Cette reformulation valide l''expérience de l''autre et lui permet de corriger ou d''approfondir.

Les questions ouvertes approfondissent l''échange. "Qu''est-ce qui te pèse le plus dans cette situation ?" invite à l''exploration là où "Est-ce que tu vas mieux ?" appelle à un simple oui ou non. La nuance est énorme dans les effets produits sur la qualité du dialogue.

Le silence est souvent sous-estimé. Apprendre à laisser des espaces de silence après qu''une personne s''est exprimée lui permet d''aller plus loin dans sa pensée. Résister à l''envie de remplir immédiatement le vide est une marque de respect profond et souvent très appréciée.

Pratiquer l''écoute active demande de l''entraînement. Commencez avec une conversation par jour où vous vous donnez pour objectif de ne jamais parler de vous. Vous serez surpris de ce que vous découvrirez des autres, et de l''effet que cela produira sur eux.',
'f1000001-0000-0000-0000-000000000003'),

('f2000001-0000-0000-0000-000000000004',
'Les enfants ne choisissent pas leurs comportements pour nous contrarier. Même les crises les plus épuisantes ont une logique interne liée à des besoins émotionnels non satisfaits. Comprendre cette réalité transforme le regard que nous portons sur eux — et donc notre façon de réagir.

Les neurosciences ont confirmé ce que les pédiatres et psychologues pressentaient depuis longtemps : le cerveau émotionnel (limbique) des enfants est pleinement développé dès la naissance, mais leur cortex préfrontal — siège de la régulation émotionnelle et de la raison — ne sera pleinement mature qu''autour de 25 ans. Un enfant en crise n''est pas capricieux : il est littéralement débordé par une émotion qu''il ne sait pas encore gérer seul.

Le besoin de sécurité est le plus fondamental. Un enfant qui se colle, qui pleure dès que vous partez, ou qui fait des caprices au coucher exprime souvent une inquiétude profonde concernant votre disponibilité. La réponse n''est pas la fermeté mais la constance rassurante.

Le besoin de reconnaissance est tout aussi crucial. Un enfant qui cherche l''attention par des comportements négatifs a souvent appris que c''est le moyen le plus fiable d''obtenir une réaction parentale. Inverser cette dynamique en "surprenant" l''enfant à bien faire et en le nommant explicitement change les comportements sur le long terme.

Le besoin d''autonomie, enfin, est souvent sous-estimé. Offrir des choix réels dans le cadre de règles claires ("Tu veux mettre ton manteau maintenant ou dans 2 minutes ?") réduit considérablement les conflits liés à l''opposition, car l''enfant se sent acteur de sa propre vie.',
'f1000001-0000-0000-0000-000000000004'),

('f2000001-0000-0000-0000-000000000005',
'L''intelligence émotionnelle (IE), popularisée par Daniel Goleman dans les années 1990, regroupe quatre grandes capacités : percevoir les émotions, les utiliser pour faciliter la pensée, les comprendre et les gérer. Contrairement au QI, l''IE se développe tout au long de la vie.

Étape 1 : Développer le vocabulaire émotionnel. La plupart des gens utilisent une dizaine de mots pour décrire leurs états intérieurs. Or, des chercheurs comme Lisa Feldman Barrett ont montré que nommer précisément une émotion (anxieux vs inquiet vs appréhensif) réduit son intensité. Tenez un journal émotionnel quotidien.

Étape 2 : Observer les déclencheurs. Qu''est-ce qui vous met vraiment en colère ? Quelles situations vous angoissent ? Identifier les patterns récurrents permet d''anticiper et de choisir sa réponse plutôt que de la subir.

Étape 3 : Pratiquer la pleine conscience. La méditation de pleine conscience, même 10 minutes par jour, renforce la capacité à observer ses états internes sans être emporté par eux. C''est le fondement de toute gestion émotionnelle.

Étape 4 : Cultiver l''empathie cognitive. Exercez-vous à voir les situations du point de vue de l''autre, pas seulement à ressentir ce qu''il ressent (empathie affective) mais à comprendre sa logique intérieure (empathie cognitive). Cela change radicalement la qualité des relations.

Étape 5 : Gérer l''impulsion. La règle des 90 secondes de Jill Bolte Taylor : une émotion chimique dure environ 90 secondes. Ce qui la prolonge, c''est notre récit mental. Identifier ce récit et le questionner est une compétence transformatrice.

Étape 6 : Donner un feedback constructif. L''IE permet de dire des vérités difficiles sans blesser inutilement. La structure DESC (Décrire, Exprimer, Spécifier, Conséquences positives) est un outil efficace.

Étape 7 : Accueillir les émotions des autres. Résister à l''envie de minimiser, conseiller ou relativiser quand quelqu''un souffre. Simplement valider ("Je comprends que ce soit difficile") ouvre des espaces de confiance uniques.',
'f1000001-0000-0000-0000-000000000005'),

('f2000001-0000-0000-0000-000000000006',
'La médiation familiale est un processus volontaire et confidentiel par lequel un tiers neutre et qualifié — le médiateur familial — aide des personnes en conflit à trouver elles-mêmes des solutions satisfaisantes pour tous. Elle s''applique à une grande variété de situations : séparation et divorce, conflits de garde, tensions entre parents et enfants adultes, successions, recompositions familiales.

Contrairement à la procédure judiciaire, la médiation familiale préserve la relation entre les parties. Elle est particulièrement précieuse lorsque les personnes concernées vont continuer à interagir après le conflit, notamment dans le cadre de la coparentalité. Les décisions prises ensemble sont également mieux respectées que celles imposées par un juge.

La médiation se déroule généralement en plusieurs séances de 1h30 à 2h, au rythme des parties. La première séance est souvent individuelle pour permettre à chacun de s''exprimer librement. Les suivantes sont communes. Le médiateur ne décide rien : il structure le dialogue, reformule, aide à identifier les besoins derrière les positions, et soutient la créativité des parties.

En France, la médiation familiale est partiellement remboursée par la CAF et certaines collectivités. Le coût moyen d''une séance varie entre 20 et 50 euros selon les revenus. La plupart des médiateurs familiaux sont des professionnels formés par des organismes agréés par l''État.

Quand y recourir ? Idéalement le plus tôt possible, avant que les positions ne se figent et que la communication ne soit totalement rompue. Une médiation précoce est souvent plus courte et plus efficace. Elle peut aussi être ordonnée par un juge aux affaires familiales (médiation judiciaire), mais reste toujours volontaire dans son déroulement.',
'f1000001-0000-0000-0000-000000000006'),

('f2000001-0000-0000-0000-000000000007',
'Une relation toxique se caractérise par des dynamiques répétées qui sapent l''estime de soi, la confiance et le bien-être d''au moins l''un des partenaires. Le terme "toxique" ne désigne pas nécessairement une personne malveillante — parfois, c''est la dynamique elle-même qui est devenue nocive, sans intention claire.

Les signaux d''alerte à reconnaître : vous vous sentez constamment sur la défensive ou sur le qui-vive. Vous marchez sur des œufs. Vous vous excusez de votre propre existence. Vous avez honte de votre relation devant vos proches. Vous vous retrouvez souvent à douter de votre propre perception des événements (gaslighting). Votre entourage s''est peu à peu réduit.

Comprendre les mécanismes en jeu est essentiel avant de partir. Les cycles de tension-explosion-réconciliation créent une dépendance affective réelle, souvent comparée à une addiction. La phase de réconciliation (le "lune de miel") réactive le circuit de la récompense, rendant la rupture psychologiquement difficile même quand elle est clairement nécessaire.

Les étapes pour s''en libérer : d''abord, nommer la réalité et briser l''isolement en en parlant à une personne de confiance ou à un professionnel. Ensuite, mettre en place des distances progressives si la rupture immédiate est trop difficile. Préparer un "plan de sortie" concret : logement, soutien financier, appui émotionnel. Puis poser une limite claire et la tenir.

L''après est souvent sous-estimé. Quitter une relation toxique ne suffit pas à guérir ses effets. Un suivi thérapeutique permet de comprendre les schémas qui vous ont conduit à cette relation et d''éviter de les reproduire. Le travail sur l''estime de soi et les limites saines est au cœur de cette reconstruction.',
'f1000001-0000-0000-0000-000000000007'),

('f2000001-0000-0000-0000-000000000008',
'La bienveillance n''est pas une naïveté ni une faiblesse. C''est une décision active de vouloir du bien aux autres — et à soi-même. Des décennies de recherche en psychologie positive montrent que les personnes pratiquant régulièrement des actes de bienveillance sont plus heureuses, en meilleure santé et entourées de relations plus riches.

Ce défi de 30 jours est conçu pour rendre la bienveillance concrète et progressive. Chaque semaine monte d''un cran :

Semaine 1 — Bienveillance envers soi-même : accordez-vous 15 minutes par jour pour une activité qui vous nourrit. Écrivez chaque soir trois choses positives que vous avez faites ou ressenties. Dites non à quelque chose qui vous épuise sans vous sentir coupable.

Semaine 2 — Petits gestes quotidiens : souriez sincèrement à trois inconnus. Écrivez un message de gratitude à quelqu''un qui compte pour vous. Proposez votre aide sans attendre qu''on vous la demande.

Semaine 3 — Relations proches : planifiez une conversation de qualité (téléphone rangé) avec un proche. Dites explicitement à quelqu''un pourquoi vous l''appréciez. Répondez à une irritation habituelle avec curiosité plutôt qu''avec réactivité.

Semaine 4 — Bienveillance élargie : faites un don à une cause qui vous tient à cœur. Impliquez-vous dans une action collective (voisinage, association). Prenez le temps d''écouter vraiment quelqu''un que vous connaissez peu.

À la fin du défi, beaucoup de participants rapportent que ces comportements sont devenus des réflexes naturels. La bienveillance, comme tout muscle, se renforce avec l''exercice.',
'f1000001-0000-0000-0000-000000000008');

-- ─── Tags sur les articles ────────────────────────────────────────────────────

INSERT INTO ressource_tag (tag_id, ressource_id) VALUES
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000001'), -- Communication
('e1000001-0000-0000-0000-000000000007', 'f1000001-0000-0000-0000-000000000001'), -- Empathie
('e1000001-0000-0000-0000-000000000003', 'f1000001-0000-0000-0000-000000000002'), -- Couple
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000002'), -- Communication
('e1000001-0000-0000-0000-000000000001', 'f1000001-0000-0000-0000-000000000003'), -- Communication
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000003'), -- Développement personnel
('e1000001-0000-0000-0000-000000000004', 'f1000001-0000-0000-0000-000000000004'), -- Famille
('e1000001-0000-0000-0000-000000000007', 'f1000001-0000-0000-0000-000000000004'), -- Empathie
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000005'), -- Développement personnel
('e1000001-0000-0000-0000-000000000008', 'f1000001-0000-0000-0000-000000000005'), -- Bien-être
('e1000001-0000-0000-0000-000000000006', 'f1000001-0000-0000-0000-000000000006'), -- Médiation
('e1000001-0000-0000-0000-000000000004', 'f1000001-0000-0000-0000-000000000006'), -- Famille
('e1000001-0000-0000-0000-000000000003', 'f1000001-0000-0000-0000-000000000007'), -- Couple
('e1000001-0000-0000-0000-000000000008', 'f1000001-0000-0000-0000-000000000007'), -- Bien-être
('e1000001-0000-0000-0000-000000000008', 'f1000001-0000-0000-0000-000000000008'), -- Bien-être
('e1000001-0000-0000-0000-000000000005', 'f1000001-0000-0000-0000-000000000008'); -- Développement personnel

COMMIT;
