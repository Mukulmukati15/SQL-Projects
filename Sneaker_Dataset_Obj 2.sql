use sneaker_sales;

### Objective 2: Customer and Product Analysis


-- 1. What is the average spending per customer?
   
   select sales.CustomerID,FirstName,avg(TotalAmount) as Avg_Spending  
   from sales left join customers on sales.CustomerID = customers.CustomerID
   Group By CustomerID;
   
-- 2. Which product is the most frequently purchased by customers?
    
   select ProductName,sales.ProductID,count(sales.ProductID) as count 
   from sales left join products on sales.ProductID = products.ProductID
   group by sales.ProductID
   order by count desc
   limit 1;
   
-- 3. How many unique customers made purchases in each city?

   select city,count(distinct(sales.customerID)) as unique_customers
   from sales left join customers on sales.CustomerID = customers.CustomerID
   group by city;
   
-- 4. How many products have been purchased from each category?

    select Category,count(sales.ProductID) as Purchased 
    from sales left join products on sales.ProductID = products.ProductID
    group by sales.ProductID;

-- 5. How many customers have purchased more than once from us?

   select  FirstName,sales.CustomerID,count(sales.CustomerID) as repeated_count  
   from sales left join customers on sales.CustomerID = customers.CustomerID
   group by CustomerID 
   having repeated_count > 1;
   
-- 6. What is the average unit price of products purchased by customers?
   
    select Avg(UnitPrice) as AVG_Unit_Price 
    from sales left join products on sales.ProductID = products.ProductID; 

-- 7. How does the spending behavior differ between customers from different states?
   
   select State,Avg(TotalAmount) As Avg_Spending
   from sales left join customers on sales.CustomerID = customers.CustomerID
   group by state;
   
-- 8. Which supplier provides the most popular products?
   
   select SupplierName,count(sales.ProductID) as Total_count 
   from sales left join products on sales.ProductID = products.ProductID
   left join suppliers on products.SupplierID = suppliers.SupplierID
   group by SupplierName
   order by Total_count desc
   limit 1;
   
-- 9. What is the most common product category purchased by customers?

    select Category,count(Sales.ProductID) as count 
    from sales left join products on sales.ProductID = products.ProductID
    group by category
    order by count desc 
    limit 1; 
    
