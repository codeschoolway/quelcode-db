SELECT
    chat_room_id,
    chat_name,
    chat_description,
    is_diret_chat,
    is_deleted,
    create_user_id,
    created_at,
    update_user_id,
    updated_at,
    CASE
        WHEN allowed_to_send = 1 THEN '許可'
        ELSE '禁止'
    END AS allowed_to_send
FROM
    chat_rooms
WHERE
    is_diret_chat = 1
AND is_deleted <> 1
ORDER BY
    chat_room_id
 