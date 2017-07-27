DROP TABLE Sales_History_Pro_Temp;
CREATE EXTERNAL TABLE Sales_History_Pro_Temp (TId STRING,Day STRING,Item_Number STRING,Quantity DOUBLE,Item_Ind STRING, Item_Cost DOUBLE, Promotion_level DOUBLE) ROW FORMAT DELIMITED FIELDS TERMINATED BY "\1";
LOAD DATA INPATH '/user/user/case1/sales_history_temp3' INTO TABLE Sales_History_Pro_Temp;

INSERT OVERWRITE DIRECTORY '/user/user/case1/sales_history_temp4' SELECT s.TId,s.Day,s.Item_Cost,s.Promotion_Level FROM Sales_History_Pro_Temp s ;

