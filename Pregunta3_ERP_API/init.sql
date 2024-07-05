CREATE TABLE dim_users (
    user_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    username VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE fact_posts (
    post_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    title VARCHAR(200),
    body TEXT,
    FOREIGN KEY (user_id) REFERENCES dim_users(user_id)
);