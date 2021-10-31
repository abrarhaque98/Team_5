--create tables 
CREATE TABLE realGDP(
	observation_date VARCHAR,
	quarter VARCHAR,
	gdpc1 FLOAT,
	_c3 VARCHAR
);
-------------------------------------------
CREATE TABLE inflation(
	location VARCHAR,
	indicator VARCHAR, 
	subject VARCHAR, 
	measure VARCHAR,
	frequency VARCHAR,
	time VARCHAR, 
	value FLOAT, 
	flag_codes VARCHAR
)
-------------------------------------------
CREATE TABLE NYA(
	index VARCHAR, 
	date VARCHAR,
	month VARCHAR, 
	quarter VARCHAR,
	open FLOAT, 
	high FLOAT, 
	low FLOAT, 
	close FLOAT, 
	adj_close FLOAT, 
	volume FLOAT, 
	closeUSD FLOAT,
	_c11 VARCHAR,
	FOREIGN KEY(month) REFERENCES population(month)
);
-------------------------------------------
CREATE TABLE population(
	observation_date VARCHAR, 
	month VARCHAR, 
	LFWA64TTUSM647S FLOAT,
	PRIMARY KEY(month)
);


-------------------------------------------
--left join nya and population
SELECT nya.index, 
	nya.date,
	nya.month, 
	nya.quarter,
	nya.open,
	nya.high,
	nya.low,
	nya.close,
	nya.adj_close,
	nya.volume,
	nya.closeUSD, 
	population.observation_date,
	population.LFWA64TTUSM647S
INTO first_join
FROM nya 
LEFT JOIN population
ON population.month = nya.month;

SELECT * FROM first_join;
