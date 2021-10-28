-- create indexInfo table 
CREATE TABLE indexInfo(
	region VARCHAR,
	exchange VARCHAR,
	index VARCHAR,
	currency VARCHAR,
	PRIMARY KEY (index)
);

-- create indexProcessed table 
-- need to change Data column data type to DATE 
CREATE TABLE indexProcessed (
	index VARCHAR, 
	date VARCHAR, 
	open FLOAT,
	high FLOAT,
	low FLOAT,
	close FLOAT,
	adj_close FLOAT,
	volume FLOAT,
	closeUSD FLOAT,
	FOREIGN KEY(index) REFERENCES indexInfo(index)
);


