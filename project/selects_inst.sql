USE instagram;

-- Подсчет количества лайков для публикаций от мужчин
SELECT 
	media_id
	, COUNT(*)
FROM media_likes 
WHERE media_id IN (
  SELECT id FROM media WHERE user_id IN (
  SELECT user_id FROM profiles WHERE gender = 'm'
  )
)
GROUP BY media_id;

-- Подсчет количества публикаций по годам
SELECT 
	COUNT(id) AS media
	, YEAR(created_at) AS year_name
FROM media
GROUP BY year_name
order by year_name desc; 

-- Выборка медиафайлов пользователей с количеством лайков
SELECT media.filename,
  media_types.name AS media_type,
  COUNT(*) AS total_likes,
  username AS owner
  FROM media
    JOIN media_types ON media.media_type_id = media_types.id
    JOIN media_likes ON media.id = media_likes.media_id
    JOIN users ON users.id = media.user_id
  GROUP BY media.id
  ORDER BY media_type;

-- Выборка количества взаимных подписок пользователей
SELECT username, COUNT(*) AS total_friends
  FROM users
    JOIN follow_requests ON (users.id = follow_requests.initiator_user_id or users.id = follow_requests.target_user_id)
  where follow_requests.status = 'approved'
  GROUP BY users.id
  ORDER BY total_friends DESC;