use sneaker_sales;

### Objective 3: Supplier and Product Performance

-- 1. What is the total sales amount for each supplier?

   select SupplierName,suppliers.SupplierID,sum(TotalAmount ) as Supplier_amount
   from sales left join products on Sales.ProductID = products.ProductID 
   left join suppliers on products.SupplierID = Suppliers.SupplierID
   group by suppliers.SupplierID;
   
-- 2. Which supplier has the highest average unit price for their products?

    select SupplierName,Avg(UnitPrice) as Avg_unit_price 
    from products left join suppliers on products.SupplierID = Suppliers.SupplierID
    group by SupplierName
    order by Avg_unit_price desc
    limit 1;

-- 3. How many different products are provided by each supplier?

    select SupplierName,count(distinct(ProductName)) as unique_count 
    from products left join suppliers on products.SupplierID = Suppliers.SupplierID
    group by SupplierName;

-- 4. What is the average total sales amount for products supplied by each supplier?

   select SupplierName,suppliers.SupplierID,avg(TotalAmount ) as avg_Supplier_amount
   from sales left join products on Sales.ProductID = products.ProductID 
   left join suppliers on products.SupplierID = Suppliers.SupplierID
   group by suppliers.SupplierID;

-- 5. Which supplier's products have the highest total sales quantity?

   select SupplierName,suppliers.SupplierID,sum(TotalAmount ) as total_Supplier_amount
   from sales left join products on Sales.ProductID = products.ProductID 
   left join suppliers on products.SupplierID = Suppliers.SupplierID
   group by suppliers.SupplierID
   order by total_Supplier_amount desc
   limit 1;
   
-- 6. What is the most common category of products supplied by each supplier?

    select  SupplierName,Category,count(*) as category_count
    from products left join suppliers on products.SupplierID = Suppliers.SupplierID
    group by SupplierName,Category 
    order by category_count desc;
    
-- 7. How does the performance of products from different suppliers compare?

   select SupplierName,suppliers.SupplierID,sum(TotalAmount ) as total_Supplier_amount,sum(Quantity) as Quantity
   from sales left join products on Sales.ProductID = products.ProductID 
   left join suppliers on products.SupplierID = Suppliers.SupplierID
   group by suppliers.SupplierID,Quantity
   order by total_Supplier_amount desc;
   


   