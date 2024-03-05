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


--  ************************************************************************************************************************************


-- Data to enter into the tables 
-- Inserting more data into Category table
INSERT INTO Category (CategoryName) VALUES 
('Processors'),
('Graphics Cards'),
('Memory (RAM)'),
('Storage'),
('Motherboards'),
('Power Supplies'),
('Computer Cases'),
('Cooling Systems'),
('Peripherals');

-- Processors
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(1, 'Intel', 'Core i3-10100 Processor', 120),
(1, 'Intel', 'Core i5-10400 Processor', 200),
(1, 'Intel', 'Core i5-10600K Processor', 300),
(1, 'Intel', 'Core i7-10700F Processor', 350),
(1, 'Intel', 'Core i7-10700K Processor', 400),
(1, 'Intel', 'Core i9-10900 Processor', 450),
(1, 'Intel', 'Core i9-10900K Processor', 500),
(1, 'Intel', 'Core i3-11100F Processor', 150),
(1, 'Intel', 'Core i5-11400 Processor', 250),
(1, 'Intel', 'Core i5-11600K Processor', 350),
(1, 'Intel', 'Core i7-11700K Processor', 350),
(1, 'Intel', 'Core i7-11700KF Processor', 400),
(1, 'Intel', 'Core i9-11900 Processor', 450),
(1, 'Intel', 'Core i9-11900K Processor', 500),
(1, 'Intel', 'Core i3-12100 Processor', 150),
(1, 'Intel', 'Core i5-12400 Processor', 250),
(1, 'Intel', 'Core i5-12600K Processor', 350),
(1, 'Intel', 'Core i7-12700K Processor', 350),
(1, 'Intel', 'Core i7-12700KF Processor', 400),
(1, 'Intel', 'Core i9-12900 Processor', 450),
(1, 'Intel', 'Core i9-12900K Processor', 500),
(1, 'Intel', 'Pentium Gold G6400 Processor', 70),
(1, 'Intel', 'Pentium Gold G6600 Processor', 70),
(1, 'Intel', 'Pentium Gold G6405T Processor', 70),
(1, 'AMD', 'Athlon 3200G Processor', 70),
(1, 'AMD', 'Athlon 3300G Processor', 70),
(1, 'AMD', 'Athlon 3400G Processor', 70),
(1, 'AMD', 'Athlon 3500G Processor', 70),
(1, 'AMD', 'Athlon 3600G Processor', 70),
(1, 'AMD', 'Athlon 3700G Processor', 70),
(1, 'AMD', 'Athlon 3800G Processor', 70),
(1, 'AMD', 'Athlon 3900G Processor', 70),
(1, 'AMD', 'Athlon 4000G Processor', 70),
(1, 'AMD', 'Athlon 4100G Processor', 70),
(1, 'AMD', 'Athlon 4200G Processor', 70),
(1, 'AMD', 'Athlon 4300G Processor', 70),
(1, 'AMD', 'Athlon 4400G Processor', 70),
(1, 'AMD', 'Athlon 4500G Processor', 70),
(1, 'AMD', 'Athlon 4600G Processor', 70),
(1, 'AMD', 'Athlon 4700G Processor', 70),
(1, 'AMD', 'Athlon 4800G Processor', 70),
(1, 'AMD', 'Athlon 4900G Processor', 70),
(1, 'AMD', 'Athlon 5000G Processor', 70),
(1, 'AMD', 'Athlon 5100G Processor', 70),
(1, 'AMD', 'Athlon 5200G Processor', 70),
(1, 'AMD', 'Athlon 5300G Processor', 70),
(1, 'AMD', 'Athlon 5400G Processor', 70),
(1, 'AMD', 'Athlon 5500G Processor', 70),
(1, 'AMD', 'Ryzen 3 3100 Processor', 150),
(1, 'AMD', 'Ryzen 3 3300X Processor', 150),
(1, 'AMD', 'Ryzen 5 3600 Processor', 250),
(1, 'AMD', 'Ryzen 5 3600X Processor', 250),
(1, 'AMD', 'Ryzen 5 5600G Processor', 250),
(1, 'AMD', 'Ryzen 5 5600X Processor', 250),
(1, 'AMD', 'Ryzen 7 3700X Processor', 350),
(1, 'AMD', 'Ryzen 7 5800X Processor', 350),
(1, 'AMD', 'Ryzen 9 3900X Processor', 450),
(1, 'AMD', 'Ryzen 9 3900XT Processor', 450),
(1, 'AMD', 'Ryzen 9 5900X Processor', 800),
(1, 'AMD', 'Ryzen 9 5950X Processor', 800),
(1, 'AMD', 'Ryzen Threadripper 3960X Processor', 800),
(1, 'AMD', 'Ryzen Threadripper 3970X Processor', 800),
(1, 'AMD', 'Ryzen Threadripper 3990X Processor', 800),
(1, 'AMD', 'Ryzen 5 4500U Processor', 150),
(1, 'AMD', 'Ryzen 5 4600H Processor', 150),
(1, 'AMD', 'Ryzen 7 4700U Processor', 250),
(1, 'AMD', 'Ryzen 7 4800H Processor', 250),
(1, 'AMD', 'Ryzen 9 4900HS Processor', 450),
(1, 'AMD', 'Ryzen 9 5900HS Processor', 800),
(1, 'AMD', 'Ryzen 9 5980HS Processor', 800),
(1, 'AMD', 'Ryzen 9 5950X Processor', 800);

-- Graphics Cards
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(2, 'AMD', 'Radeon RX 6800 XT', 800),
(2, 'AMD', 'Radeon RX 6800', 700),
(2, 'AMD', 'Radeon RX 6700 XT', 600),
(2, 'AMD', 'Radeon RX 6600 XT', 600),
(2, 'AMD', 'Radeon RX 6600', 500),
(2, 'AMD', 'Radeon RX 6500 XT', 400),
(2, 'AMD', 'Radeon RX 6400 XT', 300),
(2, 'AMD', 'Radeon RX 5900 XT', 800),
(2, 'AMD', 'Radeon RX 5800 XT', 800),
(2, 'AMD', 'Radeon RX 5700 XT', 600),
(2, 'AMD', 'Radeon RX 5700', 500),
(2, 'AMD', 'Radeon RX 5600 XT', 400),
(2, 'AMD', 'Radeon RX 5600', 300),
(2, 'AMD', 'Radeon RX 5500 XT', 300),
(2, 'AMD', 'Radeon RX 5500', 200),
(2, 'AMD', 'Radeon RX 5400 XT', 200),
(2, 'AMD', 'Radeon RX 5300 XT', 200),
(2, 'AMD', 'Radeon RX 5300', 100),
(2, 'AMD', 'Radeon RX 5200 XT', 100),
(2, 'AMD', 'Radeon RX 5200', 100),
(2, 'NVIDIA', 'GeForce RTX 3090', 800),
(2, 'NVIDIA', 'GeForce RTX 3080', 800),
(2, 'NVIDIA', 'GeForce RTX 3070 Ti', 700),
(2, 'NVIDIA', 'GeForce RTX 3070', 600),
(2, 'NVIDIA', 'GeForce RTX 3060 Ti', 500),
(2, 'NVIDIA', 'GeForce RTX 3060', 400),
(2, 'NVIDIA', 'GeForce GTX 1660 Ti', 300),
(2, 'NVIDIA', 'GeForce GTX 1660 Super', 300),
(2, 'NVIDIA', 'GeForce GTX 1660', 200),
(2, 'NVIDIA', 'GeForce GTX 1650 Ti', 200),
(2, 'NVIDIA', 'GeForce GTX 1650 Super', 200),
(2, 'NVIDIA', 'GeForce GTX 1650', 100),
(2, 'NVIDIA', 'GeForce GT 1030', 100),
(2, 'NVIDIA', 'GeForce GT 730', 100),
(2, 'NVIDIA', 'GeForce MX450', 100),
(2, 'NVIDIA', 'GeForce MX350', 100),
(2, 'NVIDIA', 'GeForce MX330', 100),
(2, 'NVIDIA', 'GeForce MX250', 100),
(2, 'NVIDIA', 'GeForce MX150', 100),
(2, 'NVIDIA', 'GeForce GTX 1080 Ti', 800);

-- Memory (RAM)
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(3, 'Crucial', 'Ballistix 8GB DDR4 RAM', 105),
(3, 'HyperX', 'FURY 16GB DDR4 RAM', 80),
(3, 'Teamgroup', 'T-Force Vulcan Z 32GB DDR4 RAM', 70),
(3, 'ADATA', 'XPG Spectrix D50 64GB DDR4 RAM', 90),
(3, 'Corsair', 'Vengeance LPX 8GB DDR4 RAM', 50),
(3, 'G.SKILL', 'Ripjaws V Series 16GB DDR4 RAM', 60);

-- Storage
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(4, 'Samsung', '980 PRO 500GB NVMe SSD', 100),
(4, 'Western Digital', 'WD Blue SN750 1TB NVMe SSD', 110),
(4, 'Crucial', 'MX500 2TB SATA SSD', 135),
(4, 'Seagate', 'FireCuda 2TB SSHD', 150),
(4, 'Intel', '660p Series 1TB QLC NVMe SSD', 120),
(4, 'Sabrent', 'Rocket 4 Plus 2TB NVMe SSD', 210);

-- Motherboards
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(5, 'ASUS', 'TUF Gaming B560M-Plus Motherboard', 100),
(5, 'ASRock', 'H510M-HDV Motherboard', 100),
(5, 'EVGA', 'Z590 FTW WIFI Motherboard', 300),
(5, 'Biostar', 'B450MH AM4 Motherboard', 150),
(5, 'ASUS', 'ROG Strix Z690-E Gaming WiFi D4 Motherboard', 500),
(5, 'ASUS', 'ROG Maximus Z690 Hero Motherboard', 500),
(5, 'ASUS', 'Prime B660M-A Motherboard', 300),
(5, 'ASUS', 'TUF Gaming Z690-Plus WiFi D4 Motherboard', 500),
(5, 'ASUS', 'Prime Z590-P Motherboard', 300),
(5, 'ASUS', 'ROG Strix B560-F Gaming WiFi Motherboard', 300),
(5, 'ASUS', 'Prime H510M-A/CSM Motherboard', 100),
(5, 'ASUS', 'ROG Strix Z590-E Gaming WiFi Motherboard', 300),
(5, 'ASUS', 'ROG Strix X570-E Gaming Motherboard', 500),
(5, 'ASUS', 'Prime X570-Pro Motherboard', 500),
(5, 'ASUS', 'TUF Gaming X570-Plus (Wi-Fi) Motherboard', 500),
(5, 'ASUS', 'ROG Strix B550-F Gaming (Wi-Fi) Motherboard', 300),
(5, 'ASUS', 'Prime B550-Plus Motherboard', 300),
(5, 'ASUS', 'ROG Strix B450-F Gaming Motherboard', 150),
(5, 'ASUS', 'TUF Gaming B450-Plus II Motherboard', 150),
(5, 'ASUS', 'Prime A320M-K Motherboard', 100),
(5, 'ASUS', 'TUF B450-Pro Gaming Motherboard', 150),
(5, 'ASUS', 'Prime B365M-A Motherboard', 150),
(5, 'ASUS', 'ROG Strix X370-F Gaming Motherboard', 300),
(5, 'ASUS', 'TUF B360M-Plus Gaming Motherboard', 150),
(5, 'MSI', 'MPG Z690 Carbon WiFi D4 Motherboard', 500),
(5, 'MSI', 'MAG B660M Bazooka Motherboard', 300),
(5, 'MSI', 'MEG Z590I Unify Mini-ITX Motherboard', 300),
(5, 'MSI', 'MAG B560I Gaming Edge WiFi Mini-ITX Motherboard', 300),
(5, 'MSI', 'MAG B550M Bazooka Motherboard', 300),
(5, 'MSI', 'MAG X570 Tomahawk WiFi Motherboard', 500),
(5, 'MSI', 'MEG X570S Ace Max Motherboard', 500),
(5, 'MSI', 'MAG B450M Bazooka V2 Motherboard', 150),
(5, 'MSI', 'MAG B460M Bazooka Motherboard', 150),
(5, 'MSI', 'MAG Z390 Tomahawk Motherboard', 300),
(5, 'MSI', 'MPG Z390 Gaming Plus Motherboard', 300),
(5, 'MSI', 'MAG X570S Tomahawk Max WiFi Motherboard', 500),
(5, 'MSI', 'MEG Z490I Unify Mini-ITX Motherboard', 300),
(5, 'MSI', 'MPG Z490 Gaming Edge WiFi Motherboard', 300),
(5, 'MSI', 'MAG B550M Mortar WiFi Motherboard', 300),
(5, 'MSI', 'MAG B550M Mortar Motherboard', 300),
(5, 'MSI', 'B450 Gaming Pro Carbon AC Motherboard', 150),
(5, 'MSI', 'B360M Mortar Titanium Motherboard', 150),
(5, 'MSI', 'Z270 Gaming Pro Carbon Motherboard', 300),
(5, 'MSI', 'B250M Mortar Arctic Motherboard', 100),
(5, 'GIGABYTE', 'X570 AORUS Master Motherboard', 500),
(5, 'GIGABYTE', 'B550 AORUS Elite AX V2 Motherboard', 300),
(5, 'GIGABYTE', 'B560M AORUS Elite Motherboard', 300),
(5, 'GIGABYTE', 'Z590 AORUS Elite AX V2 Motherboard', 300),
(5, 'GIGABYTE', 'B450 AORUS Elite Motherboard', 150),
(5, 'GIGABYTE', 'Z490 AORUS Elite AC Motherboard', 300),
(5, 'GIGABYTE', 'H570 AORUS Elite Motherboard', 300),
(5, 'GIGABYTE', 'B550M AORUS Pro-P Motherboard', 300),
(5, 'GIGABYTE', 'Z590I AORUS Ultra Mini-ITX Motherboard', 300),
(5, 'GIGABYTE', 'X570 AORUS Elite Motherboard', 500),
(5, 'GIGABYTE', 'B550 AORUS Elite AX Motherboard', 300),
(5, 'GIGABYTE', 'Z590 AORUS Elite AX V1 Motherboard', 300),
(5, 'GIGABYTE', 'Z390 AORUS Elite Motherboard', 300),
(5, 'GIGABYTE', 'H370 AORUS Gaming 3 Motherboard', 300),
(5, 'GIGABYTE', 'B360 AORUS Gaming 3 Motherboard', 150),
(5, 'GIGABYTE', 'B250 AORUS Gaming 3 Motherboard', 100),
(5, 'GIGABYTE', 'X299 AORUS Gaming 3 Motherboard', 500),
(5, 'GIGABYTE', 'Z370 AORUS Gaming 3 Motherboard', 300),
(5, 'GIGABYTE', 'B150 AORUS Gaming 3 Motherboard', 100),
(5, 'GIGABYTE', 'H110M AORUS Gaming 3 Motherboard', 100);

-- Power Supplies
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(6, 'Corsair', 'RM850x 850W Modular Power Supply', 150),
(6, 'EVGA', 'SuperNOVA 750 G6 750W Power Supply', 100),
(6, 'Seasonic', 'Focus PX-750 750W 80+ Platinum PSU', 100),
(6, 'Thermaltake', 'Toughpower GF1 650W Power Supply', 80),
(6, 'Cooler Master', 'MWE Gold 650 V2 80 Plus Gold PSU', 80),
(6, 'NZXT', 'C650 650W 80 Plus Gold PSU', 80),
(6, 'Antec', 'HCG850 Gold 850W Fully Modular PSU', 150),
(6, 'be quiet!', 'Straight Power 11 750W 80 Plus Gold PSU', 100),
(6, 'SilverStone', 'Strider Gold S Series 750W Modular PSU', 100),
(6, 'Seasonic', 'Focus GM-650 650W 80 Plus Gold PSU', 80),
(6, 'EVGA', 'SuperNOVA 850 G6 850W Power Supply', 150),
(6, 'Corsair', 'RM750x 750W Modular Power Supply', 100),
(6, 'Thermaltake', 'Toughpower GF1 750W Power Supply', 100),
(6, 'Cooler Master', 'MWE Gold 750 V2 80 Plus Gold PSU', 100),
(6, 'NZXT', 'C750 750W 80 Plus Gold PSU', 100),
(6, 'Antec', 'HCG650 Gold 650W Fully Modular PSU', 80),
(6, 'be quiet!', 'Straight Power 11 850W 80 Plus Gold PSU', 150),
(6, 'SilverStone', 'Strider Gold S Series 850W Modular PSU', 150),
(6, 'Seasonic', 'Focus GM-750 750W 80 Plus Gold PSU', 100),
(6, 'EVGA', 'SuperNOVA 1000 G6 1000W Power Supply', 200);

-- Computer Cases
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(7, 'NZXT', 'H510i ATX Mid Tower Case', 100),
(7, 'Fractal Design', 'Define 7 Compact ATX Mid Tower Case', 150),
(7, 'Phanteks', 'Eclipse P500A D-RGB ATX Mid Tower Case', 200),
(7, 'Lian Li', 'O11 Dynamic Mini Tempered Glass Micro-ATX Case', 150),
(7, 'Corsair', 'Crystal Series 280X Micro-ATX Case', 100),
(7, 'Cooler Master', 'MasterCase H500P Mesh ARGB ATX Case', 200),
(7, 'NZXT', 'H510 Elite ATX Mid Tower Case', 150),
(7, 'Fractal Design', 'Meshify 2 Compact ATX Mid Tower Case', 150),
(7, 'Phanteks', 'Eclipse P360A ATX Mid Tower Case', 150),
(7, 'Lian Li', 'O11 Dynamic XL ROG Certified Full Tower Case', 300),
(7, 'Corsair', 'iCUE 4000X RGB Mid-Tower ATX Case', 150),
(7, 'Cooler Master', 'MasterCase TD500 Mesh White ATX Mid Tower Case', 150),
(7, 'NZXT', 'H710i ATX Mid Tower Case - Matte Black', 200),
(7, 'Fractal Design', 'Define 7 XL E-ATX Full Tower Case', 300),
(7, 'Phanteks', 'Enthoo Pro II Full Tower Case', 300),
(7, 'Lian Li', 'PC-O11DX Dynamic Full Tower Case', 250),
(7, 'Corsair', 'Obsidian 500D RGB SE Premium Mid-Tower Case', 250),
(7, 'Cooler Master', 'MasterCase SL600M ATX Mid Tower Case', 200),
(7, 'NZXT', 'H210i Mini-ITX Case', 100),
(7, 'Fractal Design', 'Define 7 Compact ATX Mid Tower Case - Blackout', 150),
(7, 'Phanteks', 'Eclipse P300A Mesh ATX Mid Tower Case', 100),
(7, 'Lian Li', 'PC-O11 Dynamic Razer Edition Full Tower Case', 250),
(7, 'Corsair', 'Crystal Series 680X RGB High Airflow ATX Case', 300),
(7, 'Cooler Master', 'MasterBox Q300L MicroATX Mini Tower Case', 50),
(7, 'NZXT', 'H510 Elite ATX Mid Tower Case - White', 150),
(7, 'Fractal Design', 'Meshify C Mini MicroATX Mini Tower Case', 100),
(7, 'Phanteks', 'Enthoo 719 Full Tower Case', 300),
(7, 'Lian Li', 'O11 Dynamic Mini Tempered Glass Micro-ATX Case - White', 150),
(7, 'Corsair', 'iCUE 4000X RGB Mid-Tower ATX Case - White', 150),
(7, 'Cooler Master', 'MasterCase H500 ARGB ATX Mid Tower Case', 200),
(7, 'NZXT', 'H710i ATX Mid Tower Case - Matte White', 200),
(7, 'Fractal Design', 'Define 7 XL E-ATX Full Tower Case - Blackout', 300),
(7, 'Phanteks', 'Enthoo Pro II Full Tower Case - Black', 300),
(7, 'Lian Li', 'PC-O11 Dynamic Full Tower Case - White', 250),
(7, 'Corsair', 'Obsidian 500D RGB SE Premium Mid-Tower Case - Black', 250),
(7, 'Cooler Master', 'MasterCase SL600M ATX Mid Tower Case - Black', 200);

-- Cooling Systems
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(8, 'Noctua', 'NH-U12S chromax.black CPU Cooler', 70),
(8, 'be quiet!', 'Dark Rock Slim CPU Cooler', 60),
(8, 'NZXT', 'Kraken M22 120mm AIO Liquid Cooler', 70),
(8, 'Corsair', 'iCUE H100i RGB Pro XT 240mm Liquid Cooler', 110),
(8, 'ARCTIC', 'Freezer 34 eSports DUO CPU Cooler', 40),
(8, 'Cooler Master', 'MasterLiquid ML120L RGB V2 120mm Liquid Cooler', 60),
(8, 'Noctua', 'NH-D15 chromax.black CPU Cooler', 140),
(8, 'be quiet!', 'Dark Rock Pro 4 CPU Cooler', 90),
(8, 'NZXT', 'Kraken X63 280mm AIO Liquid Cooler', 130),
(8, 'Corsair', 'iCUE H150i RGB Pro XT 360mm Liquid Cooler', 160),
(8, 'ARCTIC', 'Freezer 50 TR CPU Cooler', 70),
(8, 'Cooler Master', 'MasterLiquid ML240R RGB 240mm Liquid Cooler', 100),
(8, 'Noctua', 'NH-D15S chromax.black CPU Cooler', 140),
(8, 'be quiet!', 'Dark Rock 4 CPU Cooler', 70),
(8, 'NZXT', 'Kraken X53 240mm AIO Liquid Cooler', 100),
(8, 'Corsair', 'iCUE H115i RGB Pro XT 280mm Liquid Cooler', 130),
(8, 'ARCTIC', 'Freezer 7 X CPU Cooler', 30),
(8, 'Cooler Master', 'MasterLiquid ML360R RGB 360mm Liquid Cooler', 150),
(8, 'Noctua', 'NH-U14S chromax.black CPU Cooler', 80),
(8, 'be quiet!', 'Pure Rock 2 CPU Cooler', 40),
(8, 'NZXT', 'Kraken X73 360mm AIO Liquid Cooler', 160),
(8, 'Corsair', 'iCUE H60 120mm Liquid Cooler', 70),
(8, 'ARCTIC', 'Freezer 34 eSports CPU Cooler', 40),
(8, 'Cooler Master', 'MasterLiquid ML280 Mirror 280mm Liquid Cooler', 120),
(8, 'Noctua', 'NH-L9i chromax.black Low Profile CPU Cooler', 50),
(8, 'be quiet!', 'Shadow Rock 3 CPU Cooler', 70),
(8, 'NZXT', 'Kraken Z63 280mm AIO Liquid Cooler', 150),
(8, 'Corsair', 'iCUE H80i RGB Pro XT 120mm Liquid Cooler', 80),
(8, 'ARCTIC', 'Freezer 50 CPU Cooler', 50),
(8, 'Cooler Master', 'MasterLiquid ML240 Mirror 240mm Liquid Cooler', 110),
(8, 'Noctua', 'NH-U12A chromax.black CPU Cooler', 80),
(8, 'be quiet!', 'Shadow Rock Slim CPU Cooler', 60),
(8, 'NZXT', 'Kraken Z73 360mm AIO Liquid Cooler', 170),
(8, 'Corsair', 'iCUE H100i Elite Capellix 240mm Liquid Cooler', 140),
(8, 'ARCTIC', 'Freezer 13 CPU Cooler', 30),
(8, 'Cooler Master', 'MasterLiquid ML360 Mirror 360mm Liquid Cooler', 160);

-- Peripherals
INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES 
(9, 'Logitech', 'G502 HERO High Performance Gaming Mouse', 70),
(9, 'Razer', 'BlackWidow V3 Mechanical Gaming Keyboard', 120),
(9, 'SteelSeries', 'Rival 3 Wired Gaming Mouse', 50),
(9, 'HyperX', 'Cloud Alpha S Gaming Headset', 100),
(9, 'Corsair', 'K70 RGB MK.2 Mechanical Gaming Keyboard', 150),
(9, 'ASUS', 'ROG Strix Impact II Wireless Gaming Mouse', 60),
(9, 'Logitech', 'G Pro Wireless Gaming Mouse', 130),
(9, 'Razer', 'DeathAdder Elite Gaming Mouse', 70),
(9, 'SteelSeries', 'Sensei Ten Gaming Mouse', 80),
(9, 'HyperX', 'Pulsefire Surge RGB Gaming Mouse', 60),
(9, 'Corsair', 'Ironclaw RGB Wireless Gaming Mouse', 70),
(9, 'ASUS', 'ROG Gladius II Origin Gaming Mouse', 80),
(9, 'Logitech', 'G703 LIGHTSPEED Wireless Gaming Mouse', 100),
(9, 'Razer', 'Naga Trinity Gaming Mouse', 90),
(9, 'SteelSeries', 'Rival 600 Gaming Mouse', 80),
(9, 'HyperX', 'Pulsefire FPS Pro RGB Gaming Mouse', 60),
(9, 'Corsair', 'Harpoon RGB Wireless Gaming Mouse', 50),
(9, 'ASUS', 'ROG Pugio II Ambidextrous Gaming Mouse', 90),
(9, 'Logitech', 'G403 HERO Gaming Mouse', 60),
(9, 'Razer', 'Viper Ultimate Hyperspeed Gaming Mouse', 150),
(9, 'SteelSeries', 'Rival 310 Gaming Mouse', 60),
(9, 'HyperX', 'Pulsefire Core RGB Gaming Mouse', 40),
(9, 'Corsair', 'M65 RGB Elite Tunable FPS Gaming Mouse', 70),
(9, 'ASUS', 'ROG Chakram Wireless Gaming Mouse', 120),
(9, 'Logitech', 'G305 LIGHTSPEED Wireless Gaming Mouse', 50),
(9, 'Razer', 'Basilisk Ultimate Hyperspeed Gaming Mouse', 150),
(9, 'SteelSeries', 'Sensei 310 Gaming Mouse', 50),
(9, 'HyperX', 'Pulsefire Dart Wireless Gaming Mouse', 80),
(9, 'Corsair', 'Dark Core RGB SE Wireless Gaming Mouse', 80),
(9, 'ASUS', 'ROG Gladius II Wireless Gaming Mouse', 90),
(9, 'Logitech', 'G602 Lag-Free Wireless Gaming Mouse', 50),
(9, 'Razer', 'DeathAdder V2 Pro Wireless Gaming Mouse', 90),
(9, 'SteelSeries', 'Rival 650 Wireless Gaming Mouse', 90),
(9, 'HyperX', 'Pulsefire FPS Gaming Mouse', 40),
(9, 'Corsair', 'M55 RGB Pro Ambidextrous Multi-Grip Gaming Mouse', 40),
(9, 'ASUS', 'TUF Gaming M5 Optical Gaming Mouse', 40);

-- Inserting more data into Customer table
INSERT INTO Customer (FirstName, LastName, PhoneNumber) VALUES 
('John', 'Doe', '123-456-7890'),
('Jane', 'Smith', '987-654-3210'),
('Alice', 'Johnson', '555-123-4567'),
('Bob', 'Brown', '777-888-9999'),
('Michael', 'Williams', '333-333-3333'),
('Emily', 'Taylor', '444-444-4444'),
('Daniel', 'Martinez', '555-555-5555'),
('Jessica', 'Anderson', '666-666-6666'),
('David', 'Hernandez', '777-777-7777'),
('Sarah', 'Lopez', '888-888-8888');

-- Inserting data into Supplier table
INSERT INTO Supplier (ProductID, SupplierName, ContactFirstName, ContactLastName, ContactNumber) VALUES 
(17, 'Supplier A', 'John', 'Smith', '111-222-3333'),
(18, 'Supplier B', 'Emily', 'Johnson', '444-555-6666'),
(19, 'Supplier C', 'Michael', 'Wilson', '777-888-9999'),
(20, 'Supplier D', 'Jessica', 'Martinez', '123-456-7890'),
(21, 'Supplier E', 'David', 'Anderson', '987-654-3210'),
(22, 'Supplier F', 'Sarah', 'Thompson', '555-123-4567'),
(23, 'Supplier G', 'Mark', 'Taylor', '222-333-4444'),
(24, 'Supplier H', 'Laura', 'Hernandez', '777-222-3333'),
(25, 'Supplier I', 'Chris', 'Lee', '999-888-7777'),
(26, 'Supplier J', 'Jennifer', 'Garcia', '666-777-8888');

-- Inserting more data into TheOrder table
INSERT INTO TheOrder (CustomerID, OrderDate, DeliveryStatus) VALUES 
(5, '2024-02-15', 1),
(6, '2024-02-20', 0),
(7, '2024-03-05', 1),
(8, '2024-03-10', 1),
(9, '2024-03-15', 0),
(10, '2024-03-20', 1);

-- Inserting more data into Transaction table
INSERT INTO Transaction (ProductID, Transaction, Quantity, TransactionDate) VALUES 
(5, 'Purchase', 1, '2024-02-15'),
(6, 'Purchase', 1, '2024-02-20'),
(7, 'Purchase', 1, '2024-03-05'),
(8, 'Purchase', 1, '2024-03-10'),
(9, 'Purchase', 1, '2024-03-15'),
(10, 'Purchase', 1, '2024-03-20');

-- Inserting data into TheOrder table for computer parts
INSERT INTO TheOrder (CustomerID, OrderDate, DeliveryStatus) VALUES 
(1, '2024-01-15', 1),
(2, '2024-01-20', 1),
(3, '2024-02-01', 0),
(4, '2024-02-10', 1),
(5, '2024-02-15', 1),
(6, '2024-02-20', 0),
(7, '2024-03-05', 1),
(8, '2024-03-10', 1),
(9, '2024-03-15', 0),
(10, '2024-03-20', 1);

-- Inserting data into Transaction table for computer parts
INSERT INTO Transaction (ProductID, Transaction, Quantity, TransactionDate) VALUES 
(1, 'Purchase', 1, '2024-01-15'),
(2, 'Purchase', 2, '2024-01-20'),
(3, 'Purchase', 1, '2024-02-01'),
(4, 'Purchase', 1, '2024-02-10'),
(5, 'Purchase', 1, '2024-02-15'),
(6, 'Purchase', 1, '2024-02-20'),
(7, 'Purchase', 1, '2024-03-05'),
(8, 'Purchase', 1, '2024-03-10'),
(9, 'Purchase', 1, '2024-03-15'),
(10, 'Purchase', 1, '2024-03-20');

-- Inserting data into Warranty table for computer parts
INSERT INTO Warranty (ProductID, StartDate, EndDate) VALUES 
(1, '2024-01-15', '2025-01-15'),
(2, '2024-01-20', '2025-01-20'),
(3, '2024-02-01', '2025-02-01'),
(4, '2024-02-10', '2025-02-10'),
(5, '2024-02-15', '2025-02-15'),
(6, '2024-02-20', '2025-02-20'),
(7, '2024-03-05', '2025-03-05'),
(8, '2024-03-10', '2025-03-10'),
(9, '2024-03-15', '2025-03-15'),
(10, '2024-03-20', '2025-03-20');


-- Inserting data into Feedback table for computer parts
INSERT INTO Feedback (CustomerID, ProductID, Rating, Comment) VALUES 
(1, 1, 5, 'Great CPU! Fast and reliable.'),
(2, 2, 4, 'Good GPU, performs well in games.'),
(3, 3, 3, 'Average RAM, nothing special.'),
(4, 4, 5, 'Excellent SSD, speeds up my system.'),
(5, 5, 5, 'Great motherboard, lots of features.'),
(6, 6, 4, 'Good power supply, quiet operation.'),
(7, 7, 3, 'Average case, could have better airflow.'),
(8, 8, 5, 'Excellent liquid cooler, keeps temperatures low.'),
(9, 9, 5, 'Great keyboard, very responsive keys.'),
(10, 10, 4, 'Good mouse, comfortable to use for long periods.');

-- Inserting data into Inventory table
INSERT INTO Inventory (ProductID, SupplierID, Quantity, PurchaseDate) VALUES 
(17, 1, 50, '2023-12-20'),
(18, 2, 30, '2023-12-25'),
(19, 3, 40, '2024-01-10'),
(20, 4, 25, '2024-01-15'),
(21, 5, 35, '2024-01-20'),
(22, 6, 45, '2024-02-01'),
(23, 7, 20, '2024-02-05'),
(24, 8, 15, '2024-02-10'),
(25, 9, 50, '2024-02-15'),
(26, 10, 30, '2024-02-20');

-- Inserting data into Location table
INSERT INTO Location (InventoryID, LocationName, Address) VALUES 
(1, 'Warehouse A', '123 Main St, City A'),
(2, 'Warehouse B', '456 Elm St, City B'),
(3, 'Warehouse C', '789 Oak St, City C'),
(4, 'Warehouse D', '321 Maple St, City D'),
(5, 'Warehouse E', '555 Pine St, City E'),
(6, 'Warehouse F', '777 Cedar St, City F'),
(7, 'Warehouse G', '999 Birch St, City G'),
(8, 'Warehouse H', '888 Cedar St, City H'),
(9, 'Warehouse I', '666 Oak St, City I'),
(10, 'Warehouse J', '333 Elm St, City J');

-- Inserting data into OfferItem table for computer parts
INSERT INTO OfferItem (ProductID, OfferInfo) VALUES 
(1, 'Discount on Intel Core i9-12900K Processor'),
(2, 'Special offer on NVIDIA GeForce RTX 3080 Ti'),
(3, 'Get a free RGB RAM kit with select memory purchases'),
(4, 'Limited time offer on Samsung NVMe SSDs'),
(5, 'Discount on ASUS ROG Maximus Z690 Hero Motherboard'),
(6, 'Special offer on EVGA SuperNOVA 850 G6 Power Supply'),
(7, 'Free additional fans with select computer case purchases'),
(8, 'Discount on NZXT Kraken X73 RGB Liquid Cooler'),
(9, 'Special offer on Logitech G Pro X Mechanical Gaming Keyboard'),
(10, 'Free gaming mouse with select purchases');

-- Inserting data into Promotion table for computer parts
INSERT INTO Promotion (OfferID, PromotionInfo, PromotionDiscount) VALUES 
(1, 'Get a discount on the Intel Core i9-12900K Processor', 5),
(2, 'Limited time offer on NVIDIA GeForce RTX 3080 Ti', NULL),
(3, 'Special discount on Corsair Vengeance RGB Pro 32GB DDR4 RAM', 15),
(4, 'Limited time offer on Samsung NVMe SSDs, no code needed', NULL),
(5, 'Discount on ASUS ROG Maximus Z690 Hero Motherboard', 10),
(6, 'Special offer on EVGA SuperNOVA 850 G6 Power Supply', NULL),
(7, 'Free additional fans with select computer case purchases', NULL),
(8, 'Discount on NZXT Kraken X73 RGB Liquid Cooler using code COOLRGB', 5),
(9, 'Special offer on Logitech G Pro X Mechanical Gaming Keyboard', NULL),
(10, 'Free gaming mouse with select purchases, limited stock available', NULL);



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
