SELECT COUNT(hi.user_id) AS quantidade_musicas_no_historico 
FROM SpotifyClone.history AS hi
JOIN SpotifyClone.`user` AS us
ON us.user_id = hi.user_id
WHERE us.user_name = 'Bill';