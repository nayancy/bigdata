CREATE EXTERNAL TABLE Sales_History_Temp (TId STRING,Day STRING,Item_Cost INT,Promotion_level INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY "," STORED AS TEXTFILE LOCATION '${INPUT}';

INSERT OVERWRITE DIRECTORY '${OUTPUT}' SELECT Day,sum(Item_Cost) FROM Sales_History_Temp Group By Day;
