CREATE DATABASE WalkThisWay;

USE WalkthisWay;

CREATE TABLE Store (
storeId VARCHAR(7),
sName TEXT NOT NULL,
sAddress TEXT,
sPostCode VARCHAR(4),
CONSTRAINT Store_PK PRIMARY KEY(storeId)
);

INSERT INTO Store (storeId, sName, sAddress, sPostCode)
VALUES
('Store01' ,'Shoes Williams', '277 Queen, BrisbaneCity', '1234'),
('Store02', 'Vono', '116 Queen, BrisCity' , '5678');

SELECT * FROM  Store;

CREATE TABLE StoreEmployee (
empId VARCHAR(7),
eName TEXT NOT NULL,
eAddress TEXT,
ePostCode VARCHAR(4),
eEmail TEXT,
eMobph TEXT,
eStarDate TEXT,
storeId VARCHAR(7),
CONSTRAINT StoreEmployee_PK PRIMARY KEY(empId),
CONSTRAINT StoreEmployee_Store_FK FOREIGN KEY (storeId) REFERENCES Store(storeId)
);

INSERT INTO StoreEmployee (empId, eName, eAddress, ePostCode, eEmail, eMobph, eStarDate, storeId)
VALUES
('em1', 'kishore', '71 Gold Coast',  '4567', 'kishore3456@gmail.com' ,'3456-756-446', '23-09-199', 'store01'),
('em2', 'Aswath', '78 Gold Coast', '5674', 'Aswath567@gmail.com', '5678-789-673', '17-10-1999', 'store02');
SELECT * FROM  StoreEmployee;

CREATE TABLE Customer (
CustId VARCHAR(7),
cName TEXT NOT NULL,
cMobilePh TEXT,
cEmail TEXt,
cBirthDate TEXT,
CONSTRAINT Customer_PK PRIMARY KEY (custId)
);
INSERT INTO Customer (CustId, cName, cMobilePh, cEmail , cBirthDate)
VALUES
('Cust1', 'peter', '8960-567-566', 'peter3456@gmail.com' , '23-09-199'),
('Cust2', 'Bose', '56788-543-666', 'Bose@gmail.com', '17-10-1999');
SELECT * FROM  Customer;

CREATE TABLE `Order` (
orderId VARCHAR(7),
oDate TEXT,
total INTEGER,
GST INTEGER,
deliveryAddress TEXT,
orderStatus TEXT,
custId VARCHAR(7),
CONSTRAINT order_PK PRIMARY KEY(orderId),
CONSTRAINT order_Customer_FK FOREIGN KEY (custId) References Customer(CustId)
);
INSERT INTO `order` (orderId, oDate, total, GST, deliveryAddress, orderStatus, custId)
VALUES
('order1','23-05-2023','300','20','03 parkcentral,Brisbanecity','processing','Cust1'),
('order2','15-06-2023','250','30', '04 Taringa,Brisbanecity','shipped','Cust2');
SELECT * FROM  `order`;

CREATE TABLE orderDetail (
orderId VARCHAR(7),
prodId VARCHAR(7),
quantity INTEGER,
retailprice INTEGER,
CONSTRAINT ORDERDETAILS_PK PRIMARY KEY (orderId, prodId),
CONSTRAINT ORDERDETAILS_Order_FK FOREIGN KEY (orderId) REFERENCES `order` (orderId),
CONSTRAINT ORDERDETAILS_product_FK FOREIGN KEY (prodId) REFERENCES product(prodId)
);
INSERT INTO orderDetail (orderId, prodId, quantity, retailprice )
VALUES
('order1','56789','400','45' ),
('order2','7869', '500', '50');
SELECT * FROM  orderDetails;

CREATE TABLE Supplier (
       SupIrId VARCHAR(7),
       supIrName TEXT NOT NULL,
       supIrAddress TEXT,
       supIrPostcode VARCHAR(4),
       supIrEmail TEXT,
       supIrMobph TEXT,
       CONSTRAINT supplier_pk PRIMARY KEY (supirId)
       );
INSERT INTO Supplier (SupIrId, supIrName , supIrAddress ,  supIrPostcode,  supIrEmail, supIrMobph )
VALUES
('suplr1','handmade','456 Thomas street,Taringa','7689','handmade@gmail.com','4567-567-6454' ),
('suplr2','lock', '653 Queen street,Brisbanecity', '4567', 'lock@gmail.com', '3678-786-567');
SELECT * FROM  Supplier;

CREATE TABLE Product(
prodId VARCHAR(7),
size TEXT,
colour TEXT,
style TEXT,
qtyOnHand INTEGER,
reorderQty INTEGER,
retailPrice INTEGER,
supIrId VARCHAR(7),
CONSTRAINT product_PK PRIMARY KEY (prodId),
CONSTRAINT product_Supplier_FK FOREIGN KEY (supIrId) REFERENCES supplier(supIrId)
);

INSERT INTO product (prodId, size , colour , style , qtyOnHand , reorderQty, retailPrice, supIrId)
VALUES
('56789','7','Blue','canvas','200','25', '45','suplr1' ),
('7869','6', 'Black', 'Boat', '250', '35', '50','suplr2');
SELECT * FROM  product;   
CREATE TABLE payment(
payId VARCHAR(7),
type TEXT,
amount INTEGER,
pDate TEXT,
bankTransactNo TEXT,
orderId VARCHAR(7),
CONSTRAINT payment_PK PRIMARY KEY (PayId),
CONSTRAINT Payment_order_FK FOREIGN KEY (orderId) REFERENCES `order`(orderId)
);
INSERT INTO payment (payId, type , amount, pDate ,bankTransactNo , orderId )
VALUES
('pay1','debit','300','12-3-2023','Rfd4567','order1' ),
('pay2','credit', '200', '16-3-2023', 'Rfd7872', 'order2');
SELECT * FROM  payment;   customer
 
CREATE TABLE productSupplier(
prodId VARCHAR(7),
supIrId VARCHAR(7),
CONSTRAINT ProductSupplier_PK PRIMARY KEY (prodId, supIrId),
CONSTRAINT ProductSupplier_product_FK FOREIGN KEY (prodId) REFERENCES product(prodId),
CONSTRAINT ProductSupplier_supplier_FK FOREIGN KEY (supIrId) REFERENCES supplier(supIrId)
);
INSERT INTO productSupplier (prodId, supIrId )
VALUES
('56789','suplr1'),
('7869', 'suplr2');
SELECT * FROM  productSupplier;   







