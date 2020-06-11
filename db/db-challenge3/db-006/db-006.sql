SELECT
    user_id,
    email,
    password,
    user_name,
    description,
    work_phone,
    cell_phone,
    is_deleted,
    created_at,
    updated_at
FROM
    users
ORDER BY
    user_id
