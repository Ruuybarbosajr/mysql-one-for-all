SELECT us.user_name AS usuario, 
IF (MAX(YEAR(date_reproduction)) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.`user` AS us
JOIN SpotifyClone.history AS hi
ON hi.user_id = us.user_id
GROUP BY us.user_name;