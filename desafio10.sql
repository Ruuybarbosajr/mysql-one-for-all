SELECT so.title AS nome, COUNT(hi.song_id) AS reproducoes FROM SpotifyClone.history AS hi
JOIN SpotifyClone.song AS so
ON so.song_id = hi.song_id
JOIN SpotifyClone.`user` AS us
ON us.user_id = hi.user_id
WHERE us.plan_id IN (1, 3)
GROUP BY so.title;