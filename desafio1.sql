DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plan(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(25) NOT NULL,
  plan_value DECIMAL(4,2) NOT NULL
);

CREATE TABLE SpotifyClone.`user`(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(45) NOT NULL,
  user_age SMALLINT NOT NULL,
  data_subscription date NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(plan_id)
);

CREATE TABLE SpotifyClone.artist(
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(45) NOT NULL
);

CREATE TABLE SpotifyClone.album(
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_id INT NOT NULL,
  title VARCHAR(75) NOT NULL,
  release_year SMALLINT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
);

CREATE TABLE SpotifyClone.follower(
  artist_id INT,
  user_id INT,
  CONSTRAINT PRIMARY KEY (artist_id, user_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.`user`(user_id)
);

CREATE TABLE SpotifyClone.song(
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(45) NOT NULL,
  duration_seconds SMALLINT NOT NULL,
  album_id INT,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
);

CREATE TABLE SpotifyClone.history(
  song_id INT,
  user_id INT,
  date_reproduction DATETIME,
  CONSTRAINT PRIMARY KEY (song_id, user_id),
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.song(song_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.`user`(user_id)
);