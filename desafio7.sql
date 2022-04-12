SELECT  ar.artist_name AS artista, 
        al.title AS album,
        COUNT(fo.artist_id) AS seguidores
FROM SpotifyClone.artist AS ar
JOIN SpotifyClone.album AS al
ON al.artist_id = ar.artist_id
JOIN SpotifyClone.follower AS fo
ON ar.artist_id = fo.artist_id
GROUP BY al.title, fo.artist_id
ORDER BY seguidores DESC, artista, album;