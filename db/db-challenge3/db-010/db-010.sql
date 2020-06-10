SELECT
    users.user_name,
    posts.created_at,
    chat_rooms.chat_name
FROM
    posts
    LEFT JOIN
        chat_rooms
    ON  posts.chat_room_id = chat_rooms.chat_room_id
    LEFT JOIN
        users
    ON  posts.create_user_id = users.user_id
WHERE
    (posts.chat_room_id, posts.created_at) IN(
        SELECT
            chat_room_id,
            MAX(posts.created_at) AS created_at
        FROM
            posts
            LEFT JOIN
                users
            ON  posts.create_user_id = users.user_id
        WHERE
            posts.is_deleted = 0
        AND users.is_deleted = 0
        GROUP BY
            chat_room_id
    )
ORDER BY
    chat_rooms.chat_room_id
