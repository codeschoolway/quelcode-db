SELECT
    users.user_name,
    chat_rooms.chat_name,
    SUBSTRING(join_table.join_date, 1, 10)
FROM
    join_table
    JOIN
        users
    ON
        join_table.user_id = users.user_id
    JOIN
        chat_rooms
    ON
        join_table.chat_room_id = chat_rooms.chat_room_id
WHERE
    users.is_deleted = 0
AND chat_rooms.is_deleted = 0
ORDER BY
    join_table.join_date
    