BEGIN;

DELETE
FROM
    join_table
WHERE
    user_id IN(
        SELECT
            user_id
        FROM
            users
        WHERE
            is_deleted = 1
    );

COMMIT;
