# Part One: Bronze Layer Insights
This script defines the Bronze Layer tables in this Data Warehouse project. The Bronze Layer is the raw data, 
storing unprocessed or lightly processed data from different sources such as CRM and ERP systems.

Each table serves a distinct purpose, and the script follows best practices like: Dropping tables if they exist before creating them (ensures a fresh structure).
Using appropriate data types like DATE for dates and NVARCHAR for flexible text storage

## Breakdown of Each Table
### bronze.crm_cust_info (Customer Information)
Purpose:
Stores customer-related data from the CRM system.

Key Columns & Insights:
cst_id: Primary customer ID (INT), likely a unique identifier from CRM.
cst_key: Customer key (NVARCHAR(50)), possibly a system-wide unique identifier.
cst_firstname, cst_lastname: Customer’s first and last name.
cst_gndr: Gender (NVARCHAR(10)), suggests values like 'Male', 'Female', 'Other', or 'n/a'.
cst_marital_status: Marital status (values like 'Single', 'Married', etc.).
cst_create_date: Customer creation date in the CRM system.

### bronze.crm_prd_info (Product Information)
Purpose:
Stores product details from the CRM system.

Key Columns & Insights:
prd_id: Product ID (INT), primary identifier from CRM.
prd_key: Unique product key (likely for integration with other systems).
prd_nm: Product name (e.g., Laptop, Phone, etc.).
prd_cost: Product cost (INT), indicating pricing details.
prd_line: Product line/category (e.g., Electronics, Clothing, etc.).
prd_start_dt, prd_end_dt: Product availability timeline (helps in historical analysis).
Important Consideration: The prd_end_dt column is nullable. This allows tracking of active and discontinued products.

### bronze.crm_sales_details (Sales Transactions)
Purpose:
Holds detailed sales transactions from CRM.

Key Columns & Insights:
sls_ord_num: Sales Order Number (Primary transaction ID).
sls_prd_key: Product identifier (joins with product table).
sls_cust_id: Customer ID (joins with customer table).
sls_order_dt, sls_ship_dt, sls_due_dt: Sales order, shipping, and due dates.
sls_sales: Total sales amount.
sls_quantity: Quantity sold.
sls_price: Unit price per product.
Important Fix: sls_order_dt, sls_ship_dt, and sls_due_dt were changed to DATE instead of INT for proper date storage

### bronze.erp_loc_a101 (Customer Location Data)
Purpose:
Stores customer location details from the ERP system.

Key Columns & Insights:
cid: Customer ID (linked to crm_cust_info).
cntry: Country (e.g., 'USA', 'Germany', etc.).
Insight: This table helps with geographic analysis (e.g., customer distribution by country)

### bronze.erp_cust_az12 (Customer Additional Info from ERP)
Purpose:
Stores additional customer attributes not captured in crm_cust_info.

Key Columns & Insights:
cid: Customer ID (joins with CRM customers).
bdate: Customer birthdate (used for age analysis and segmentation).
gen: Gender field (backup source for gender information).
Business Insight:
The gen column acts as a fallback source if CRM does not have gender data (COALESCE function can be used in later transformations).

### bronze.erp_px_cat_g1v2 (Product Category & Maintenance Info)
Purpose:
Stores product categories and maintenance details.

Key Columns & Insights:
id: Category ID (joins with crm_prd_info.cat_id).
cat: Category name (e.g., 'Electronics', 'Furniture').
subcat: Subcategory name (e.g., 'Laptops', 'Tables').
maintenance: Maintenance-related info (if applicable to the product).
Business Impact:
Used for product categorization in analytics.
Helps in warranty and maintenance tracking

