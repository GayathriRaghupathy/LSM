# PeakMedia

📊 PeakMedia Affiliate Performance Analytics
📌 Overview

This project presents an end-to-end data engineering and analytics solution for analyzing affiliate and campaign performance. It covers data cleansing, warehouse modeling, SQL-based analysis, and an interactive Power BI dashboard.

The goal is to answer key business questions such as:

Top-performing operators by commission
Best campaigns by return on spend (ROI)
Conversion efficiency across the funnel (Clicks → Registrations → FTDs)
🏗️ Project Architecture

The solution follows a modern data workflow:

Raw Data Sources
TrackAff (affiliate tracking data)
AffMatrix (player-level data)
Campaign data (marketing spend & clicks)
Data Processing
Data cleansing and transformation
Standardization and validation
Data Warehouse (Star Schema)
Fact tables for performance and spend
Dimension tables for operators, campaigns, cards, and currency
Analytics Layer
SQL queries for business questions
Power BI dashboard for visualization
🧹 Data Cleansing

The data was cleaned to ensure consistency and reliability before analysis.

Key steps included:

Standardizing date formats
Handling NULL and negative values
Removing invalid or duplicate records
Ensuring logical consistency (e.g., FTD ≥ registration date)

📄 See full details:
👉

🧱 Data Model

A star schema was designed to support scalable analytics.

Fact Tables
fact_affiliate_performance → registrations, FTDs, commission
fact_campaign_spend → clicks, impressions, spend
Dimension Tables
Operator
Campaign
Card
Currency
Currency rates

This structure enables:

Cross-fact analysis (performance vs spend)
Efficient filtering and aggregation
Currency normalization for global reporting

📄 Model details:
👉

🗄️ Data Warehouse (DDL)

The schema was implemented using SQL DDL scripts, including:

Dimension tables
Fact tables
Optional foreign key relationships

📄 DDL Script:
👉

🔄 Data Loading (ETL)

Incremental loading is implemented using stored procedures:

MERGE logic for dimensions
Incremental updates for fact tables

This ensures:

Efficient updates
No duplicate data
Scalable pipeline design

📄 Stored Procedures:
👉

📊 SQL Analysis

SQL queries were written to answer key business questions:

1. Top Operator by Commission
Aggregates commission (normalized to GBP)
Ranks operators by total commission
2. Best Campaign by ROI
Combines commission and spend
Calculates return on spend
3. Conversion Funnel Analysis
Click → Registration ratio
Registration → FTD ratio
4. Best Card per Campaign
Uses window functions to rank performance

📄 SQL Queries:
👉

📈 Power BI Dashboard

The Power BI dashboard provides interactive insights and answers:

✔ Key Metrics
Total Clicks
Total Registrations
Total FTDs
Total Commission
Total Spend
ROI
✔ Key Visuals
Top Operators by Commission
ROI by Campaign
Conversion Funnel (Clicks → Registrations → FTDs)
Breakdown by Operator and Campaign
✔ Filters
Date range
Operator
Campaign

📁 File: PeakMedia_Dashboard.pbix

🎯 Key Business Insights Enabled

This solution enables answering:

✅ Which operator generated the most commission?
✅ Which campaign delivers the best ROI?
✅ What are the conversion ratios across the funnel?
⚠️ Data Quality Considerations

Several issues were identified and handled:

Mixed date formats
Missing tracking IDs
Negative or inconsistent values
Currency differences across operators
Granularity mismatches between datasets

These were addressed during cleansing and modeling.

🤖 Use of AI Tools

AI tools were used to enhance productivity and documentation quality:

ChatGPT

Used for:

Understanding the raw data and dashboard approach
Writing DAX measures
Structuring the Power BI solution
Drafting and refining documentation
use.ai

Used for:

Querying datasets efficiently
Assisting with documentation generation
Improving clarity and structure of analytical outputs
Run the DDL script to create the warehouse schema
Execute stored procedures to load data
Use SQL queries to validate insights
Open the Power BI file (.pbix) to explore the dashboard
📌 Future Improvements
Add card-level performance visuals in dashboard
Implement automated data validation checks
Introduce incremental refresh in Power BI
Enhance anomaly detection in data pipeline

👤 Author

Gayathri Raghupathy
📄 License

This project is for educational and analytical purposes.
