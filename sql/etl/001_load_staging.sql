INSERT INTO staging.users
(
    user_id,
    first_name,
    last_name,
    email,
    created_at
)

SELECT

    user_id,

    TRIM(first_name),

    TRIM(last_name),

    LOWER(email),

    created_at

FROM raw.users;