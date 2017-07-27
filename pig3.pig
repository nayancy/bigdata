Sales_History_Temp = LOAD 'case1/sales_history_temp2' USING PigStorage(',') AS (TId:chararray, Day:chararray, Item_Number:chararray, Quantity:int, Item_Ind:chararray, Item_Cost2:int);
Sales_History_Temp2 = FILTER Sales_History_Temp BY ($4=='W') ;
Sales_History_Temp2 = FOREACH Sales_History_Temp2 GENERATE '000001',$1,'1000000001',$3,$4,20;
Sales_History_Temp = UNION Sales_History_Temp,Sales_History_Temp2;
STORE Sales_History_Temp into 'case1/sales_history_temp3' USING PigStorage(',');
DUMP Sales_History_Temp;
