use sneaker_sales;

### Objective 1: Analyzing Sales Performance

-- 1. What is the total sales amount generated by each sales representative?
   
   select FirstName,sales_reprentative.SalesRepID,sum(TotalAmount) as amount_generated 
   from sales left join sales_reprentative  on sales.SalesRepID=sales_reprentative.SalesRepID
   group by FirstName ;
	
-- 2. How many products have been sold in each store location?
   
   select StoreLocation,count(ProductID) as sold 
   from sales 
   group by StoreLocation;
   
-- 3. Which product category has the highest total sales amount?

    select sales.ProductID,Category,sum(TotalAmount) as total_sales 
    from sales left join products on sales.ProductID = products.ProductID
    group by Category
    order by total_sales desc  limit 1;
   
-- 4. What is the average quantity of products sold per sale?

	select avg(Quantity) from sales;
   
-- 5. Which customer has made the highest number of purchases?

    select Sales.CustomerID,FirstName,count(SaleID) as Purchase_count
    from Sales left join customers on Sales.CustomerID = customers.CustomerID
    group by CustomerID 
    order by Purchase_count desc
    limit 1 ;   
 
 -- 6. What is the distribution of total sales amounts across different Days?

     select extract(day from Date) as Day,Sum(TotalAmount) as Day_Income
     from sales
     group by Day
     order by Day_Income desc ;

-- 7. How does the sales performance of different regions compare?

   select Region,Sum(TotalAmount) as Region_total 
   from sales left join sales_reprentative on sales.SalesRepID = sales_reprentative.SalesRepID
   group by Region
   order by Region_total desc;
   
-- 8. What is the total sales amount generated for each product?
    
    select Products.ProductID,ProductName,sum(TotalAmount) as total_amount 
    from Sales left join Products on Sales.ProductID = Products.ProductID
    group by ProductName;
    
-- 9. What is the average sales amount per User?

    select CustomerID,avg(TotalAmount) as ASAPT from sales
    group by CustomerID ;

-- 10. How many sales transactions were made by each sales representative with Name?

    select FirstName,sales.SalesRepID,count(SaleID) as Transactions_Count 
    from sales left join sales_reprentative on sales.SalesRepID = sales_reprentative.SalesRepID
    group by SalesRepID;
    
