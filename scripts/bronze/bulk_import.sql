-- clear the tables and load the data into the empty tables --
TRUNCATE TABLE bronze.crm_cust_info
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\danny\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW= 2,
	FIELDTERMINATOR= ',',
	TABLOCK
);

-- trying to run this query to import the csv files was impossible to make it work because it first gave Access Denied errors (solved) and the Msg 208, Level 16, State 82, Line 1
-- Invalid object name 'bronze.crm_cust_info'. Tried every single solution on internet and nothing worked
-- The workaround that I found was to import the datasets using the Task > Import Flat Table options and then rename the tables

SELECT * FROM bronze.crm_cust_info

SELECT COUNT(*) FROM bronze.crm_cust_info
