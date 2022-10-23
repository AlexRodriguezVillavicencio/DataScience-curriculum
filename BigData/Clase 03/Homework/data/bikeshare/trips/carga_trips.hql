CREATE EXTERNAL TABLE trips(
	bikeid INT,
	checkout_time STRING,
	duration_minutes INT,
	end_station_id INT,
	end_station_name STRING,
	month INT,
	start_station_id INT,
	start_station_name STRING,
	start_time TIMESTAMP,
	subscriber_type STRING,
	trip_id BIGINT,
	year INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/instructor/data/bikeshare/trips/'
TBLPROPERTIES(
    'skip.header.line.count'='1'
);