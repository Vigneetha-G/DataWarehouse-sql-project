/*
----------------CREATE DATABASE AND SCHEMAS------------------------
This script checks whether the 'DataWarehouse' database already exists, removes it if present, and then creates a fresh version. 
It proceeds to set up three schemas within this database—'bronze', 'silver', and 'gold'.

WARNING: Running the script deletes all existing data in 'DataWarehouse', so be sure a backup is in place before executing it


*/
USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
