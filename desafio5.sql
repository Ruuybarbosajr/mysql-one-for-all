SELECT  s.title AS cancao, 
        COUNT(h.user_id) AS reproducoes 
FROM SpotifyClone.history AS h
JOIN SpotifyClone.song AS s
ON s.song_id = h.song_id
GROUP BY s.song_id 
ORDER BY reproducoes DESC,
cancao LIMIT 2;