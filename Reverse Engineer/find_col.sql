-- Find all columns that contain the word 'validation' for example

SELECT 
    c.table_name,
    c.column_name
FROM 
    information_schema.columns c
JOIN 
    information_schema.tables t ON c.table_name = t.table_name
WHERE 
    lower(c.column_name) LIKE '%validation%';