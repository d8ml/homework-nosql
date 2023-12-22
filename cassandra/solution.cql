CREATE KEYSPACE keyspace 
  WITH REPLICATION = {
  'class': 'SimpleStrategy', 
  'replication_factor': 1
  };
USE keyspace;

CREATE TABLE user_post(
    user_id    INT,
    post_id    INT,
    topic_id   INT,
    username   VARCHAR,
    content    TEXT,
    created_at TIMESTAMP,
    PRIMARY KEY (user_id, created_at)
) WITH CLUSTERING ORDER BY (created_at DESC);


CREATE TABLE topic_post(
    user_id      INT,
    post_id      INT,
    topic_id     INT,
    username     VARCHAR,
    created_date DATE,
    created_time TIMESTAMP,
    PRIMARY KEY ((topic_id, created_date), created_time)
) WITH CLUSTERING ORDER BY (created_time DESC);

INSERT INTO user_post(user_id, post_id, topic_id, username, content, created_at)
VALUES (1, 1, 1, 'User1', 'Content 1', '2023-12-20 22:21:21');

INSERT INTO user_post(user_id, post_id, topic_id, username, content, created_at)
VALUES (1, 2, 1, 'User1', 'Content 2', '2023-12-20 22:22:22');

INSERT INTO user_post(user_id, post_id, topic_id, username, content, created_at)
VALUES (2, 3, 1, 'User2', 'Content 3', '2023-12-20 22:23:23');

INSERT INTO user_post(user_id, post_id, topic_id, username, content, created_at)
VALUES (2, 4, 1, 'User2', 'Content 4', '2023-12-20 22:24:24');

INSERT INTO topic_post(user_id, post_id, topic_id, username, created_date, created_time)
VALUES (1, 1, 1, 'User1', '2023-12-15', '2023-12-15 23:59:59');

INSERT INTO topic_post(user_id, post_id, topic_id, username, created_date, created_time)
VALUES (1, 4, 2, 'User1', '2023-12-15', '2023-12-15 23:20:31');

INSERT INTO topic_post(user_id, post_id, topic_id, username, created_date, created_time)
VALUES (2, 5, 2, 'User2', '2023-12-15', '2023-12-15 23:20:32');

INSERT INTO topic_post(user_id, post_id, topic_id, username, created_date, created_time)
VALUES (1, 2, 1, 'User1', '2023-12-14', '2023-12-14 23:59:59');

INSERT INTO topic_post(user_id, post_id, topic_id, username, created_date, created_time)
VALUES (2, 3, 1, 'User2', '2023-12-15', '2023-12-15 23:19:31');

INSERT INTO topic_post(user_id, post_id, topic_id, username, created_date, created_time)
VALUES (2, 6, 1, 'User2', '2023-12-15', '2023-12-15 23:21:31');



SELECT post_id, content, created_at
FROM user_post
WHERE user_id = 1;

SELECT post_id, content, created_at, username
FROM user_post
WHERE user_id = 1
LIMIT 1;

SELECT post_id, content, created_at
FROM user_post
WHERE user_id = 2 AND created_at > '2022-01-10';

SELECT user_id, username, post_id, created_time
FROM topic_post
WHERE topic_id = 2 AND created_date = '2023-12-15';
