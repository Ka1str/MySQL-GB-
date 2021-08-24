USE instagram;

-- Представление о пользователях
CREATE OR REPLACE VIEW view_profiles AS
	SELECT u.id AS u_id,
		   concat_ws(' ', p.first_name, p.last_name) AS name,
		   u.username,
		   u.phone_number,
		   u.email,
		   CASE (p.gender)
			   WHEN 'm' THEN 'male'
			   WHEN 'f' THEN 'female'
			   WHEN 'nb' THEN 'non-binary'
			   WHEN 'ud' THEN 'undefined'
			   END AS gender,
		   CASE (p.is_business_account)
			   WHEN 1 THEN 'business'
			   WHEN 0 THEN 'normal'
			   END AS business,
		   CASE (p.is_private)
			   WHEN 1 THEN 'private'
			   WHEN 0 THEN 'public'
			   END AS private,
		   p.avatar,
		   p.about
	  FROM users u
			   LEFT JOIN profiles p ON u.id = p.user_id

	 ORDER BY
		 u.id;
		 
select *
from view_profiles

-- Представление взаимных подписок
CREATE or replace VIEW view_followers
AS 
  select *
  FROM users
    JOIN follow_requests ON users.id = follow_requests.target_user_id
  WHERE 
  follow_requests.status = 'approved'

  	union
  	
  select *
  FROM users
    JOIN follow_requests ON users.id = follow_requests.initiator_user_id
  WHERE 
  follow_requests.status = 'approved'

select *
from view_followers
where id = 101