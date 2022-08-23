/* 
#######################################################################################################################################################################################
Q1)	You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce with the schema definition given below.
#######################################################################################################################################################################################
*/ 

/* create database */
CREATE DATABASE IF NOT EXISTS `order-directory` ;
USE `order-directory`;

/* 
##################################################################################
Create tables for supplier,customer,category,product,supplier_pricing,order,rating 
##################################################################################
*/ 

CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT NOT NULL,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR,
    PRIMARY KEY (CUS_ID)
);

CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT NOT NULL,
    CAT_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT NOT NULL,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT NOT NULL,
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID)
        REFERENCES CATEGORY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT NOT NULL,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID)
        REFERENCES PRODUCT (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES SUPPLIER (SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
    ORD_ID INT NOT NULL,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE,
    CUS_ID INT NOT NULL,
    PRICING_ID INT NOT NULL,
    PRIMARY KEY (ORD_ID),
    FOREIGN KEY (CUS_ID)
        REFERENCES CUSTOMER (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES SUPPLIER_PRICING (PRICING_ID)
);


CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT NOT NULL,
    ORD_ID INT NOT NULL,
    RAT_RATSTARS INT NOT NULL,
    PRIMARY KEY (RAT_ID),
    FOREIGN KEY (ORD_ID)
        REFERENCES `order` (ORD_ID)
);


/*
#########################################################
Q2)	Insert the following data in the table created above
#########################################################
*/

/* 
Insert data in supplier table 
*/
INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

/* 
Insert data in customer table 
*/
INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

/* 
Insert data in category table 
*/
INSERT INTO category VALUES( 1,"BOOKS");
INSERT INTO category VALUES(2,"GAMES");
INSERT INTO category VALUES(3,"GROCERIES");
INSERT INTO category VALUES (4,"ELECTRONICS");
INSERT INTO category VALUES(5,"CLOTHES");

/* 
Insert data in product table 
*/
INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

/* 
Insert data in supplier_pricing table 
*/
INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(2,3,5,30000);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

/* 
Insert data in order table 
*/
INSERT INTO `order` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `order` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `order` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `order` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `order` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `order` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `order` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `order` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `order` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `order` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `order` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `order` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `order` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `order` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `order` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `order` VALUES(116,99,"2021-09-17",2,14);

/* 
Insert data in rating table 
*/
INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5);
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,0);


/* 
###########################################################################################################
Q3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
###########################################################################################################
*/ 

SELECT 
    COUNT(*) AS 'TOTAL CUSTOMERS', cus_gender
FROM
    customer
WHERE
    customer.cus_id IN (SELECT DISTINCT
            (cus_id)
        FROM
            `order`
        WHERE
            ord_amount >= 3000)
GROUP BY cus_gender;

/* 
##############################################################################################
Q4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
##############################################################################################
*/ 

/*
Answer 4.a  [One way]
*/
SELECT 
    product.pro_name, `order`.*
FROM
    `order`,
    supplier_pricing,
    product
WHERE
    `order`.cus_id = 2
        AND `order`.pricing_id = supplier_pricing.pricing_id
        AND supplier_pricing.pro_id = product.pro_id;

/*
Answer 4.b  [Another way]
*/
SELECT 
    product.pro_name, `order`.*
FROM
    `order`
        JOIN
    supplier_pricing ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
        JOIN
    product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE
    CUS_ID = 2;

/*
######################################################################
Q5)	Display the Supplier details who can supply more than one product.
######################################################################
*/

/*
Answer 5.a  [One way]
*/
SELECT 
    supplier.*
FROM
    supplier
WHERE
    SUPP_ID IN (SELECT 
            SUPP_ID
        FROM
            supplier_pricing
        GROUP BY SUPP_ID
        HAVING COUNT(*) > 1);
        
/*
Answer 5.b  [Another way]
*/
SELECT 
    supplier.*
FROM
    supplier_pricing
        INNER JOIN
    supplier ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
GROUP BY supplier_pricing.SUPP_ID
HAVING COUNT(DISTINCT PRO_ID) > 1;


/*
#########################################################################################################################################
Q6) Find the least expensive product from each category and print the table with category id, name, and price of the product
#########################################################################################################################################
*/

/*
Answer 6.a  [One way]
*/
SELECT 
    category.CAT_ID, CAT_NAME, MIN(supplier_pricing.SUPP_PRICE)
FROM
    supplier_pricing
        JOIN
    product ON product.PRO_ID = supplier_pricing.PRO_ID
        JOIN
    category ON category.CAT_ID = product.CAT_ID
GROUP BY product.CAT_ID;

/*
Answer 6.b  [Another way]
*/
SELECT 
    category.cat_id,
    category.cat_name,
    MIN(supplier_pricing.supp_price)
FROM
    product,
    supplier_pricing,
    category
WHERE
    supplier_pricing.pro_id = product.pro_id
        AND category.cat_id = product.cat_id
GROUP BY product.cat_id;


/*
######################################################################
Q7)	Display the Id and Name of the Product ordered after “2021-10-05”.
######################################################################
*/

/*
Answer 7.a  [One way]
*/
SELECT 
    product.PRO_ID AS 'Product ID',
    product.PRO_NAME AS 'Name of the Product'
FROM
    product
        JOIN
    supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
        JOIN
    `order` ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
WHERE
    `order`.ORD_DATE > '2021-10-05';


/*
Answer 7.b  [Another way]
*/
SELECT 
    pr.PRO_ID AS 'Product ID',
    pr.PRO_NAME AS 'Name of the Product'
FROM
    product pr,
    supplier_pricing sp,
    `order` ord
WHERE
    pr.PRO_ID = sp.PRO_ID
        AND sp.PRICING_ID = ord.PRICING_ID
        AND ord.ORD_DATE > '2021-10-05';



/*
#################################################################################
Q8)	Display customer name and gender whose names start or end with character 'A'.
#################################################################################
*/

SELECT 
    customer.cus_name AS 'Customer Name',
    customer.cus_gender AS 'Customer Gender'
FROM
    customer
WHERE
    customer.cus_name LIKE 'A%'
        OR customer.cus_name LIKE '%A';


/*
################################################################################################################################################################
Q9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
################################################################################################################################################################
*/

DELIMITER //

CREATE PROCEDURE getRating()
BEGIN 
	SELECT supplier.SUPP_ID, supplier.SUPP_NAME, avg(RAT_RATSTARS ) as rate, 
CASE 
WHEN avg( RAT_RATSTARS ) = 5 THEN 'Excellent'
WHEN avg( RAT_RATSTARS ) > 4 THEN 'Genuine Supplier'
WHEN avg( RAT_RATSTARS ) > 2 THEN 'Average Service'
ELSE 'Poor Service'
END as typeOfService
FROM supplier INNER JOIN supplier_pricing ON supplier_pricing.SUPP_ID = supplier.SUPP_ID
INNER JOIN `order` ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
INNER JOIN rating ON rating.ORD_ID = `order`.ORD_ID
 GROUP BY supplier.SUPP_ID;
END //

DELIMITER ;

/*
Execute the procedure
*/
CALL getRating();



