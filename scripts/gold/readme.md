# Gold Layer Insights
SQL Data Definition Language (DDL) queries create views in the gold layer of this datawarehouse. The gold layer represents the final, cleaned, 
and enriched dataset, structured for analytics and reporting in a star schema.

The key views created are:
gold.dim_customers – Customer dimension table.
gold.dim_products – Product dimension table.
gold.fact_sales – Sales fact table.
Each view aggregates and transforms data from the silver layer (intermediate processed tables) to create a business-ready dataset.

