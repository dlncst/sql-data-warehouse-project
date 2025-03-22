# Silver Layer Insights  
In data warehousing the Silver layer typically represents a cleansed and conformed version of raw data from the bronze layer.   
The scripts in this directory suggest a focus on integrating and transforming data from various sources, such as CRM and ERP systems, to create standardized tables in the Silver layer. 
This structured data can then be further processed or analyzed in subsequent stages (gold layer for and further data analysis) of the data warehouse pipeline.​

### Data Definition Language (DDL) Scripts:
ddl_silver.sql: Defines the structure of tables in the Silver layer of the data warehouse.​

### Stored Procedure:
proc_load_silver.sql: Contains a stored procedure to load data into the Silver tables.​

### Data Transformation Scripts:
**silver.crm_cust_info.sql:** Processes customer information from the CRM system.  ​
**silver.crm_prd_info.sql:** Handles product information from the CRM system.​  
**silver.crm_sales_details.sql:** Manages sales details from the CRM system.​  
**silver.erp_cust_az12.sql:** Processes customer data from the ERP system.​  
**silver.erp_loc_a101.sql:** Handles location data from the ERP system.​  
**silver.erp_px_cat_g1v2.sql:** Manages product category data from the ERP system.​



