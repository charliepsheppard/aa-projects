CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(50) NOT NULL, 
  lname VARCHAR(50) NOT NULL);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(20) NOT NULL,
  body VARCHAR(300),
  users_id INTEGER NOT NULL
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  follower_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY follower_id REFERENCES users(id),
  FOREIGN KEY questions_id REFERENCES questions(id)
);
