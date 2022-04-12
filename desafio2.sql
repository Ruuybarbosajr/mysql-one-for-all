SELECT COUNT(so.song_id) AS cancoes, 
       COUNT(DISTINCT ar.artist_id) AS artistas, 
       COUNT(DISTINCT so.album_id) AS albuns FROM song AS so
JOIN album AS al
ON so.album_id = al.album_id
JOIN artist AS ar
ON ar.artist_id = al.artist_id;