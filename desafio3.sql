SELECT 	us.user_name AS usuario, 
        COUNT(hi.song_id) AS qtde_musicas_ouvidas,
        ROUND(SUM(so.duration_seconds / 60), 2) AS total_minutos 
FROM SpotifyClone.`user` AS us
JOIN SpotifyClone.history AS hi
ON hi.user_id = us.user_id
JOIN SpotifyClone.song AS so
ON hi.song_id = so.song_id
GROUP BY us.user_name;