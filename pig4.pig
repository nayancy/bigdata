Sales_History_Temp = LOAD 'case1/sales_history_temp3' USING PigStorage(',') AS (TId:chararray, Day:chararray, Item_Number:chararray, Quantity:int, Item_Ind:chararray, Item_Cost:int);
Promotion_Level = LOAD 'case1/promotion.txt' USING PigStorage(',') AS (Day:chararray,Promotion_level:int);
Sales_History_Temp = JOIN Sales_History_Temp by Day LEFT, Promotion_Level by Day;
Sales_History_Temp = FOREACH Sales_History_Temp GENERATE $0,$1,$3*$5*(100-$7),$7;
STORE Sales_History_Temp into 'case1/sales_history_temp4' USING PigStorage(',');
DUMP Sales_History_Temp;
