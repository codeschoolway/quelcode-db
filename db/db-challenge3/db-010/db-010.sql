SELECT
    (SELECT
        user_name
    FROM
        users
    WHERE
        user_id = create_user_id
    AND is_deleted <> 1
    ) AS ユーザー名,
    created_at AS 投稿日,
    (SELECT
        chat_name
    FROM
        chat_rooms
    WHERE
        chat_room_id = p.chat_room_id
    AND is_deleted <> 1
    ) AS チャットルーム名
FROM
    posts AS p
WHERE
    (chat_room_id, created_at) IN(
        SELECT
            chat_room_id,
            MAX(created_at) AS created_at
        FROM
            posts
        GROUP BY
            chat_room_id
    )
ORDER BY p.chat_room_id