SELECT
    count(*) AS 投稿数,
    (SELECT
        chat_name
    FROM
        chat_rooms AS c
    WHERE
        p.chat_room_id = c.chat_room_id
    AND c.is_deleted <> 1
    ) AS チャットルーム名
FROM
    posts AS p
WHERE
    p.is_deleted <> 1
GROUP BY
    chat_room_id
ORDER BY
    投稿数 DESC