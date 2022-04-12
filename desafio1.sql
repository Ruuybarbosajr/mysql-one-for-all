DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plan(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(25) NOT NULL,
  plan_value DECIMAL(4,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.`user`(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(45) NOT NULL,
  user_age SMALLINT NOT NULL,
  data_subscription date NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist(
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_id INT NOT NULL,
  title VARCHAR(75) NOT NULL,
  release_year YEAR NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follower(
  artist_id INT,
  user_id INT,
  CONSTRAINT PRIMARY KEY (artist_id, user_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.`user`(user_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.song(
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(45) NOT NULL,
  duration_seconds SMALLINT NOT NULL,
  album_id INT,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
  song_id INT,
  user_id INT,
  date_reproduction DATETIME,
  CONSTRAINT PRIMARY KEY (song_id, user_id),
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.song(song_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.`user`(user_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plan(plan_name, plan_value)
VALUES ('Gratuito', 0),
       ('Universitário', 5.99),
       ('Pessoal', 6.99),
       ('Familiar', 7.99);

INSERT INTO SpotifyClone.`user`(user_name, user_age, data_subscription, plan_id)
VALUES ('Thati', 23, '2019-10-20', 1),
       ('Cintia', 35, '2017-12-30', 4),
       ('Bill', 20, '2019-06-05', 2),
       ('Roger', 45, '2020-05-13', 3),
       ('Norman', 58, '2017-02-17', 3),
       ('Patrick', 33, '2017-01-06', 4),
       ('Vivian', 26,	'2018-01-05', 2),
       ('Carol', 19, '2018-02-14', 2),
       ('Angelina', 42, '2018-04-29', 4),
       ('Paul', 46,	'2017-01-17', 4);

INSERT INTO SpotifyClone.artist(artist_name)
VALUES ('Walter Phoenix'),
       ('Peter Strong'),
       ('Lance Day'),
       ('Freedie Shannon'),
       ('Tyler Isle'),
       ('Fog');

INSERT INTO SpotifyClone.album(artist_id, title, release_year)
VALUES  (1, 'Envious', '1990'),
        (1, 'Exuberant', '1993'),
        (2, 'Hallowed Steam', '1995'),
        (3, 'Incandescent', '1998'),
        (4, 'Temporary Culture', '2001'),
        (4, 'Library of liberty', '2003'),
        (5, 'Chained Down', '2007'),
        (5, 'Cabinet of fools', '2012'),
        (5, 'No guarantees', '2015'),
        (6, 'Apparatus', '2015');

INSERT INTO SpotifyClone.follower(user_id, artist_id)
VALUES (1, 1),
       (1, 4),
       (1, 3),
       (2, 1),
       (2, 3),
       (3, 2),
       (3, 1),
       (4, 4),
       (5, 5),
       (5, 6),
       (6, 6),
       (6, 3),
       (6, 1),
       (7, 2),
       (7, 5),
       (8, 1),
       (8, 5),
       (9, 6),
       (9, 4),
       (9, 3),
       (10, 2),
       (10, 6);