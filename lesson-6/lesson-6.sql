-- task 1
-- Нет предложений

-- task 2
select id, firstname, lastname from users where id = (
	select to_user_id as needed_user from messages where from_user_id=301
	union all
	select from_user_id from messages where to_user_id=301
	order by needed_user desc limit 1
);

-- task 3
select count(*) as count_of_likes from likes where user_id in (
	select user_id from (
		select user_id from profiles 
		order by birthday desc 
		limit 10
	) a	
);

-- task 4
SELECT count(*) as count_of_likes FROM likes WHERE user_id in (select user_id from profiles where gender = 'm')
union
SELECT count(*) FROM likes WHERE user_id in (select user_id from profiles where gender = 'f')
order by count_of_likes desc limit 1;


-- task 5
SELECT users.*,
(
(SELECT COUNT(1) FROM likes WHERE user_id = users.id) +
(SELECT COUNT(1) FROM messages WHERE from_user_id = users.id)
) AS cnt
FROM users
ORDER BY cnt LIMIT 10
  