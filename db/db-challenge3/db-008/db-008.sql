SELECT
    user_name,
    chat_rooms.chat_name,
    join_table.join_date
FROM
    join_table
    JOIN
        users
    ON  (join_table.user_id = users.user_id
        AND users.is_deleted <> 1
        )
    JOIN
        chat_rooms
    ON  (chat_rooms.chat_room_id = join_table.chat_room_id
        AND chat_rooms.is_deleted <> 1
        )
ORDER BY
    join_table.join_date