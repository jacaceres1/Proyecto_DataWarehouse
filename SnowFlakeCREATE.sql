CREATE TABLE dim_product (
    Id_product              INTEGER        PRIMARY KEY,
    ProductName     VARCHAR (8000),
    Id_supplier integer,
    Id_category integer,
    QuantityPerUnit VARCHAR (8000),
    UnitPrice       DECIMAL        NOT NULL,
    UnitsInStock    INTEGER        NOT NULL,
    UnitsOnOrder    INTEGER        NOT NULL,
    ReorderLevel    INTEGER        NOT NULL,
    Discontinued    INTEGER        NOT NULL,
    FOREIGN KEY (
        Id_supplier
    )
    REFERENCES dim_supplier (Id_supplier) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,
    FOREIGN KEY (
        Id_category
    )
    REFERENCES dim_category (Id_category) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION
);

CREATE TABLE dim_category (
    Id_category           INTEGER        PRIMARY KEY,
    CategoryName VARCHAR (8000),
    Description  VARCHAR (8000) 
);

CREATE TABLE dim_supplier (
    Id_supplier           INTEGER        PRIMARY KEY,
    CompanyName  VARCHAR (8000),
    ContactName  VARCHAR (8000),
    ContactTitle VARCHAR (8000),
    Address      VARCHAR (8000),
    City         VARCHAR (8000),
    Region       VARCHAR (8000),
    PostalCode   VARCHAR (8000),
    Country      VARCHAR (8000),
    Phone        VARCHAR (8000),
    Fax          VARCHAR (8000),
    HomePage     VARCHAR (8000) 
);

CREATE TABLE dim_location (
    Id_location              INTEGER        PRIMARY KEY autoincrement  not null ,
    Address   varchar(60) NOT NULL,
    City       varchar(60) NOT NULL,
    Region      varchar(60) NOT NULL,
    PostalCode varchar(60) NOT NULL,
    Country    varchar(60) NOT NULL
    
);

CREATE TABLE dim_Time (
    TimeId      VARCHAR (200)       NOT NULL
                             PRIMARY KEY,
    fecha      DATE          NOT NULL,
    año        INTEGER       NOT NULL,
    mes        INTEGER       NOT NULL,
    dia        INTEGER       NOT NULL,
    nombre_dia NVARCHAR (50) NOT NULL,
    dia_semana INTEGER       NOT NULL,
    semana     INTEGER       NOT NULL,
    trimestre  NVARCHAR (50) NOT NULL
);

CREATE TABLE dim_shipper (
    Id_shipper           VARCHAR (8000) PRIMARY KEY,
    CompanyName  VARCHAR (200),
    Phone        VARCHAR (200)
);

CREATE TABLE dim_customer (
    Id_customer           VARCHAR (8000) PRIMARY KEY,
    CompanyName  VARCHAR (200),
    ContactName  VARCHAR (200),
    ContactTitle VARCHAR (200),
    Address      VARCHAR (200),
    City         VARCHAR (200),
    Region       VARCHAR (200),
    PostalCode   VARCHAR (200),
    Country      VARCHAR (200),
    Phone        VARCHAR (200),
    Fax          VARCHAR (200) 
);

CREATE TABLE dim_region (
    Id_region                INTEGER        PRIMARY KEY,
    RegionDescription VARCHAR (8000) 
);

CREATE TABLE dim_employee (
    Id_employe              INTEGER        PRIMARY KEY,
    LastName        VARCHAR (8000),
    FirstName       VARCHAR (8000),
    Title           VARCHAR (8000),
    TitleOfCourtesy VARCHAR (8000),
    BirthDate       VARCHAR (8000),
    HireDate        VARCHAR (8000),
    Address         VARCHAR (8000),
    City            VARCHAR (8000),
    Region          VARCHAR (8000),
    PostalCode      VARCHAR (8000),
    Country         VARCHAR (8000),
    HomePhone       VARCHAR (8000),
    Extension       VARCHAR (8000),
    Photo           BLOB,
    Notes           VARCHAR (8000),
    PhotoPath       VARCHAR (8000)   
);

create table fact_sales (
    Id_fact varchar(8000) primary key  not null,
    id_customer  VARCHAR (8000),
    id_shipper  VARCHAR (8000),
    id_time      VARCHAR (200),
    Id_product   INTEGER,
    Id_location  INTEGER,
    Id_employe   INTEGER,
    Freight      DECIMAL        NOT NULL,
    Unitprice decimal no null,
    quantity integer not null,
    discount double not null,
    finalprice decimal,
    FOREIGN KEY (
        id_customer
    )
    REFERENCES dim_customer (id_customer) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,
    FOREIGN KEY (
        id_shipper
    )
    REFERENCES dim_shipper (id_shipper) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,
     FOREIGN KEY (
        id_time
    )
    REFERENCES dim_time (id_time) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION, 
     FOREIGN KEY (
        Id_product
    )
    REFERENCES dim_product (Id_product) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,                                                                  
    FOREIGN KEY (
        Id_location
    )
    REFERENCES dim_location (Id_location) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION, 
    FOREIGN KEY (
        Id_employe
    )
    REFERENCES dim_employee (Id_employe) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION                                       
);
