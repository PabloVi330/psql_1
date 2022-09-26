CREATE TABLE users (
id_user UUID PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL,
email INTEGER NOT NULL UNIQUE,
password VARCHAR NOT NULL,
age INTEGER NOT NULL,
fk_id_roles UUID NOT NULL);

CREATE TABLE courses (
id_course UUID PRIMARY KEY NOT NULL,
title VARCHAR NOT NULL UNIQUE,
description TEXT NOT NULL,
level INTEGER NOT NULL,
teacher INTEGER NOT NULL,
fk_id_category UUID NOT NULL);

CREATE TABLE course_video (
id_course_video UUID PRIMARY KEY NOT NULL,
fk_id_course UUID NOT NULL,
url TEXT NOT NULL);

CREATE TABLE categories (
id_category UUID PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL UNIQUE);

CREATE TABLE roles (
id_role UUID PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL UNIQUE);

CREATE TABLE user_course (
fk_id_user UUID NOT NULL,
fk_id_course UUID NOT NULL,
porcentaje INTEGER NOT NULL);

ALTER TABLE users ADD CONSTRAINT users_fk_id_roles_roles_id_role FOREIGN KEY (fk_id_roles) REFERENCES roles(id_role);
ALTER TABLE courses ADD CONSTRAINT courses_fk_id_category_categories_id_category FOREIGN KEY (fk_id_category) REFERENCES categories(id_category);
ALTER TABLE course_video ADD CONSTRAINT course_video_fk_id_course_courses_id_course FOREIGN KEY (fk_id_course) REFERENCES courses(id_course);
ALTER TABLE user_course ADD CONSTRAINT user_course_fk_id_user_users_id_user FOREIGN KEY (fk_id_user) REFERENCES users(id_user);
ALTER TABLE user_course ADD CONSTRAINT user_course_fk_id_course_courses_id_course FOREIGN KEY (fk_id_course) REFERENCES courses(id_course);

