DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(50) NOT NULL, 
  lname VARCHAR(50) NOT NULL);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(20) ,
  body VARCHAR(300),
  users_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  follower_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  replied_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,
  reply_id INTEGER,

  FOREIGN KEY (reply_id) REFERENCES replies(id)
  FOREIGN KEY (replied_id) REFERENCES questions(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES 
('Thiago', 'Moura'),
('Charlie', 'Sheppard');

INSERT INTO
  questions (title, body, users_id) 
VALUES
  ('Why is the sky blue?', 'Because it is!', (SELECT id FROM users WHERE fname = 'Thiago'));
