/*
Additionally, create a second view where we can visualize a weekly report
  with 7 columns, each column will be labeled with the day and date,
  and each row will show a concatenation of these elements and they will be separated
  by a double colon ::
-order_uuid
-number of products
-order amount in cents
  */


CREATE PROCEDURE `CreateOrUpdateWeeklyOrderReport`()
BEGIN
    -- Variables for the column names
    DECLARE colName1, colName2, colName3, colName4, colName5, colName6, colName7 VARCHAR(255);

    -- Set the column names based on current date
    SET colName1 = CONCAT(DATE_FORMAT(CURDATE() - INTERVAL 6 DAY, '%W %d/%m/%Y'));
    SET colName2 = CONCAT(DATE_FORMAT(CURDATE() - INTERVAL 5 DAY, '%W %d/%m/%Y'));
    SET colName3 = CONCAT(DATE_FORMAT(CURDATE() - INTERVAL 4 DAY, '%W %d/%m/%Y'));
    SET colName4 = CONCAT(DATE_FORMAT(CURDATE() - INTERVAL 3 DAY, '%W %d/%m/%Y'));
    SET colName5 = CONCAT(DATE_FORMAT(CURDATE() - INTERVAL 2 DAY, '%W %d/%m/%Y'));
    SET colName6 = CONCAT(DATE_FORMAT(CURDATE() - INTERVAL 1 DAY, '%W %d/%m/%Y'));
    SET colName7 = CONCAT(DATE_FORMAT(CURDATE(), '%W %d/%m/%Y'));

    -- Create the SQL string to create or modify the view
    SET @sql = CONCAT('
        CREATE OR REPLACE VIEW weekly_order_report AS

        WITH CTE AS (
            SELECT
                DATE(o.created_at) AS order_date,
                CONCAT(o.uuid, ''::'', JSON_LENGTH(o.products), ''::'', CAST(o.amount*100 AS UNSIGNED)) AS order_info,
                (ROW_NUMBER() OVER (ORDER BY o.id) - 1) DIV 7 AS row_group
            FROM
                orders o
            WHERE
                o.created_at >= CURDATE() - INTERVAL 6 DAY
        )

        SELECT
            MAX(CASE WHEN order_date = CURDATE() - INTERVAL 6 DAY THEN order_info END) AS `', colName1, '`,
            MAX(CASE WHEN order_date = CURDATE() - INTERVAL 5 DAY THEN order_info END) AS `', colName2, '`,
            MAX(CASE WHEN order_date = CURDATE() - INTERVAL 4 DAY THEN order_info END) AS `', colName3, '`,
            MAX(CASE WHEN order_date = CURDATE() - INTERVAL 3 DAY THEN order_info END) AS `', colName4, '`,
            MAX(CASE WHEN order_date = CURDATE() - INTERVAL 2 DAY THEN order_info END) AS `', colName5, '`,
            MAX(CASE WHEN order_date = CURDATE() - INTERVAL 1 DAY THEN order_info END) AS `', colName6, '`,
            MAX(CASE WHEN order_date = CURDATE() THEN order_info END) AS `', colName7, '`
        FROM
            CTE
        GROUP BY
            row_group
    ');

    -- Execute the SQL
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END