/* ============================================================
   PEAKMEDIA DATA WAREHOUSE – DDL SCRIPT
   Author: [Your Name]
   Description: Schema creation for Affiliate Performance Model
   ============================================================ */

---------------------------------------------------------------
-- 1. DROP EXISTING TABLES (IF EXISTS)
---------------------------------------------------------------

DROP TABLE IF EXISTS dbo.fact_campaign_spend;
DROP TABLE IF EXISTS dbo.fact_affiliate_performance;

DROP TABLE IF EXISTS dbo.dim_currency_rate;
DROP TABLE IF EXISTS dbo.dim_currency;
DROP TABLE IF EXISTS dbo.dim_card;
DROP TABLE IF EXISTS dbo.dim_campaign;
DROP TABLE IF EXISTS dbo.dim_operator;

---------------------------------------------------------------
-- 2. DIMENSION TABLES
---------------------------------------------------------------

-- DIM_OPERATOR
CREATE TABLE dbo.dim_operator
(
    operator_id     INT PRIMARY KEY,
    operator_name   VARCHAR(100)
);

---------------------------------------------------------------

-- DIM_CAMPAIGN
CREATE TABLE dbo.dim_campaign
(
    campaign_id     VARCHAR(10) PRIMARY KEY,
    campaign_name   VARCHAR(200)
);

---------------------------------------------------------------

-- DIM_CARD
CREATE TABLE dbo.dim_card
(
    card_id         INT PRIMARY KEY,
    operator_name   VARCHAR(30)
);

---------------------------------------------------------------

-- DIM_CURRENCY
CREATE TABLE dbo.dim_currency
(
    currency_id     INT PRIMARY KEY,
    currency        VARCHAR(3)
);

---------------------------------------------------------------

-- DIM_CURRENCY_RATE
CREATE TABLE dbo.dim_currency_rate
(
    currency_code    VARCHAR(3),
    fx_date          DATE,
    conversion_rate  DECIMAL(18,6),
    base_currency    VARCHAR(3),

    PRIMARY KEY (currency_code, fx_date)
);

---------------------------------------------------------------
-- 3. FACT TABLES
---------------------------------------------------------------

-- FACT_AFFILIATE_PERFORMANCE
CREATE TABLE dbo.fact_affiliate_performance
(
    [date]               DATE,
    [tracking_id]        VARCHAR(100),
    [operator_id]        INT,
    [registrations]      INT,
    [ftds]               INT,
    [total_commission]   DECIMAL(18,2),
    [currency_id]        INT,
    [card_id]            INT,
    [campaign_id]        INT
);

---------------------------------------------------------------

-- FACT_CAMPAIGN_SPEND
CREATE TABLE dbo.fact_campaign_spend
(
    [date]            DATE,
    [campaign_id]     INT,
    [impressions]     INT,
    [clicks]          INT,
    [inbounds]        INT,
    [outbounds]       INT,
    [spend_gbp]       DECIMAL(18,2)
);

---------------------------------------------------------------
-- 4. (OPTIONAL) FOREIGN KEY RELATIONSHIPS
-- Uncomment if your environment supports FK constraints
---------------------------------------------------------------

/*
ALTER TABLE dbo.fact_affiliate_performance
ADD CONSTRAINT fk_operator
FOREIGN KEY (operator_id) REFERENCES dbo.dim_operator(operator_id);

ALTER TABLE dbo.fact_affiliate_performance
ADD CONSTRAINT fk_currency
FOREIGN KEY (currency_id) REFERENCES dbo.dim_currency(currency_id);

ALTER TABLE dbo.fact_affiliate_performance
ADD CONSTRAINT fk_card
FOREIGN KEY (card_id) REFERENCES dbo.dim_card(card_id);

ALTER TABLE dbo.fact_affiliate_performance
ADD CONSTRAINT fk_campaign
FOREIGN KEY (campaign_id) REFERENCES dbo.dim_campaign(campaign_id);

ALTER TABLE dbo.fact_campaign_spend
ADD CONSTRAINT fk_campaign_spend
FOREIGN KEY (campaign_id) REFERENCES dbo.dim_campaign(campaign_id);
*/
