/* 
This script defines the Bronze Layer tables in the Data Warehouse project. The Bronze Layer is the raw data unprocessed or 
lightly processed data from different sources such as CRM and ERP systems.

Each table serves a distinct purpose, and the script follows best practices like: Dropping tables if they exist before creating them (ensures a fresh structure).
Using appropriate data types like DATE for dates and NVARCHAR for flexible text storage.
*/ 


IF OBJECT_ID('bronze.crm_cust_info', 'TABLE') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_gndr            NVARCHAR(10),
    cst_marital_status  NVARCHAR(20),
    cst_create_date     DATE
);
GO

-- Drop and create crm_prd_info table
IF OBJECT_ID('bronze.crm_prd_info', 'TABLE') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
GO

-- Drop and create crm_sales_details table
IF OBJECT_ID('bronze.crm_sales_details', 'TABLE') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt DATE,   -- Changed from INT to DATE
    sls_ship_dt  DATE,   -- Changed from INT to DATE
    sls_due_dt   DATE,   -- Changed from INT to DATE
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);
GO

-- Drop and create erp_loc_a101 table
IF OBJECT_ID('bronze.erp_loc_a101', 'TABLE') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

-- Drop and create erp_cust_az12 table
IF OBJECT_ID('bronze.erp_cust_az12', 'TABLE') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);
GO

-- Drop and create erp_px_cat_g1v2 table
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'TABLE') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
GO
