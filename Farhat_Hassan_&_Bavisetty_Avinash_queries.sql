CREATE DATABASE Farhat_Hassan_And_Bavisetty_Avinash_db;

USE Farhat_Hassan_And_Bavisetty_Avinash_db;

CREATE TABLE Category (
	CategoryID				int				NOT NULL auto_increment,
    CategoryName			Char(50)		NULL,
    CONSTRAINT	CategoryPK	PRIMARY KEY (CategoryID)
);

CREATE TABLE Product (
	ProductID				int				NOT NULL auto_increment,
    CategoryID				int				NOT NULL,
    Brand					Char(50)		NULL,
    ProductName				Char(75)		NULL,
    UnitPrice				int				NULL,
    CONSTRAINT	ProductPK	PRIMARY KEY (ProductID),
    CONSTRAINT 	Product_CategoryFK	FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION
);

CREATE TABLE Customer (
	CustomerID				int				NOT NULL auto_increment,
    FirstName				Char(50)		NULL,
    LastName				Char(50)		NULL,
    PhoneNumber				VARCHAR(15)		NULL,
	CONSTRAINT	CustomerPK	PRIMARY KEY (CustomerID)
);

CREATE TABLE TheOrder (
	OrderID					int				NOT NULL auto_increment,
    CustomerID				int				NOT NULL,
    OrderDate				date			NULL,
    DeliveryStatus			int				NULL,
    CONSTRAINT	OrderPK		PRIMARY KEY (OrderID),
    CONSTRAINT 	Order_CustomerFK	FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION
);

CREATE TABLE Transaction (
	TransactionID			int				NOT NULL auto_increment,
    ProductID				int 			NOT NULL,
    Transaction				Char(50)		NULL,
    Quantity				int				NULL,
    TransactionDate			date			NULL,
    CONSTRAINT	TransactionPK	PRIMARY KEY (TransactionID),
    CONSTRAINT	Transaction_ProductFK	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
											ON UPDATE NO ACTION
											ON DELETE NO ACTION
);

CREATE TABLE Warranty (
	WarrantyID				int				NOT NULL auto_increment,
    ProductID				int				NOT NULL,
    StartDate				Date			NULL,
    EndDate					Date			NULL,
    CONSTRAINT	WarrantyPK	PRIMARY KEY (WarrantyID),
    CONSTRAINT	Warranty_ProductFK	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION
);

CREATE TABLE Feedback (
	FeedbackID				int				NOT NULL auto_increment,
    CustomerID				int				NOT NULL,
    ProductID				int 			NOT NULL,
    Rating					int				NULL,
    Comment					text			NULL,
    CONSTRAINT	FeedbackPK	PRIMARY KEY (FeedbackID),
	CONSTRAINT 	Feedback_CustomerFK	FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
	CONSTRAINT Feedback_ProductFK	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION
);

CREATE TABLE Compatibility (
	CompatibilityID			int				NOT NULL auto_increment,
    ProductID				int				NOT NULL,
    CONSTRAINT CompatibilityPK	PRIMARY KEY (CompatibilityID),
	CONSTRAINT Compatibility_ProductFK	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
											ON UPDATE NO ACTION
											ON DELETE NO ACTION
);

CREATE TABLE Notification (
	NotificationID			int				NOT NULL auto_increment,
    CustomerID				int				NOT NULL,
    Message					Text			NULL,
    Date					Date			NULL,
    CONSTRAINT Notification_CustomerFK	FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
											ON UPDATE NO ACTION
											ON DELETE NO ACTION,
    CONSTRAINT NotificationPK	PRIMARY KEY (NotificationID, CustomerID)
);

CREATE TABLE Payment (
	PaymentID				int				NOT NULL auto_increment,
    OrderID					int				NOT NULL,
    TransactionID			int				NOT NULL,
    Amount					int				NULL,
    PaymentDate				date			NULL,
    CONSTRAINT	Payment_OrderFK	FOREIGN KEY (OrderID) REFERENCES TheOrder (OrderID)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION,
	CONSTRAINT Payment_TransactionFK FOREIGN KEY (TransactionID) REFERENCES Transaction (TransactionID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
	CONSTRAINT PaymentPK	PRIMARY KEY (PaymentID, OrderID, TransactionID)
);

CREATE TABLE Supplier (
	SupplierID				int				NOT NULL auto_increment,
    ProductID				int				NOT NULL,
    SupplierName			Char(50)		NULL,
    ContactFirstName		Char(50)		NULL,
    ContactLastName			Char(50)		NULL,
    ContactNumber			VARCHAR(15)		NULL,
	CONSTRAINT Supplier_ProductFK	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
	CONSTRAINT SupplierPK	PRIMARY KEY (SupplierID, ProductID)
);

CREATE TABLE Inventory (
	InventoryID 			int				NOT NULL auto_increment,
    ProductID				int				NOT NULL,
    SupplierID				int				NOT NULL,
    Quantity				int				NULL,
	PurchaseDate			date			NULL,
    CONSTRAINT InventoryPK	PRIMARY KEY	(InventoryID),
	CONSTRAINT Inventory_ProductFK	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
	CONSTRAINT Inventory_SupplierFK	FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION
);

CREATE TABLE Location (
	LocationID				int				NOT NULL auto_increment,
    InventoryID				int 			NOT NULL,
    LocationName			Char(50)		NULL,
    Address					VARCHAR(50)		NULL,
    CONSTRAINT Location_InventoryFK	FOREIGN KEY (InventoryID) REFERENCES Inventory (InventoryID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
	CONSTRAINT LocationPK	PRIMARY KEY (LocationID, InventoryID)
);

CREATE TABLE OfferItem (
	OfferID					int				NOT NULL auto_increment,
    ProductID				int				NOT NULL,
    OfferInfo				text			NULL,
    CONSTRAINT OfferItemPK	PRIMARY KEY (OfferID),
	CONSTRAINT OfferItem_ProductFK	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION
);

CREATE TABLE Promotion (
	PromotionID				int				NOT NULL auto_increment,
    OfferID					int				NOT NULL,
    PromotionInfo			text			NULL,
    PromotionDiscount		decimal			NULL,
    CONSTRAINT Promotion_OfferFK	FOREIGN KEY (OfferID) REFERENCES OfferItem (OfferID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
	CONSTRAINT PromotionPK	PRIMARY KEY (PromotionID, OfferID)
);
-- *************************************************************************************************************************************


-- Scenarios 
-- i) Add Product
DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_CategoryID INT,
    IN p_Brand CHAR(25),
    IN p_ProductName CHAR(25)
)
BEGIN
    INSERT INTO Product (CategoryID, Brand, ProductName)
    VALUES (p_CategoryID, p_Brand, p_ProductName);
END //
DELIMITER ;

-- ii) Place Order
DELIMITER //
CREATE PROCEDURE PlaceOrder(
    IN p_CustomerID INT,
    IN p_OrderDate DATE,
    IN p_DeliveryStatus INT
)
BEGIN
    INSERT INTO TheOrder (CustomerID, OrderDate, DeliveryStatus)
    VALUES (p_CustomerID, p_OrderDate, p_DeliveryStatus);
END //
DELIMITER ;

-- iii) Track Inventory
DELIMITER //
CREATE TRIGGER TrackInventory AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET Quantity = Quantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //
DELIMITER ;

-- iv) Process Transactions
-- Assuming transaction types are 'purchase' and 'sale'
DELIMITER //
CREATE PROCEDURE ProcessTransaction(
    IN p_ProductID INT,
    IN p_TransactionType CHAR(50),
    IN p_Quantity INT,
    IN p_TransactionDate DATE
)
BEGIN
    IF p_TransactionType = 'purchase' THEN
        INSERT INTO Transaction (ProductID, Transaction, Quantity, TransactionDate)
        VALUES (p_ProductID, p_TransactionType, p_Quantity, p_TransactionDate);
    ELSEIF p_TransactionType = 'sale' THEN
        INSERT INTO Transaction (ProductID, Transaction, Quantity, TransactionDate)
        VALUES (p_ProductID, p_TransactionType, -p_Quantity, p_TransactionDate);
    END IF;
END //
DELIMITER ;

-- v) Generate Reports
-- Sales Report
SELECT Product.ProductID, Product.ProductName, SUM(Transaction.Quantity) AS TotalSales
FROM Product
LEFT JOIN Transaction ON Product.ProductID = Transaction.ProductID
WHERE Transaction.Transaction = 'sale'
GROUP BY Product.ProductID, Product.ProductName
ORDER BY TotalSales DESC;

-- Stock Levels Report
SELECT Product.ProductID, Product.ProductName, Inventory.Quantity AS StockLevel
FROM Product
INNER JOIN Inventory ON Product.ProductID = Inventory.ProductID;

-- Transaction History Report
SELECT *
FROM Transaction;

-- vi) Manage Warranties
-- Assuming that managing warranties involves tracking and querying them
SELECT *
FROM Warranty;

-- vii) Customer Feedback
-- Assuming that managing feedback involves tracking and querying it
SELECT *
FROM Feedback;

-- Analytical Queries
-- i) Top Selling Products
-- See above or create a new one (still thinking of what to do here)

-- ii) Inventory Value
SELECT SUM(Product.UnitPrice * Inventory.Quantity) AS InventoryValue
FROM Product
INNER JOIN Inventory ON Product.ProductID = Inventory.ProductID;

-- iii) Supplier Performance
-- Assuming performance is based on the number of products supplied
SELECT Supplier.SupplierID, Supplier.SupplierName, COUNT(Inventory.ProductID) AS TotalProductsSupplied
FROM Supplier
INNER JOIN Inventory ON Supplier.ProductID = Inventory.ProductID
GROUP BY Supplier.SupplierID, Supplier.SupplierName
ORDER BY TotalProductsSupplied DESC;

-- iv) Product Compatibility
-- Assuming compatibility is defined in Compatibility table
SELECT Product.ProductID, Product.ProductName, COUNT(Compatibility.CompatibilityID) AS TotalCompatibleProducts
FROM Product
LEFT JOIN Compatibility ON Product.ProductID = Compatibility.ProductID
GROUP BY Product.ProductID, Product.ProductName
ORDER BY TotalCompatibleProducts DESC;

-- v) Customer Purchase History
-- Assuming CustomerID is unknown, if it is known, we add WHERE clause at end of this query.
SELECT TheOrder.OrderID, TheOrder.OrderDate, Product.ProductID, Product.ProductName, Transaction.Quantity
FROM TheOrder
INNER JOIN Transaction ON TheOrder.OrderID = Transaction.OrderID
INNER JOIN Product ON Transaction.ProductID = Product.ProductID;
