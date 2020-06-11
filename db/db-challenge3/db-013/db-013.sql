BEGIN;

UPDATE
    users
SET
    is_deleted = 1,
    updated_at = NOW()
WHERE
    work_phone IS NULL
AND cell_phone IS NULL;

COMMIT;
