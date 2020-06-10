BEGIN;
UPDATE
    chat_rooms
SET
    allowed_to_send = 0,
    update_user_id = 1,
    updated_at = NOW()
WHERE
    create_user_id
    IN
    (
        SELECT
        chat_room_id
        FROM
        join_table
        WHERE
        chat_room_id IN (SELECT chat_room_id FROM join_table WHERE user_id <> 1)
    )
    AND
    is_deleted = 0;
COMMIT;
