/*
===========================================================
Create Database and Schemas
===========================================================
Script Purpose:
	This script creates a new database named 'data_warehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	with the database: 'bronze', 'silver', and 'gold'.

WARNING:
	Running this script will drop the entire 'data_warehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution and
	ensure you have proper backups before runnig this script.
*/

-- First step
-- Drop and recreate the 'data_warehouse' database
DROP DATABASE IF EXISTS data_warehouse WITH (FORCE);

CREATE DATABASE datawarehouse
  WITH ENCODING 'UTF8'
       TEMPLATE template1;

	   
-- Second step
-- Create Schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;


-- Optional Steps
ALTER DATABASE datawarehouse SET search_path = public, bronze, silver, gold;

GRANT USAGE ON SCHEMA bronze, silver, gold TO sua_role;


	
