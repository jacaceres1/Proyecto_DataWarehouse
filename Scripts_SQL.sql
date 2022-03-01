SELECT Id AS Id_customer,
       CompanyName,
       ContactName,
       ContactTitle,
       Address,
       City,
       Region,
       ifnull(PostalCode, 'No Asignado') AS PostalCode,
       [replace]([replace](Country, "UK", "United Kingdom"), "USA", "The United States of America") AS Country,
       Phone,
       ifnull(Fax, 'No asignado') AS Fax
  FROM Customer;-- df_employee

SELECT e.Id AS Id_employe,
       e.Lastname,
       e.FirstName,
       e.Title,
       [replace]([replace]([replace]([replace](e.TitleOfCourtesy, "Dr", "Doctor"), "Ms", "Lady"), "Mr", "Mister"), "Mrs", " Missus") AS TitleOfCourtesy,
       e.BirthDate,
       e.HireDate,
       e.Address,
       e.City,
       e.Region,
       e.PostalCode,
       e.Country,
       e.HomePhone,
       e.Extension,
       ifnull(e.Photo, 'No Asignado') AS Photo,
       e.Notes,
       e.PhotoPath
  FROM employee AS e;-- dim location

SELECT ifnull([order].ShipPostalCode, 'No Asignado') AS Id_location,
                [order].ShipAddress AS Address,
                [order].ShipCity AS City,
                [order].ShipRegion  AS Region,
                [replace]([replace]([order].ShipCountry, "UK", "Unit Kingdom"), "USA", "The United States of America") AS Country
  FROM [order];


SELECT Product.Id AS Id_product,
       ProductName,
       category.CategoryName,
       supplier.CompanyName as CompanyName_Supplier,
       product.QuantityPerUnit,
       product.UnitPrice,
       product.UnitsInStock,
       product.UnitsOnOrder,
       product.ReorderLevel,
       product.Discontinued
  FROM product
       INNER JOIN
       category ON product.CategoryId = category.Id
       INNER JOIN
       supplier ON product.SupplierId = supplier.Id;


SELECT Id AS Id_shipper,
       CompanyName,
       Phone
  FROM shipper;

select shippeddate from [order];

SELECT distinct
    strftime('%Y%m%d',[order].ShippedDate ) AS TimeId,
    [order].ShippedDate as fecha,
        strftime('%Y', [order].ShippedDate) AS año,
       strftime('%m', [order].ShippedDate) AS mes,
       strftime('%d', [order].ShippedDate) AS dia,
       case strftime('%w',[order].ShippedDate)
         when '0' then 'Domingo'
         when '1' then 'Lunes'
         when '2' then 'Martes'
         when '3' then 'Miercoles'
         when '4' then 'Jueves'
         when '5' then 'Viernes'
         when '6' then 'Sabado'
       end as nombre_dia,
       strftime('%w', [order].ShippedDate) as dia_semana,
       strftime('%W', [order].ShippedDate) AS semana,
       case 
        when 0 + strftime('%m', [order].ShippedDate) between  1 and  4 then 'Primer Trimestre'
        when 0 + strftime('%m', [order].ShippedDate) between  5 and  8 then 'Segundo Trimestre'
        when 0 + strftime('%m', [order].ShippedDate) between  9 and  12 then 'Tercer Trimestre'
    end as trimestre     
FROM [order] 
where TimeId IS NOT NULL
group by TimeId;

select * from orderdetail;
SELECT DISTINCT OrderDetail.Id AS Id_fact,
       [order].CustomerId AS id_customer,
       [order].ShipVia AS id_shipper,
       strftime('%Y%m%d', [order].ShippedDate) AS id_time,
       OrderDetail.ProductId as id_product,
       [order].Id as Id_location,
       employee.Id as Id_employe,
       [order].Freight,
       OrderDetail.UnitPrice,
       OrderDetail.Quantity,
       OrderDetail.Discount,
       round((((OrderDetail.UnitPrice*OrderDetail.Quantity) * (1-OrderDetail.Discount))/1)+[order].Freight,1) as finalprice
  FROM [order]
  inner join OrderDetail on [order].Id = OrderDetail.OrderId
  inner join employee on [order].EmployeeId = employee.Id;

select * from [order] ;

select distinct * from customer group by Address;

select * from employee;

select id, productName, SupplierId, CategoryId, product.QuantityPerUnit, product.UnitsOnOrder,unitsonOnOrder, ReorderLevel, Discontinued from product;

SELECT product.Id AS Id_product,
       product.ProductName,
       supplier.Id AS Id_supplier,
       category.Id AS Id_Category,
       product.QuantityPerUnit,
       product.UnitPrice,
       product.UnitsInStock,
       product.UnitsOnOrder,
       product.ReorderLevel,
       product.Discontinued
  FROM product
       INNER JOIN
       category ON product.CategoryId = category.Id
       INNER JOIN
       supplier ON product.SupplierId = supplier.Id;


SELECT category.Id AS Id_category,
       category.CategoryName,
       category.Description
  FROM category;

select * from supplier;

SELECT supplier.Id AS Id_supplier,
       supplier.CompanyName,
       supplier.ContactName,
       supplier.ContactTitle,
       supplier.Address,
       supplier.City,
       replace(supplier.Region,"NSW","New South Wales") as Region,
       supplier.PostalCode,
       replace(replace(supplier.Country,"UK","United Kingdom"),"USA","The United States of America") as Country,
       supplier.Phone,
       ifnull(supplier.Fax,'No Asignado') as Fax,
       ifnull(supplier.HomePage,'No asignado') as HomePage
  FROM supplier;
  
select * from category;
