CREATE SCHEMA IF NOT EXISTS lbaw2421;
SET search_path TO lbaw2421;
-----------------------------------------
-- User-defined Types
-----------------------------------------
CREATE TYPE connection_type AS ENUM ('BLOCK', 'FOLLOW', 'FRIEND');
CREATE TYPE noti_type as ENUM ('LIKE','COMMENT','MESSAGE','REQUEST','INFO')
CREATE TYPE user_type as ENUM ('INFLUENCER')
CREATE TYPE post_type as ENUM ('MEDIA','TEXT')
-----------------------------------------
-- Tables
-----------------------------------------



DROP TABLE IF EXISTS messageTag CASCADE;
DROP TABLE IF EXISTS commentTag CASCADE;
DROP TABLE IF EXISTS report CASCADE;
DROP TABLE IF EXISTS media CASCADE;
DROP TABLE IF EXISTS comment CASCADE;
DROP TABLE IF EXISTS connection CASCADE;
DROP TABLE IF EXISTS directChat CASCADE;
DROP TABLE IF EXISTS postLikes CASCADE;
DROP TABLE IF EXISTS postCategory CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS post CASCADE;
DROP TABLE IF EXISTS message CASCADE;
DROP TABLE IF EXISTS groupParticipant CASCADE;
DROP TABLE IF EXISTS groups CASCADE;
DROP TABLE IF EXISTS notification CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL CONSTRAINT user_email_uk UNIQUE,
    username TEXT NOT NULL CONSTRAINT user_username_uk UNIQUE,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    photo_url TEXT,
    age INTEGER NOT NULL CONSTRAINT user_age_ck CHECK (age > 13),
    bio TEXT,
    is_public BOOLEAN NOT NULL,
    is_influencer BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE notification (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    is_text BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    photo_url TEXT,
    owner_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE
);

CREATE TABLE groupParticipant (
    group_id INTEGER NOT NULL REFERENCES groups(id) ON UPDATE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    date_joined TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    PRIMARY KEY (group_id, user_id)
);

CREATE TABLE message (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_DATE NOT NULL,
    group_id INTEGER REFERENCES groups(id) ON UPDATE CASCADE,
    direct_chat BOOLEAN,
    author_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE
);

CREATE TABLE messageTag (
    message_id INTEGER NOT NULL REFERENCES message(id) ON UPDATE CASCADE,
    tagged_user_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    PRIMARY KEY (message_id, tagged_user_id)
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    description TEXT,
    is_edited BOOLEAN NOT NULL DEFAULT false,
    is_public BOOLEAN NOT NULL DEFAULT false,
    owner_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE postCategory (
    post_id INTEGER NOT NULL REFERENCES post(id) ON UPDATE CASCADE,
    category_id INTEGER NOT NULL REFERENCES category(id) ON UPDATE CASCADE,
    PRIMARY KEY (post_id, category_id)
);

CREATE TABLE postLikes (
    post_id INTEGER NOT NULL REFERENCES post(id) ON UPDATE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    PRIMARY KEY (post_id, user_id)
);

CREATE TABLE directChat (
    user1_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    user2_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    dateCreation TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    PRIMARY KEY (user1_id, user2_id)
);

CREATE TABLE connection (
    follower_user_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    followed_user_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    typeR connection_type,
    PRIMARY KEY (follower_user_id, followed_user_id)
);

CREATE TABLE comment (
    comment_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    is_edited BOOLEAN NOT NULL DEFAULT false,
    post_id INTEGER NOT NULL REFERENCES post(id) ON UPDATE CASCADE,
    author_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE
);

CREATE TABLE commentTag (
    comment_id INTEGER NOT NULL REFERENCES comment(comment_id) ON UPDATE CASCADE,
    tagged_user_id INTEGER NOT NULL REFERENCES users(id) ON UPDATE CASCADE,
    PRIMARY KEY (comment_id, tagged_user_id)
);

CREATE TABLE media (
    media_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES post(id) ON UPDATE CASCADE
);

CREATE TABLE report (
    report_id SERIAL PRIMARY KEY,
    content TEXT,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    solvedAt TIMESTAMP WITH TIME ZONE,
    comment_id INTEGER REFERENCES comment(comment_id) ON UPDATE CASCADE,
    post_id INTEGER REFERENCES post(id) ON UPDATE CASCADE,
    target_user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE,
    author_id INTEGER REFERENCES users(id) ON UPDATE CASCADE,
    CHECK (solvedAt > createdAt)
);
