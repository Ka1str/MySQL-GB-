DROP DATABASE IF EXISTS instagram;
CREATE DATABASE instagram;
USE instagram;

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE
);
    
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	signed_up_at TIMESTAMP DEFAULT now(),
	username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    phone_number BIGINT UNSIGNED UNIQUE,
	password_hash VARCHAR(100),
	
	INDEX username_idx(username)
);

DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL PRIMARY KEY,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    filename VARCHAR(255),    	
    media_size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL, 
	media_id BIGINT UNSIGNED NOT NULL,
	title VARCHAR(100),
	location VARCHAR(100),
	description VARCHAR(200),
	is_archived BIT DEFAULT 0,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	INDEX (location),
	
	FOREIGN KEY (user_id) REFERENCES media(user_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS saved_posts;
CREATE TABLE saved_posts (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL, 
	post_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);    

DROP TABLE IF EXISTS stories;
CREATE TABLE stories (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL, 
	media_id BIGINT UNSIGNED NOT NULL,
	is_archived BIT DEFAULT 0,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (user_id) REFERENCES media(user_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	tagged_user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES media(user_id),
    FOREIGN KEY (tagged_user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);


DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id SERIAL PRIMARY KEY,
	updated_at TIMESTAMP DEFAULT now(),
	first_name VARCHAR(100),
	last_name VARCHAR(100) DEFAULT ' ',
    gender ENUM ('m', 'f', 'nb', 'ud') DEFAULT 'ud',
	avatar BIGINT UNSIGNED DEFAULT 1,
	web_site VARCHAR(100) DEFAULT ' ',
    about VARCHAR(300) DEFAULT ' ',
    is_business_account BIT DEFAULT 0,
    is_private BIT DEFAULT 0,
    
    INDEX name_idx(first_name, last_name),
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (avatar) REFERENCES media(id)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user BIGINT UNSIGNED NOT NULL,
	to_user BIGINT UNSIGNED NOT NULL,
	created_at TIMESTAMP DEFAULT now(),
	body_text TEXT NOT NULL,

	FOREIGN KEY (from_user) REFERENCES users(id),
	FOREIGN KEY (to_user) REFERENCES users(id),
	CHECK (from_user <> to_user)
);

DROP TABLE IF EXISTS follow_requests;
CREATE TABLE follow_requests (
	initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    status ENUM('requested', 'approved', 'declined', 'unfriended'),
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
    PRIMARY KEY (initiator_user_id, target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (target_user_id) REFERENCES users(id),
    CHECK (initiator_user_id <> target_user_id)
);

DROP TABLE IF EXISTS media_likes;
CREATE TABLE media_likes (
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);    

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    body_text TEXT NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS comment_likes;
CREATE TABLE comment_likes (
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    comment_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (comment_id) REFERENCES comments(id)
);    