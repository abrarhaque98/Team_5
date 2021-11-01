
CREATE TABLE realGDP(
	observation_date VARCHAR,
	quarter VARCHAR,
	gdpc1 FLOAT,
	_c3 VARCHAR,
	PRIMARY KEY(quarter)
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
	flag_codes VARCHAR,
	PRIMARY KEY(time)
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

--number of rows in table 
SELECT COUNT(*) FROM nya; 
SELECT COUNT(*) FROM first_join;

--drop tables 
DROP TABLE nya;
DROP TABLE population;
DROP TABLE realGDP;
DROP TABLE first_join;
DROP TABLE inflation;


--casting observation_date column from string to date data type
SELECT * FROM realGDP;
SELECT observation_date, CAST(observation_date as DATE) as Date FROM realGDP;

--update realGDP
UPDATE realGDP
SET observation_date = CAST(observation_date as DATE)



--joining 
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
	population.LFWA64TTUSM647S,
	realgdp.gdpc1,
	inflation.location,
	inflation.indicator,
	inflation.subject,
	inflation.measure,
	inflation.frequency,
	inflation.value
INTO first_join
FROM nya 
LEFT JOIN population
ON population.month = nya.month
LEFT JOIN realgdp
ON realgdp.quarter = nya.quarter
LEFT JOIN inflation
ON inflation.time = nya.month;

SELECT * FROM first_join;
SELECT * FROM inflation;
SELECT * FROM realGDP;
SELECT * FROM nya;



