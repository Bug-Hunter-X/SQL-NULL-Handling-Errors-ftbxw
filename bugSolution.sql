To correct the issues, always use `IS NULL` or `IS NOT NULL` for comparisons with NULL values.  To handle NULLs within aggregate functions, use `COALESCE` or similar functions to substitute a default value (like 0) for NULLs.   

-- Incorrect comparison using =
SELECT * FROM MyTable WHERE myColumn = NULL; -- Always false

-- Corrected comparison using IS NULL
SELECT * FROM MyTable WHERE myColumn IS NULL;

-- Incorrect aggregate function on data with NULLs
SELECT AVG(myColumn) FROM MyTable; -- Ignores NULLs

-- Corrected aggregate function handling NULLs
SELECT AVG(COALESCE(myColumn, 0)) FROM MyTable; -- Replaces NULLs with 0 before calculating average