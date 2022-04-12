SELECT ar.artist_name AS artista, 
       al.title AS album 
FROM SpotifyClone.artist AS ar
JOIN SpotifyClone.album AS al
ON al.artist_id = ar.artist_id
WHERE ar.artist_name = 'Walter Phoenix'
ORDER BY album;