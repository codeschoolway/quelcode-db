SELECT
    COUNT(posts.post_id) AS 投稿数,
    chat_rooms.chat_name
FROM
    posts
    LEFT JOIN
        chat_rooms
    ON  posts.chat_room_id = chat_rooms.chat_room_id
    LEFT JOIN
        users
    ON posts.create_user_id = users.user_id
WHERE
    posts.is_deleted = 0
AND    users.is_deleted = 0

GROUP BY
    posts.chat_room_id,
    chat_rooms.chat_name
ORDER BY
    投稿数 DESC