CREATE TABLE IF NOT EXISTS staging.users (

    user_id INTEGER PRIMARY KEY,

    first_name TEXT,

    last_name TEXT,

    email TEXT,

    created_at TIMESTAMP

);