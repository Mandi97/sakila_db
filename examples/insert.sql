CREATE TABLE IF NOT EXISTS actor_sample (
    actor_id SERIAL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id)
);


INSERT INTO actor_sample (first_name, last_name) VALUES ('Jarosław', 'K');

INSERT INTO actor_sample (first_name, last_name)
VALUES ('Lech', 'K'),
       ('Antoni', 'M'),
       ('Janusz', 'K');

INSERT INTO actor_sample (first_name, last_name)
SELECT first_name, last_name
FROM actor
WHERE first_name = 'NICK';

SELECT * FROM actor_sample;


DROP TABLE actor_sample;
