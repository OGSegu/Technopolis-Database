-- Type of film example: [comedy, drama, action and etc]
CREATE TABLE kinds (
	kind_id SERIAL PRIMARY KEY,
	kind_name VARCHAR(16) NOT NULL
);

CREATE TABLE genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(16) NOT NULL
);

CREATE TABLE films (
	film_id SERIAL PRIMARY KEY,
	film_name VARCHAR(64) NOT NULL,
	kind_id INTEGER,
	genre_id INTEGER,
	FOREIGN KEY (kind_id) REFERENCES kinds (kind_id),
	FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);

CREATE TABLE actors (
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(64) NOT NULL,
	birth_date DATE
);

CREATE TABLE film_actors (
	film_id INTEGER NOT NULL,
	actor_id INTEGER NOT NULL,
	role VARCHAR(32) NOT NULL DEFAULT 'Unknown',
	FOREIGN KEY (film_id) REFERENCES films(film_id),
	FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

INSERT INTO actors (first_name, last_name, birth_date) VALUES 
		('Вадим', 'Кривицкий', '2001-05-26'),
		('Евгений', 'Чупров', '2000-12-16'),
		('Евгений', 'Аксенова', '2003-04-11'),
		('Илья', 'Мукаддам', '2001-05-20');
INSERT INTO kinds (kind_name) VALUES 
		('фильм'), 
		('сериал'), 
		('ситком');
INSERT INTO genres (genre_name) VALUES 
		('комедия'), 
		('драма'), 
		('боевик'), 
		('мелодрама'), 
		('фантастика');
INSERT INTO films (film_name, kind_id, genre_id) VALUES
		('Семь', 1, 3),
		('Три мушкетера', 1, 3),
		('Ривердейл', 2, 1),
		('Очень странные дела', 2, 5),
		('Моя прекрасная няня', 3, 1);
INSERT INTO film_actors (film_id, actor_id, role) VALUES
		(1, 1, 'Пастух'),
		(1, 2, 'Анна'),
		(1, 3, 'Солдат'),
		(2, 4, 'Иранец'),
		(3, 4, 'Американец');



