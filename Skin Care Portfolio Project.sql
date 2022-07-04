SELECT *
 FROM SkinCare

SELECT Label, Brand, Name, Price
 FROM SkinCare

SELECT Label, Brand, Name, Price
 FROM SkinCare
    ORDER BY Brand, Price

SELECT Label, Brand, Name, Price
 FROM SkinCare
    WHERE Price <= 50
    ORDER BY Brand,Price
-- Products under $50.00 (Considered more affordable products) 

SELECT Label, Brand, Name, Price
 FROM SkinCare
    WHERE Price >=75
    ORDER BY Brand, Price 
-- Products over $75.00 (Considered more expensive products) 

SELECT Brand, MAX(Price) as Most_Expensive_Product_From_Brand
 FROM SkinCare
    GROUP BY Brand
    ORDER BY Brand
-- Find the highest price from each brand 

SELECT Brand,Name, Price as Most_Expensive_Item_From_Brand, Rank
 FROM (
   SELECT Brand, Name, Price, Rank, CASE WHEN Price = MAX(Price) OVER(PARTITION BY Brand ORDER BY (Select 1)) THEN 'Take' ELSE 'Leave' END AS Pickup 
   FROM SkinCare

 ) X WHERE Pickup = 'Take' ORDER BY Brand
 -- Most expensive product from each brand showing the rank of each product 

 SELECT Brand,Name, Price as Least_Expensive_Item_From_Brand, Rank
 FROM 
 (
   SELECT Brand, Name, Price, Rank, CASE WHEN Price = MIN(Price) OVER(PARTITION BY Brand ORDER BY (Select 1)) THEN 'Take' ELSE 'Leave' END AS Pickup 
   FROM SkinCare
 ) 
 X WHERE Pickup = 'Take' ORDER BY Brand
 -- Least expensive product from each brand showing the rank of each product 

SELECT TOP 100 Brand, Name, Ingredients, Combination as Combination_Skin_Type, Dry as Dry_Skin_Type, Normal as Normal_Skin_Type, Oily as Oily_Skin_Type, Sensitive as Sensitive_Skin_Care, Price, Rank
 FROM (
    SELECT Brand, Name, Ingredients, Combination, Dry, Normal, Oily, Sensitive, Price, Rank, CASE WHEN Price = MAX(Price) OVER(PARTITION BY Brand ORDER BY (Select Price)) THEN 'Take' ELSE 'Leave' END AS Pickup 
    FROM SkinCare
 ) 
 X WHERE Pickup = 'Take' ORDER BY Price DESC 
 -- Top 100 most expensive products and which skin type they accommodate
 
