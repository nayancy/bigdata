Item_Master = LOAD 'case1/item_master.txt' USING PigStorage(',') AS (Item_Number:chararray, Item_Department:chararray, Item_Ind:chararray, Pack_Ind:int, Pack_Number:chararray, Item_Cost:int) ;
Sales_History = LOAD 'case1/sales_history.txt' USING PigStorage(',') AS (TId:chararray, Day:chararray, Item_Number:chararray, Quantity:int);
Sales_History_Temp = JOIN Sales_History by Item_Number,Item_Master by Item_Number;
Sales_History_Temp = FOREACH Sales_History_Temp GENERATE $0,$1,$2,$3,$6,$7,$8,$9;
STORE Sales_History_Temp into 'case1/sales_history_temp' USING PigStorage(',');
DUMP Sales_History_Temp;
