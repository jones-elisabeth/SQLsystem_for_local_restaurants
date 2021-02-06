
/*******************************************************************************/
/*			                 MIS 686 Final Project							   */
/*		                         Team Sun Tzu                              	   */
/*Sina Anaraki, Luke Hanselman, Elisabeth Jones, Stefany Montano, Connor Vaughs*/
/*******************************************************************************/
	
	                  /****************************/
                     /*  CHICKEN CHARLIES TABLE  */
	                /****************************/


/***************************************************************************/
/*  SELECT AND EXECUTE THIS BLOCK TO CREATE THE CHICKEN CHARLIE DATABASE   */
/***************************************************************************/


-- Set Context to Master
		USE MASTER; 
			 
-- If the OnlineMusic database exists, delete it.  
		IF EXISTS (SELECT * FROM Master.dbo.sysdatabases WHERE NAME = 'ChickenCharlie')
		DROP DATABASE ChickenCharlie;
            
--Create the OnlineMusic Database           
		CREATE DATABASE ChickenCharlie;
 
-- CREATE TABLES IN THE ONLINE MUSIC DATABASE          
    	USE ChickenCharlie;



--VENDORS TABLE-- 
-- SCHEMA: VENDORS   (VendorID, VendName, VendStreetAddress, VendCity, VendState, VendZipCode, VendPhoneNumber, VendWebPage, VendEmailAddress, VendSalesperson)

		IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblVendors' and xtype='U'
) CREATE TABLE tblVendors (
    [VendorID] INT                    PRIMARY KEY,
    [VendorName] NVARCHAR(64)                    ,
    [VendorStreetAddress] NVARCHAR(64)           ,
    [VendorCity] NVARCHAR(64)                    ,
    [VendorState] NVARCHAR(32)                   ,
    [VendorZipCode] INT                          ,
    [VendorPhoneNumber] NVARCHAR(32)             ,
    [VendorWebsite] NVARCHAR(64)                 ,
    [VendorSalesPerson] NVARCHAR(64)             ,
    [VendorEmail] NVARCHAR(64)
);

INSERT INTO tblVendors VALUES
    (1001 ,N'US Foods',N'1201 Park Center Dr',N'Vista',N'California',92081,'7605996200',N'usfoods.com',N'Wayne Rajcovic',N'wayne@usfoods.com'),
    (1002 ,N'Seaport Meat Company',N'2533 Folex Way',N'Spring Valley',N'California',91978,'6197132278',N'seaportmeat.com',N'Pete Burns',N'orders@seaportmeat.com'),
    (1003 ,N'Sysco',N'12180 Kirkham Rd',N'Poway',N'California',92064,'8585137300',N'sysco.com',N'Laura Stevens',N'lstevens@sysco.com'),
    (1004 ,N'Specialty Produce',N'1929 Hancock St #150',N'San Diego',N'California',92110,'6192953172',N'specialtyproduce.com',N'Ben Sterling',N'ben@specialtyproduce.com'),
    (1005 ,N'Farmers Outlet',N'10407 Friars Rd',N'San Diego',N'California',92110,'6195639165',N'sandiegofarmersoutlet.com',N'Ryan Jones',N'ryan@sdfarmersoutlet.com'),
    (1006 ,N'Hollandia Dairy',N'622 E Mission Rd',N'San Marcos',N'California',92069,'7607443222',N'hollandiadairy.com',N'Jorgen Ander',N'orders@hollandiadairy.com'),
    (1007 ,N'Balboa International Market',N'5905 Balboa Ave',N'San Diego',N'California',92111,'8582773600',N'balboamarket.com',N'Yres Almasi',N'orders@balboamarket.com'),
    (1008 ,N'Restaurant Depot',N'1335 Cesar E. Chavez Pkwy',N'San Diego',N'California',92113,'6192330200',N'restaurantdepot.com',N'Salazaar Molina',N'orders@restaurantdepot.com'),
    (1009 ,N'Costco',N'7803 Othello Ave',N'San Diego',N'California',92111,'8588105833',N'costcobusinessdelivery.com',N'Trisha Jackson',N'orders@costco.com'),
    (1010 ,N'All American Plastic & Packaging',N'3020 Hoover Ave',N'National City',N'California',91950,'6194746677',N'aaplastic.com',N'Rebecca Gonzales',N'rgonzales@aaplastic.com');

	

--VENDOR ORDER TABLE--
-- SCHEMA: VENDORORDERS   (OrderID, VendorID, DeliveryDate)
--                         fk VendorID references VENDORS

IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblVendorOrders' AND xtype='U'
) CREATE TABLE tblVendorOrders (
    [OrderID] INT PRIMARY KEY                                                        ,
    [VendorID] INT CONSTRAINT FK_VendorID FOREIGN KEY REFERENCES tblVendors(VendorID),
    [DeliveryDate] DATE                                                              ,
	
);
INSERT INTO tblVendorOrders VALUES
    (50001,1002,'2020-04-01'),
    (50002,1007,'2020-04-01'),
    (50003,1010,'2020-04-02'),
    (50004,1003,'2020-04-02'),
    (50005,1009,'2020-04-02'),
    (50006,1001,'2020-04-03'),
    (50008,1001,'2020-04-04'),
    (50009,1009,'2020-04-04'),
    (50010,1008,'2020-04-04'),
    (50011,1001,'2020-04-05'),
    (50012,1004,'2020-04-05'),
    (50013,1010,'2020-04-06'),
    (50014,1009,'2020-04-06'),
    (50015,1006,'2020-04-06'),
    (50016,1006,'2020-04-06'),
    (50017,1010,'2020-04-06'),
    (50018,1004,'2020-04-07'),
    (50019,1007,'2020-04-07'),
    (50020,1006,'2020-04-07'),
    (50021,1002,'2020-04-08'),
    (50022,1007,'2020-04-08'),
    (50024,1004,'2020-04-09'),
    (50025,1004,'2020-04-09'),
    (50026,1005,'2020-04-10'),
    (50027,1003,'2020-04-10'),
    (50028,1003,'2020-04-10'),
    (50029,1009,'2020-04-10');



--ORDER DETAILS TABLE--
-- SCHEMA: ORDER_DETAILS   (OrderID, IngredientID, QuanitiyOrdered, UnitPrice)
--                       	fk IngredientID references INGREDIENTS

IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblOrderDetails' and xtype='U'
) CREATE TABLE tblOrderDetails (
    [OrderID] INT                         ,
    [IngredientID] INT                    ,
    [UnitPrice] MONEY                     ,
    [QuantityOrdered] INT                 
	PRIMARY KEY(OrderID, IngredientID)
);
INSERT INTO tblOrderDetails VALUES
    (50001,2001,65,13),
    (50001,2002,45,15),
    (50001,2003,76,19),
    (50002,2004,169,13),
    (50002,2005,220,20),
    (50003,2008,22.5,5),
    (50003,2009,66,11),
    (50004,2011,130,20),
    (50004,2012,75,25),
    (50004,2013,110,22),
    (50004,2014,187,17),
    (50005,2015,33,11),
    (50005,2016,80,5),
    (50005,2017,120,8),
    (50006,2018,60,20),
    (50005,2019,55,5),
    (50008,2021,60,12),
    (50009,2022,125,25),
    (50009,2023,357,17),
    (50010,2024,143,11),
    (50011,2025,143,11),
    (50012,2026,360,20),
    (50013,2027,36,8),
    (50014,2028,57,19),
    (50015,2029,75,15),
    (50016,2030,100,25),
    (50017,2031,144,24),
    (50018,2032,483,23),
    (50019,2033,75,15),
    (50020,2034,528,24),
    (50021,2035,90,15),
    (50022,2036,270,15),
    (50024,2038,256,16),
    (50025,2039,55,11),
    (50026,2040,91,7),
    (50027,2041,54,18),
    (50028,2042,368,23),
    (50029,2043,78,6),
    (50029,2044,65,13),
    (50029,2045,45,15),
    (50029,2046,76,19),
    (50029,2047,169,13),
    (50029,2048,220,20),
    (50029,2049,22.5,5),
    (50029,2050,66,11),
    (50029,2051,130,20),
    (50029,2052,75,25),
    (50029,2053,110,22),
    (50029,2054,187,17),
    (50029,2055,33,11),
    (50029,2056,80,5),
    (50029,2057,120,8),
    (50029,2058,60,20),
    (50029,2059,55,5),
    (50029,2060,208,16),
    (50029,2061,60,12),
    (50029,2062,125,25),
    (50029,2063,357,17),
    (50029,2064,143,11),
    (50029,2065,143,11),
    (50029,2066,360,20),
    (50029,2067,36,8),
    (50029,2068,57,19),
    (50029,2069,75,15),
    (50029,2070,100,25),
    (50029,2071,144,24),
    (50029,2072,483,23),
    (50029,2073,75,15),
    (50029,2074,528,24),
    (50029,2075,90,15),
    (50029,2076,270,15),
    (50029,2077,168,12),
    (50029,2078,256,16),
    (50029,2079,55,11),
    (50029,2080,91,7),
    (50029,2081,54,18),
    (50029,2082,368,23),
    (50029,2083,78,6),
    (50029,2084,65,13),
    (50029,2085,45,15),
    (50029,2086,76,19),
    (50029,2101,169,13),
    (50029,2102,220,20),
    (50029,2103,22.5,5),
    (50029,2104,66,11),
    (50029,2105,130,20),
    (50029,2106,75,25),
    (50029,2107,110,22),
    (50029,2108,187,17),
    (50029,2109,33,11),
    (50029,2110,80,5),
    (50029,2111,120,8),
    (50029,2112,60,20),
    (50029,2113,55,5),
    (50029,2114,208,16),
    (50029,2115,60,12),
    (50029,2116,125,25),
    (50029,2117,357,17),
    (50029,2118,143,11),
    (50029,2147,143,11),
    (50029,2148,360,20),
    (50029,2149,36,8),
    (50029,2150,57,19),
    (50029,2151,75,15),
    (50029,2152,100,25),
    (50029,2153,144,24),
    (50029,2154,483,23),
    (50029,2155,75,15),
    (50029,2156,528,24),
    (50029,2157,90,15),
    (50029,2158,270,15),
    (50029,2159,168,12),
    (50029,2160,256,16),
    (50029,2161,55,11),
    (50029,2162,91,7),
    (50029,2163,54,18),
    (50029,2164,368,23),
    (50029,2165,78,6),
    (50029,2166,65,13),
    (50029,2167,45,15),
    (50029,2168,76,19),
    (50029,2169,169,13),
    (50029,2170,220,20),
    (50029,2171,22.5,5),
    (50029,2172,66,11),
    (50029,2173,130,20),
    (50029,2174,75,25),
    (50029,2175,110,22),
    (50029,2176,187,17),
    (50029,2177,33,11),
    (50029,2178,80,5),
    (50029,2179,120,8),
    (50029,2180,60,20),
    (50029,2181,55,5),
    (50029,2182,208,16),
    (50029,2183,60,12),
    (50029,2184,125,25),
    (50029,2185,357,17),
    (50029,2186,143,11),
    (50029,2187,143,11),
    (50029,2188,360,20),
    (50029,2189,36,8),
    (50029,2190,57,19),
    (50029,2191,75,15),
    (50029,2192,100,25);



--INGREDIENTS TABLE-- 
-- SCHEMA: INGREDIENTS  (IngredientID, IngredientName, StandardSize, ShelfLife, QuantityOnHand)

IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblIngredients' and xtype='U'
) CREATE TABLE tblIngredients (
    [IngredientID] INT             PRIMARY KEY,
    [IngredientName] NVARCHAR(128)            ,
    [StandardSize] NVARCHAR(32)               ,
    [ShelfLife_Days] INT                      ,
    [QuantityOnHand] INT
);
INSERT INTO tblIngredients VALUES
    (2001,N'CABBAGE, SHRED 1/16" FRESH REF',N'4/5 LB',5,8),
    (2002,N'CHEESE, FETA BLOCK IN BRINE TUB REF',N'2/9 LB',20,6),
    (2003,N'MIX, GRAVY CHICKEN ROASTED PHO-FREE SHELF STABLE SKILLET',N'6/21.6 OZ',30,5),
    (2004,N'CHICKEN, QUARTER LEG RANDOM SMALL BONE-IN SKIN-ON RAW REF CVP',N'4/10 LB',4,5),
    (2005,N'MARGARINE, BUTTER BLEND SOLID SALTED PHO-FREE REF',N'30/1 LB',10,1),
    (2008,N'ONION RING, BREADED 3/4" TFF RAW FROZEN GOURMET APPETIZER',N'8/2 LB',45,5),
    (2009,N'CHICKEN, TENDERLOIN CLIPPED JUMBO RAW REF CVP STRIP',N'4/10 LB',4,4),
    (2011,N'MACARONI & CHEESE, 3 WAY BOIL IN BAG FROZEN',N'4/5 LB',30,2),
    (2012,N'ROLL, BRIOCHE YELLOW 4" SLICED BAKED FROZEN BAG HAMBURGER BUN',N'8/12 EA',4,10),
    (2013,N'BUTTER, CHIP 47 COUNT SALTED RBST FREE SS REF',N'4/4.25 LB',20,4),
    (2014,N'BUTTER, WHIPPED GRADE AA SALTED RBST FREE REF',N'2/5 LB',20,8),
    (2015,N'EGG, SHELL LARGE GRADE AA WHITE LOOSE PACK FRESH CALIFORNIA PROP 12 COMPLIA',N'15 DZ',14,10),
    (2016,N'ICE CREAM PUCK, VANILLA',N'24/5 OZ',10,2),
    (2017,N'ICE CREAM, VANILLA BEAN TUB',N'3 GA',10,1),
    (2018,N'MILK, BUTTERMILK 1% BUTTERFAT RBST FREE VITAMIN A & D CARTON GABLE TOP REF',N'6/.5 GA',7,3),
    (2019,N'MILK, WHOLE RBST FREE VITAMIN D PLASTIC JUG REF CALIFORNIA STANDARD HOMOGEN',N'2/1 GA',7,7),
    (2020,N'TOPPING, WHIPPED DAIRY LIGHT ULTRA PASTEURIZED AEROSOL REF',N'12/15 OZ',21,1),
    (2021,N'CHEESE, AMERICAN WHITE LOAF TFF PROCESSED EZ MELT REF',N'6/5 LB',21,2),
    (2022,N'CHEESE, BLUE CRUMBLE DOMESTIC BAG REF',N'3/5 LB',21,8),
    (2023,N'CHEESE, CHEDDAR MILD SHRED FEATHER RBST FREE BAG YELLOW REF',N'4/5 LB',21,1),
    (2024,N'CHEESE, MOZZARELLA SHRED FEATHER LOW-MOISTURE-WHOLE-MILK BAG REF',N'4/5 LB',21,2),
    (2025,N'CHEESE, PEPPER JACK SLICED .75 OZ TRAY REF',N'4/2.5 LB',28,3),
    (2026,N'BEEF, PATTY GROUND 75/25 4:1 HOMESTYLE NATURAL RAW IQF FROZEN',N'40/4 OZ',14,2),
    (2027,N'PORK, BOSTON BUTT .25" TRIMMED BONELESS RAW REF VACUUM-PACK 406A',N'4/2/9.5 LBA',5,7),
    (2028,N'PORK, RIB BACK 1.85 LB UNPEELED RAW FRESH-TO-FROZEN VACUUM-PACK',N'6/3/1.85 LBA',5,8),
    (2029,N'PORK, RIB BACK 1.85 LB UNPEELED RAW REF VACUUM-PACK 422',N'6/3/1.85 LBA',5,2),
    (2030,N'SAUSAGE, ITALIAN HOT CRUMBLE PORK COOKED FROZEN BAG OLD WORLD TOPPING',N'2/5 LB',6,3),
    (2031,N'HOT DOG, ALL-BEEF 2:1 12" FOOT LONG SKINLESS COOKED FROZEN VACUUM-PACK',N'2/5 LB',10,1),
    (2032,N'LOBSTER, 4-5 OZ TAIL FROZEN IMPORTED CANADA',N'10 LB',4,10),
    (2033,N'SHRIMP, RAW 21-25 WHITE TAIL-ON PEELED-&-DEVEINED IQF FROZEN IMPORTED ASIA',N'5/2 LB',14,1),
    (2034,N'SHRIMP, RAW 31-40 WHITE TAIL-OFF PEELED-&-DEVEINED IQF FROZEN IMPORTED ASIA',N'5/2 LB',14,1),
    (2035,N'CHICKEN, 8 PIECE 16 HD 2.75-3 LB BONE-IN SKIN-ON RAW REF CVP',N'16/2.75-3#A',5,2),
    (2036,N'CHICKEN, BREAST DOUBLE-LOBE 12 OZ UP BONELESS-SKINLESS RAW REF CVP',N'4/10 LB',5,6),
    (2037,N'CHICKEN, THIGH MEAT JUMBO BONELESS-SKINLESS RAW REF CVP',N'4/10 LB',5,2),
    (2038,N'CHICKEN, WHOLE W/OGIB 14 HD 3-3.25 LB BONE-IN SKIN-ON RAW REF CVP',N'14/3-3.25#A',5,9),
    (2039,N'CHICKEN, WING 1ST-&-2ND-JOINT JUMBO RAW FRESH-TO-FROZEN CVP UNFLAVORED',N'4/10 LB',5,1),
    (2040,N'CHICKEN, WING 1ST-&-2ND-JOINT RANDOM JUMBO RAW REF CVP UNFLAVORED',N'4/10 LB',5,1),
    (2041,N'POTATO, TATER NUGGET PARFRIED FROZEN HASH BROWN',N'6/5 LB',21,3),
    (2042,N'BREAD, PITA ORIGINAL GREEK 7" UNSLICED FROZEN',N'12/10 EA',5,7),
    (2043,N'DOUGH, COOKIE CHOCOLATE CHIP 1 OZ FROZEN',N'320/1 OZ',14,10),
    (2044,N'DRESSING, BLUE CHEESE TFF EXTRA CHUNKY PLASTIC JAR REF',N'4/1 GA',21,6),
    (2045,N'HORSERADISH, PREPARED ATOMIC PLASTIC REF',N'4/1 GA',21,9),
    (2046,N'PICKLE, DILL KOSHER WHOLE 60-70 COUNT 4-6.5" PAIL REF',N'5 GA',15,9),
    (2047,N'ROLL, ITALIAN 7" SLICED FROZEN',N'10/6/2.5 OZ',5,1),
    (2048,N'TORTILLA, FLOUR 14" PRESSED REF WRAP',N'10/12 EA',5,4),
    (2049,N'CROUTON, SEASONED BAG HOMESTYLE 1X1X.5"',N'4/2.5 LB',10,2),
    (2050,N'CRUMB, BREAD PANKO PLAIN COARSE BAG',N'25 LB',10,1),
    (2051,N'DRESSING, 1000 ISLAND TFF MILD PLASTIC JAR SHELF STABLE MAYONNAISE BASE',N'4/1 GA',21,5),
    (2052,N'DRESSING, HONEY MUSTARD POPPY SEED TFF PLASTIC JAR SHELF STABLE',N'4/1 GA',21,7),
    (2053,N'FILLING, APPLE PIE RTU CAN SHELF STABLE',N'6/#10 CN',30,2),
    (2054,N'KETCHUP, TOMATO FANCY 33% CAN SHELF STABLE',N'6/#10 CN',30,4),
    (2055,N'KETCHUP, TOMATO FANCY 33% SQUEEZE BOTTLE UPSIDE DOWN SHELF STABLE CLEAR',N'16/14 OZ',30,4),
    (2056,N'KETCHUP, TOMATO FANCY 33% SS FOIL PACKET SHELF STABLE',N'1000/9 GR',30,3),
    (2057,N'MAYONNAISE, REAL SHELF STABLE',N'4/1 GA',30,10),
    (2058,N'MIX, CAKE FUNNEL ADD WATER',N'6/5 LB',30,2),
    (2059,N'MIX, DRESSING RANCH ORIGINAL 1 GAL YIELD POUCH',N'18/3.2 OZ',30,2),
    (2060,N'MIX, GRAVY BISCUIT PEPPER PHO-FREE SHELF STABLE',N'6/24 OZ',30,7),
    (2061,N'MIX, GRAVY TURKEY ROASTED PHO-FREE SHELF STABLE SKILLET',N'6/18.3 OZ',30,8),
    (2062,N'MIX, PANCAKE BUTTERMILK',N'25 LB',30,5),
    (2063,N'PEPPER, CHILI GREEN DICED PEELED FIRE ROASTED IMPORTED & DOMESTIC CAN SHELF',N'12/27 OZ',45,5),
    (2064,N'PEPPER, CHILI GREEN DICED SHELF STABLE',N'12/27 OZ',45,1),
    (2065,N'PEPPER, CHILI GREEN WHOLE CAN SHELF STABLE',N'12/27 OZ',45,5),
    (2066,N'POTATO, MASHED GRANULE DEHYDRATED ADD WATER INSTANT',N'6/26 OZ',30,5),
    (2067,N'RICE, CALROSE',N'50 LB',21,7),
    (2068,N'SALT, TABLE NOT IODIZED BAG',N'25 LB',60,6),
    (2069,N'SAUCE, BBQ PAIL SHELF STABLE ORIGINAL',N'5 GA',30,9),
    (2070,N'SAUCE, BBQ PAIL SHELF STABLE ORIGINAL',N'5 GA',30,2),
    (2071,N'SAUCE, HOT GLASS BOTTLE SHELF STABLE ORIGINAL',N'12/5 OZ',30,6),
    (2072,N'SAUCE, HOT RED PLASTIC JUG SHELF STABLE ORIGINAL',N'4/1 GA',30,6),
    (2073,N'SAUCE, SOY GLASS BOTTLE SHELF STABLE',N'12/5 OZ',30,9),
    (2074,N'SAUCE, SOY PLASTIC JUG SHELF STABLE',N'4/1 GA',30,9),
    (2075,N'SAUCE, TARTAR CREAMY TFF PLASTIC JAR SHELF STABLE',N'4/1 GA',30,2),
    (2076,N'SAUCE, TERIYAKI GLAZE HONEY PINEAPPLE PLASTIC JUG SHELF STABLE BASTE',N'6/5.3 LB',30,6),
    (2077,N'SAUCE, TERIYAKI PLASTIC JUG SHELF STABLE',N'4/1 GA',30,5),
    (2078,N'SAUCE, WORCESTERSHIRE PLASTIC JUG SHELF STABLE',N'3/1 GA',30,5),
    (2079,N'SUGAR, WHITE EXTRA FINE CANE',N'25 LB',60,3),
    (2080,N'SYRUP, PANCAKE MAPLE FLAVORED PLASTIC JUG SHELF STABLE',N'4/1 GA',30,1),
    (2081,N'SYRUP, PANCAKE MAPLE FLAVORED SS CUP BREAKFAST',N'100/1.4 OZ',45,6),
    (2082,N'TOPPING, CHOCOLATE LIQUID BAG SHELF STABLE SYRUP',N'4/5.22 LB',30,4),
    (2083,N'VINEGAR, CIDER APPLE DOMESTIC BOTTLE 50 GRAIN',N'4/1 GA',60,6),
    (2084,N'MARGARINE, LIQUID TFF REF',N'2/17.5 LB',15,7),
    (2085,N'OIL, CANOLA OLIVE EXTRA VIRGIN 75/25 BLEND SALAD & FRYING PLASTIC JUG',N'6/1 GA',45,7),
    (2086,N'SHORTENING, FRYING SOYBEAN LIQUID CLEAR OIL',N'35 LB',60,2),
    (2101,N'AVOCADO, RIPE STAGE 4-5 48 COUNT FRESH REF',N'48 EA',3,10),
    (2102,N'LETTUCE, ICEBERG SHRED 1/8" CLEANED PILLOW PACK FRESH REF',N'4/5 LB',3,7),
    (2103,N'LETTUCE, ROMAINE CHOPPED 1 1/4" PILLOW PACK FRESH REF',N'6/2 LB',3,4),
    (2104,N'MUSHROOM, MEDIUM #1 GRADE BOX FRESH REF',N'10 LB',4,1),
    (2105,N'ONION, YELLOW JUMBO 3"+ BAG FRESH REF',N'50 LB',7,7),
    (2106,N'PEPPER, BELL GREEN MEDIUM 22-28 LB FRESH REF',N'1.1 BU',4,7),
    (2107,N'PEPPER, JALAPENO BOX FRESH REF',N'10 LB',5,1),
    (2108,N'PINEAPPLE, FRESH REF',N'8 EA',4,1),
    (2109,N'STRAWBERRY, CLAMSHELL FRESH REF',N'8/1 LB',3,2),
    (2110,N'ZUCCHINI, GREEN LARGE BOX FRESH REF SQUASH',N'1.1 BU',4,5),
    (2111,N'SYRUP, FOUNTAIN CITRUS MOUNTAIN DEW 5:1 BAG-IN-BOX',N'5 GA',30,7),
    (2112,N'SYRUP, FOUNTAIN COLA DIET PEPSI 5:1 BAG-IN-BOX',N'5 GA',30,8),
    (2113,N'SYRUP, FOUNTAIN COLA PEPSI 5:1 BAG-IN-BOX',N'5 GA',30,9),
    (2114,N'SYRUP, FOUNTAIN DR PEPPER BAG-IN-BOX',N'5 GA',30,7),
    (2115,N'SYRUP, FOUNTAIN LEMON LIME SIERRA MIST 5:1 BAG-IN-BOX',N'5 GA',30,2),
    (2116,N'SYRUP, FOUNTAIN LEMONADE 5:1 BAG-IN-BOX',N'5 GA',30,2),
    (2117,N'TEA BASE, ICED RASPBERRY SWEETENED 5:1 BAG-IN-BOX CAFFEINATED SHELF STABLE',N'5 GA',30,5),
    (2118,N'ROLL, HOAGIE WHITE 8" HINGE SLICED SCORED BAKED FROZEN SUBMARINE',N'6/6/3.15 OZ',4,1),
    (2147,N'McCain Shortening Fries 3/8',N'5/5lb/CS',30,3),
    (2148,N'Onion Ring, Breaded 1/2 ',N'12/1lb/CS',30,5),
    (2149,N'31/40 TOFF Frozen Shrimp PD',N'5/2lb/CS',21,6),
    (2150,N'21/25 TO Frozen Shrimp PD',N'5/2lb/CS',21,9),
    (2151,N'Lobster, 3-4 OZ Tail',N'5/5lb/CS',4,2),
    (2152,N'14-16 Thick Cut Bacon',N'15LB',5,7),
    (2153,N'18-22 Thin Cut Bacon',N'15LB',5,10),
    (2154,N'Thin Sliced Ribeye Meat',N'25LB',5,3),
    (2155,N'Frog Legs 2-4',N'8/2lb/CS',6,1),
    (2156,N'Thigh Meat Boneless Skinless',N'40LB',5,6),
    (2157,N'Disjointed 1-2 Wings',N'40LB',4,1),
    (2158,N'8 pc Fresh',N'40LB',NULL,3),
    (2159,N'Chicken Flour',N'25LB',30,3),
    (2160,N'Seafood Flour',N'25LB',30,4),
    (2161,N'Pancake Mix',N'15LB',30,2),
    (2162,N'Funnel Cake Flour',N'25LB',30,4),
    (2163,N'Strawberrys',N'8/2LB/CS',3,9),
    (2164,N'Pineapples 8 count',N'8/CS',3,7),
    (2165,N'Zucchini wirebound',N'25LB',4,10),
    (2166,N'Cucumber perisen',N'10LB',5,8),
    (2167,N'Tomatoes',N'25LB',3,3),
    (2168,N'Onions',N'25LB',7,6),
    (2169,N'Red Onions',N'25LB',7,3),
    (2170,N'Lemons',N'25LB',4,9),
    (2171,N'Cole-Slaw',N'5/2LB/CS',4,4),
    (2172,N'Shreded lettuce',N'5/2LB/CS',5,1),
    (2173,N'Mixed Green',N'5/2LB/CS',5,4),
    (2174,N'Chopped Romain',N'5/2LB/CS',5,6),
    (2175,N'Potatoes',N'40LB',7,9),
    (2176,N'Chopped Onions',N'5LB',7,3),
    (2177,N'Chopped Bells',N'5LB',5,10),
    (2178,N'Corn',N'25LB',5,8),
    (2179,N'Mushrooms SM',N'5LB',6,5),
    (2180,N'Avocados',N'48/CS',3,10),
    (2181,N'Bells R G',N'25LB',5,3),
    (2182,N'Celery',N'10LB',6,5),
    (2183,N'Pork Butt',N'40LB',5,6),
    (2184,N'Imitation Vanilla',N'4G/CS',30,10),
    (2185,N'Cod Frozen',N'20LB',10,2),
    (2186,N'Golden Beets',N'5LB',22,1),
    (2187,N'Red Beets',N'5LB',4,2),
    (2188,N'Cesar Dressing',N'1G',0,4),
    (2189,N'Parmesean Cheese',N'2LB',6,5),
    (2190,N'Peanuts',N'1G',9,3),
    (2191,N'Oreos',N'6LB',6,3),
    (2192,N'Powdered Sugar',N'10LB',7,5);



--RECIPE CLASSES TABLE--
-- SCHEMA: RECIPE_CLASS   (RecipeClassID, RecipeClassDescription)

IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblRecipeClasses' and xtype='U'
) CREATE TABLE tblRecipeClasses (
    [RecipeClassID] INT                    PRIMARY KEY,
    [RecipeClassDescription] NVARCHAR(32)
);
INSERT INTO tblRecipeClasses VALUES
    (30001,N'Appetizers'),
    (30002,N'Baskets'),
    (30003,N'Salads'),
    (30004,N'Handhelds'),
    (30005,N'Entrees'),
    (30006,N'Sides'),
    (30007,N'Desserts');



--CLASS MEMBERSHIP TABLE--
-- SCHEMA: CLASS_MEMBERSHIPS   (RecipeClassID, RecipeID, RecipeClassDescription)
--                              fk RecipeClassID references RECIPE_CLASS
--                           	fk RecipeID references RECIPES

IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblClassMemberships' and xtype='U'
) CREATE TABLE tblClassMemberships (
    [RecipeID] INT                                                                    ,
    [RecipeClassID] INT                                                               ,
    [RecipeClassDescription] NVARCHAR(64)
	CONSTRAINT PK_RecipeClassGRoup PRIMARY KEY NONCLUSTERED (RecipeID, RecipeClassID)
);
INSERT INTO tblClassMemberships VALUES
    (20001,30001,N'Hot Wing Apptizer'),
    (20001,30002,N'Hot Wing Basket'),
    (20002,30001,N'Fried Avocados Appetizer'),
    (20003,30001,N'Bacon Wrapped Pickle Appetizer'),
    (20004,30002,N'Fish and Chips Basket'),
    (20005,30002,N'Chicken Tenders Basket'),
    (20006,30002,N'Crispy Shrimp Basket'),
    (20007,30001,N'Frog Legs Appetizer'),
    (20008,30001,N'Bacon Wrapped Shrimp Appetizer'),
    (20009,30002,N'Fish and Shrimp Basket'),
    (20010,30006,N'Beet Salad'),
    (20010,30003,N'Beet Salad Side'),
    (20011,30003,N'Shrimp Beet Salad'),
    (20012,30003,N'The Jessica'),
    (20013,30003,N'Bacon Chicken Avocado Salad'),
    (20014,30003,N'Spring Green Salad'),
    (20015,30003,N'Cesar Salad'),
    (20015,30006,N'Cesar Salad Side'),
    (20016,30003,N'Buffalo Blue Chicken Salad'),
    (20017,30004,N'Pulled Pork Sandwich'),
    (20018,30004,N'Shrimp Po''Boy Sandwich'),
    (20019,30004,N'Bacon Avocado Chicken Sandwich'),
    (20020,30004,N'Chicken Breast Sandwich'),
    (20021,30004,N'The Rodeo Chicken Sandwhich'),
    (20022,30004,N'The Cowboy Burger'),
    (20023,30004,N'Good Ol'' Burger'),
    (20024,30004,N'Buffalo Mac + Cheese Sandwich'),
    (20025,30005,N'Maui Chicken Entree'),
    (20026,30005,N'Naked Shrimp Entree'),
    (20027,30005,N'Chicken and Waffle Entree'),
    (20028,30005,N'Fried Chicken Dinner Entree'),
    (20029,30005,N'Baby Back Ribs Entree'),
    (20030,30005,N'Chicken and Shrimp Entree'),
    (20031,30005,N'Ribs and Shrimp Entree'),
    (20032,30005,N'Ribs and Chicken Entree'),
    (20033,30006,N'Side of Fries'),
    (20033,30002,N'Basket of Fries'),
    (20034,30006,N'Side of Onion Rings'),
    (20034,30002,N'Basket of Onion Rings'),
    (20034,30001,N'Onion Ring Appetizer'),
    (20035,30006,N'Side of Tater Tots'),
    (20035,30002,N'Basket of Tater Tots'),
    (20036,30006,N'Side of Rice'),
    (20037,30006,N'Side Salad'),
    (20038,30003,N'Cucumber Tomato Salad'),
    (20038,30006,N'Cucumber Tomato Salad Side'),
    (20039,30006,N'Coleslaw Side'),
    (20040,30006,N'Mac and Cheese Side'),
    (20040,30005,N'Mac and Cheese Entree'),
    (20041,30007,N'Fried Oreos Dessert'),
    (20042,30007,N'Fried Cookie Dough Dessert'),
    (20043,30007,N'Strawberry Funnel Cake Dessert');



--RECIPES TABLE--
-- SCHEMA: RECIPES   (RecipeID, RecipeTitle, RecipeClassID,PreparationsInstructions, Notes)
--	                  fk RecipeClassID references RECIPE_CLASS
--                    RecipeClassID Not Null

	IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblRecipes' and xtype='U'
) CREATE TABLE tblRecipes (
    [RecipeID] INT                                                  PRIMARY KEY,
    [RecipeTitle] NVARCHAR(64)                                                 ,
    [RecipeClassID] INT CONSTRAINT FK_RecipeClassID FOREIGN KEY (RecipeClassID)
	REFERENCES tblRecipeClasses(RecipeClassID) NOT NULL,
    [PreperationInstructions] NVARCHAR(320)                                    ,
    [Notes] NVARCHAR(128)
	
);
INSERT INTO tblRecipes VALUES
    (20001,N'Hot Wings',30001,N'Toss in chicken breading. Drop in chicken fryer. Set wing timer.',N'Served with celery, carrats, and choice of dipping sauces.'),
    (20002,N'Fried Avocados',30001,N'Peel fruit. Cut avocado into sixths. Dip in veggie batter. Drop in veggie fryer until golden.',N'Served with pesto ranch'),
    (20003,N'Bacon Wrapped Pickle',30001,N'Cut two russian dill pickles in half. Wrap all four halves in 14-16 thick cut bacon. Skewer halves together with space between chunks. Toss in chicken flour. Drop in veggie fryer until bacon cooked.',N'Served with ranch. '),
    (20004,N'Fish and Chips',30002,N'Peel skin off cod. Cut cod into 4 ounces portions. Dip fish into fish batter. Drop in fish fryer. Set fish timer.',N'Served with lemo and tartar sauce.'),
    (20005,N'Chicken Tenders',30002,N'Toss in chicken breading. Drop in chicken fryer. Set tender timer.',N'Served with ranch and ketchup.'),
    (20006,N'Crispy Shrimp',30002,N'Toss shrimp in seafood flour. Drop in shrimp fryer. Set Shrimp timer.',N'Served with Lemon and Cocktail sauce'),
    (20007,N'Frog Legs',30002,N'Toss in seafood flour. Drop in fish fryer. Set Frog Leg timer.',N'Served with lemon and tartar sauce.'),
    (20008,N'Bacon Wrapped Shrimp',30002,N'Use half a piece of 18-22 thin cut bacon to wrap one 21-25 TO shrimp. Skewer 6 bacon wraped shrimps. Toss in seafood batter. Drop in shrimp fryer. Set bacon shrimp timer.',N'Served with cocktail sauce. Space shrimps on skewer before frying'),
    (20009,N'Fish and Shrimp',30002,N'Repeat Crispy Shrimp and Fish and Shrimp instructions.',N'Served with cocktail, tartar, and lemon.'),
    (20010,N'Beet Salad',30003,N'Cover square plate with greens. Top with half an avocado, three gold beets, three red beets, onioins, tomato, and cucumber.',N'Served with choice of dressing on the side.'),
    (20011,N'Shrimp Beet Salad',30003,N'Cover square plate with greens. Top with half an avocado, three gold beets, three red beets, onioins, tomato, and cucumber. Garnish with 8 naked shrimp.',N'served with choice of dressing on the side.'),
    (20012,N'The Jessica',30003,N'Cover square plate with greens. Top with cheeseburger patty, onions, tomato, and two strips of bacon.',N'served with choice of dressing on the side.'),
    (20013,N'Bacon Chicken Avocado Salad',30003,N'Cover square plate with greens. Top with choice of chicken, half a peeled avocado, onions, and tomato.',N'Served with choice of dressing on the side.'),
    (20014,N'Spring Green Salad',30003,N'Cover square plate with greens. Top with onions, tomato, and cucumber.',N'Served with choice of dressing on the side.'),
    (20015,N'Cesar Salad',30003,N'Toss greens in cesar dressing with croutons and parmesean cheese. Cover square plate with tossed greens.',N'Served with extra side of cesar dressing.'),
    (20016,N'Buffalo Blue Chicken Salad',30003,N'Cover square plate with greens. Top with choice of chicken dipped in buffalo sauce, tomato, onion, and blue cheese crumble.',N'Served with choice of dressing on the side.'),
    (20017,N'Pulled Pork Sandwich',30004,N'Heat 8 ounces of pulled pork with BBQ sauce. Put heated pork on bun and top with two onion rings.',N'Served with fries.'),
    (20018,N'Shrimp Po''Boy',30004,N'Toss 10 TOFF shrimp in shrimp flour and fry. Top roll with spicy mayo, lettuce, tomato, and 10 crispy TOFF shrimps.',N'Served with fries.'),
    (20019,N'Bacon Avocado Chicken Sandwich',30004,N'Top bun with mayo, lettuce, tomato, choice of chicken, half an avocado, and two strips of bacon.',N'Served with crispy or grilled chicken and fries.'),
    (20020,N'Chicken Breast Sandwich',30004,N'Top bun with mayo, lettuce, tomato, choice of chicken.',N'Served with crispy or grilled chicken and fries.'),
    (20021,N'The Rodeo Chicken Sandwhich',30004,N'Grilled or Crispy Chicken breast glazed with BBQ sauce, Cheddar cheese, crispy bacon, an onion ring, and mayo on a toasted bun',N'Served with crispy or grilled chicken and fries.'),
    (20022,N'The Cowboy Burger',30004,N'Mouthwatering half-pound burger, topped with BBQ sauce, bacon, cheddar cheese, and an onion ring',N'Served with fries.'),
    (20023,N'Good Ol'' Burger',30004,N'Grill beef patty. Top bun with maoy, lettuce, tomato, pickles, beef patty, cheddar cheese.',N'Served with fries.'),
    (20024,N'Buffalo Mac + Cheese Sandwich',30004,N'Toss chicken patty in chicken flour. Fry chicken patty. Top bun with ranch, pickles, crispy chicken breast, and mac and cheese.',N'Served with fries.'),
    (20025,N'Maui Chicken',30005,N'Grill maui chicken. Add pineapple chunks into hallow pineapple. Top with scoope of rice, and grilled maui chicken.',N'Served with maui sauce.'),
    (20026,N'Naked Shrimp',30005,N'Fry 21-25 TO shrimp in shrimp fryer. Add pineapple chunks to hallow pineapple. Top with a scoope of rice and fried shrimp.',N'Served with cocktail sauce.'),
    (20027,N'Chicken and Waffle',30005,N'Toss four pieces of bone in chicken in chicken flour and fry in chicken fryer. Set chicken timer. Cook waffle, top waffle with chicken, whipped cream, strawberries. ',N'Served with whipped cream, butter, syrup, and powdered sugar.'),
    (20028,N'Fried Chicken Dinner',30005,N'Toss four pieces of bone in chicken in chicken flour and fry in chicken fryer. Set chicken timer. Serve with two sides.',N'Served with two sides.'),
    (20029,N'Baby Back Ribs',30005,N'Lay half a rack of ribs on grill. Heat until internal temp 165. Lather in bbq sauce.',N'Served with two sides.'),
    (20030,N'Chicken and Shrimp',30005,N'Toss two pieces of bone in chicken in chicken flour and fry in chicken fryer. Set chicken timer. Toss six 21-25 TO shirmp in shrimp flour and fry in shrimp fryer. Set shrimp timer.\',N'Served with two sides.'),
    (20031,N'Ribs and Shrimp',30005,N'Lay half a rack of ribs on grill. Heat until internal temp 165. Lather in bbq sauce.Toss six 21-25 TO shrimp in shrimp flour and fry in shrimp fryer. Set Shrimp timer.',N'Served with two sides.'),
    (20032,N'Ribs and Chicken',30005,N'Lay half a rack of ribs on grill. Heat until internal temp 165. Lather in bbq sauce.Toss two pieces of bone in chicken in chicken flour and fry in chicken fryer. Set chicken timer.',N'Served with two sides.'),
    (20033,N'Fries',30006,N'Portion half a pound off french fries and drop in side fryer until floating.',N'Served with ketchup.'),
    (20034,N'Onion RIngs',30006,N'Drop 12 frozen onion rings in side fryer until golden.',N'Served with ketchup.'),
    (20035,N'Tater Tots',30006,N'Portion half a pound of tater tots and drop in side fryer until floating.',N'Served with ketchup.'),
    (20036,N'Rice',30006,N'Add three and a half quarts of rice to rice maker. Fill to water line 20 quarts with water. Add half a stick of butter and 2 ounces of salt. ',NULL),
    (20037,N'Side Salad',30006,N'Small salad bowl with greens, tomatos, cucumbers, onion, and croutons.',N'Served with choice of dressing.'),
    (20038,N'Cucumber Tomato Salad',30006,N'Toss four ounces of cucumbers and four ounces of tomatos with three ounces of lemon juice and a table spoon of mint.',N'Strain excess lemon juice before serving.'),
    (20039,N'Coleslaw',30006,N'Mix into one bag of coleslaw mix one gallon of mayo, half a cup of lemon juice, a cup of sugar, two ounces of salt, a cups of diced green bell peppers, a cup of diced onion, two cups of peanuts, two ounces of celery seed, and half a cup of apple cider vinegar.',N'Strain of excess juices before serving.'),
    (20040,N'Mac and Cheese',30006,N'Boil in bag.',NULL),
    (20041,N'Fried Oreos',30007,N'Dip four oreos seperately into oreo batter and fry in dessert fryer until golden.',N'Top with four regular oreos, powdered sugar, chocolate drizzle and sprinkles.'),
    (20042,N'Fried Cookie Dough',30007,N'Dip four cookie doughs seperately into oreo batter and fry in dessert fryer until golden.',N'Top with four regular oreos, powdered sugar, chocolate drizzle and sprinkles.'),
    (20043,N'Strawberry Funnel Cake',30007,N'Set funnel cake mold into dessert fryer. Pour funnel cake batter into mold in crossing pattern. Set funnel cake timer. Flip and Repeat.',N'Served with whipped cream and strawberries');



--RecipeIngredients TABLE-- 
--SCHEMA: RECIPE_INGREDIENTS   (RecipeID, RecipeSeqNo, IngredientID, MeasurementDescription, Amount)
--                              fk RecipeID references RECIPES
--                              fk IngredientID references INGREDIENTS
--                              IngredientID Not Null

IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE NAME='tblRecipeIngredients' and xtype='U'
) CREATE TABLE tblRecipeIngredients (
    [RecipeID] INT CONSTRAINT FK_RecipeID FOREIGN KEY (RecipeID)
	REFERENCES tblRecipes(RecipeID)                                                            ,
    [RecipeSeqNo] INT                                                        ,
    [IngredientID] INT CONSTRAINT FK_IngredientID FOREIGN KEY (IngredientID)
	REFERENCES tblIngredients(IngredientID)  NOT NULL                                ,
    [MeasurementDescription] NVARCHAR(32)                                    ,
    [Amount] NUMERIC(3, 1)
);
INSERT INTO tblRecipeIngredients VALUES
    (20001,1,2157,N'LB',1),
    (20001,2,2159,N'Cup',1),
    (20002,1,2101,N'Each',1),
    (20002,2,2160,N'Cup',0.5),
    (20003,1,2046,N'Each',2),
    (20003,2,2153,N'Each',4),
    (20003,3,2160,N'Cup',0.5),
    (20004,1,2185,N'LB',1),
    (20004,2,2160,N'Cup',0.5),
    (20004,3,2147,N'LB',1),
    (20005,1,2009,N'LB',1),
    (20005,2,2159,N'Cup',0.5),
    (20005,3,2147,N'LB',1),
    (20006,1,2150,N'Each',8),
    (20006,2,2160,N'Cup',0.5),
    (20006,3,2147,N'LB',1),
    (20007,1,2155,N'LB',1),
    (20007,2,2159,N'Cup',0.5),
    (20007,3,2147,N'LB',1),
    (20008,1,2150,N'Each',6),
    (20008,2,2153,N'Each',3),
    (20008,3,2159,N'LB',0.5),
    (20009,1,2150,N'Each',8),
    (20009,2,2185,N'LB',1),
    (20009,3,2160,N'Cup',1),
    (20009,4,2147,N'LB',1),
    (20010,1,2103,N'Oz',4),
    (20010,2,2167,N'Oz',4),
    (20010,3,2166,N'Oz',4),
    (20010,4,2105,N'Oz',2),
    (20010,5,2186,N'Oz',1),
    (20010,6,2187,N'Oz',1),
    (20010,7,2101,N'Each',0.5),
    (20010,8,2002,N'Oz',2),
    (20011,1,2103,N'Oz',4),
    (20011,2,2167,N'Oz',4),
    (20011,3,2166,N'Oz',4),
    (20011,4,2105,N'Oz',2),
    (20011,5,2186,N'Oz',1),
    (20011,6,2187,N'Oz',1),
    (20011,7,2101,N'Each',0.5),
    (20011,8,2002,N'Oz',2),
    (20011,9,2150,N'Each',8),
    (20012,1,2103,N'Oz',4),
    (20012,2,2167,N'Oz',4),
    (20012,3,2166,N'Oz',4),
    (20012,4,2105,N'Oz',2),
    (20012,5,2101,N'Each',0.5),
    (20012,6,2152,N'Each',2),
    (20012,7,2026,N'Each',1),
    (20013,1,2103,N'Oz',4),
    (20013,2,2167,N'Oz',4),
    (20013,3,2166,N'Oz',4),
    (20013,4,2105,N'Oz',2),
    (20013,5,2101,N'Each',0.5),
    (20013,6,2152,N'Each',2),
    (20013,7,2036,N'Each',1),
    (20014,1,2103,N'Oz',4),
    (20014,2,2167,N'Oz',4),
    (20014,3,2166,N'Oz',4),
    (20014,4,2105,N'Oz',2),
    (20014,5,2049,N'Oz',1),
    (20015,1,2103,N'Oz',4),
    (20015,2,2049,N'Oz',1),
    (20015,3,2188,N'Oz',3),
    (20015,4,2189,N'Oz',2),
    (20016,1,2103,N'Oz',4),
    (20016,2,2167,N'Oz',4),
    (20016,3,2166,N'Oz',4),
    (20016,4,2105,N'Oz',2),
    (20016,5,2022,N'Oz',2),
    (20016,6,2036,N'Each',1),
    (20017,1,2012,N'Each',1),
    (20017,2,2183,N'LB',1),
    (20017,3,2008,N'Oz',4),
    (20017,4,2069,N'Oz',4),
    (20018,1,2047,N'Each',1),
    (20018,2,2102,N'Oz',2),
    (20018,3,2167,N'Oz',2),
    (20018,4,2057,N'Oz',2),
    (20018,5,2149,N'Each',10),
    (20018,6,2160,N'Cup',0.5),
    (20019,1,2012,N'Each',1),
    (20019,2,2102,N'Oz',2),
    (20019,3,2167,N'Oz',2),
    (20019,4,2057,N'Oz',2),
    (20019,5,2101,N'Each',0.5),
    (20019,6,2152,N'Each',2),
    (20019,7,2036,N'Each',1),
    (20020,1,2012,N'Each',1),
    (20020,2,2102,N'Oz',2),
    (20020,3,2167,N'Oz',2),
    (20020,4,2057,N'Oz',2),
    (20020,5,2036,N'Each',1),
    (20021,1,2012,N'Each',1),
    (20021,2,2036,N'Each',1),
    (20021,3,2057,N'Oz',2),
    (20021,4,2008,N'Oz',2),
    (20021,5,2152,N'Each',2),
    (20021,6,2169,N'Oz',2),
    (20021,7,2023,N'Oz',2),
    (20022,1,2012,N'Each',1),
    (20022,2,2026,N'Each',1),
    (20022,3,2023,N'Oz',2),
    (20022,4,2152,N'Each',2),
    (20022,5,2008,N'Oz',4),
    (20022,6,2069,N'Oz',4),
    (20023,1,2012,N'Each',1),
    (20023,2,2102,N'Oz',2),
    (20023,3,2167,N'Oz',2),
    (20023,4,2057,N'Oz',2),
    (20023,5,2046,N'Each',1),
    (20023,6,2023,N'Oz',2),
    (20023,7,2026,N'Each',1),
    (20024,1,2012,N'Each',1),
    (20024,2,2036,N'Each',1),
    (20024,3,2046,N'Each',1),
    (20024,4,2011,N'Oz',4),
    (20025,1,2164,N'Each',0.5),
    (20025,2,2067,N'Oz',8),
    (20025,3,2076,N'Oz',4),
    (20025,4,2037,N'Oz',8),
    (20026,1,2164,N'Each',0.5),
    (20026,2,2067,N'Oz',8),
    (20026,3,2150,N'Each',8),
    (20027,1,2035,N'Pc',4),
    (20027,2,2159,N'Cup',1),
    (20027,3,2161,N'Cup',2),
    (20027,4,2163,N'Oz',2),
    (20027,5,2080,N'Oz',4),
    (20027,6,2020,N'Oz',4),
    (20027,7,2014,N'Oz',2),
    (20028,1,2035,N'Pc',4),
    (20028,2,2159,N'Cup',1),
    (20029,1,2028,N'LB',2),
    (20029,2,2070,N'Oz',4),
    (20030,1,2035,N'Pc',2),
    (20030,2,2159,N'Cup',0.5),
    (20030,3,2150,N'Each',8),
    (20030,4,2160,N'Cup',0.5),
    (20031,1,2028,N'LB',2),
    (20031,2,2070,N'Oz',4),
    (20031,3,2150,N'Each',8),
    (20031,4,2160,N'Cup',0.5),
    (20032,1,2035,N'Pc',2),
    (20032,2,2159,N'Cup',0.5),
    (20032,3,2028,N'LB',2),
    (20032,4,2070,N'Oz',4),
    (20033,1,2147,N'LB',1),
    (20034,1,2008,N'LB',1),
    (20035,1,2041,N'LB',1),
    (20036,1,2067,N'Oz',8),
    (20037,1,2103,N'Oz',4),
    (20037,2,2167,N'Oz',4),
    (20037,3,2166,N'Oz',4),
    (20037,4,2105,N'Oz',2),
    (20037,5,2049,N'Oz',1),
    (20038,1,2166,N'Oz',4),
    (20038,2,2167,N'Oz',4),
    (20038,3,2170,N'Each',0.5),
    (20039,1,2001,N'LB',1),
    (20039,2,2079,N'Cup',1),
    (20039,3,2083,N'Cup',0.5),
    (20039,4,2057,N'Gallon',1),
    (20039,5,2170,N'Each',6),
    (20039,6,2176,N'LB',1),
    (20039,7,2177,N'LB',1),
    (20039,8,2190,N'LB',1),
    (20040,1,2011,N'Oz',8),
    (20041,1,2191,N'Each',8),
    (20041,2,2062,N'Cup',1),
    (20041,3,2082,N'Oz',4),
    (20041,4,2017,N'Oz',4),
    (20041,5,2192,N'Oz',1),
    (20042,1,2043,N'Each',4),
    (20042,2,2062,N'Cup',1),
    (20042,3,2082,N'Oz',4),
    (20042,4,2017,N'Oz',4),
    (20042,5,2192,N'Oz',1),
    (20043,1,2058,N'Cup',2),
    (20043,2,2163,N'Oz',8),
    (20043,3,2020,N'Oz',8),
    (20043,4,2192,N'Oz',1);



	-- Display the contents of the nine tables

	SELECT * FROM tblVendors;
	SELECT * FROM tblVendorOrders;
	SELECT * FROM tblOrderDetails;
	SELECT * FROM tblIngredients;
	SELECT * FROM tblRecipes;
	SELECT * FROM tblClassMemberships;
	SELECT * FROM tblRecipeClasses;
	SELECT * FROM tblRecipeIngredients;

	GO



/* This script demonstrates viewing metadata for a database */

-- Get a list of all databases on your SQL Server

USE MASTER
GO
SELECT Name FROM sysdatabases;
GO
-- Get a list of all tables in your database

USE ChickenCharlie; 
GO

SELECT * From information_schema.tables;
GO

--Get a list of all columns and their properties from your database

SELECT * FROM information_schema.columns;
GO

-- Get a list of all columns and their properties for a specific table in your database

SELECT * FROM information_schema.columns;
GO



/************************************************************************/
/*    END OF BLOCK TO CREATE THE CHICKEN CHARLIE TABLE DATABASE         */
/************************************************************************/ 





/******************************************************************/
/*The start of the queries used to pull information from database*/
/******************************************************************/ 



/*Customer places large catering order for next day. Junior manager finds inventory lacking in the needed product to complete order.*/
/*Only local suppliers can fulfill next day deliveries. Find the contact information of vendors who can do next day deliveries .*/
SELECT VendorName, VendorPhoneNumber, VendorSalesPerson
FROM   tblVendors
WHERE  VendorCity = 'San Diego';

/*Charlie wants to run a special this week to get rid of extra inventory. Return a list of the quantity of all products in inventory*/
SELECT   IngredientName, QuantityOnHand  
FROM     tblIngredients
Order by QuantityOnHand DESC;

/*Charlie wants to know who locally he is spending the most money buying products from to potentially replace them with a cheaper out of town competitor.*/
/*Show a list of vendors located in San Diego and list their most expensive order*/
SELECT     v.VendorID, v.VendorName, FORMAT(MAX(d.UnitPrice*d.QuantityOrdered), 'C') AS MaxTotalCost
FROM       tblvendors      v
INNER JOIN tblVendorOrders o ON v.VendorID = o.VendorID
INNER JOIN tblOrderDetails d ON o.OrderID = d.OrderID
WHERE       Vendorcity IN (Select Vendorcity FROM tblvendors 
					       WHERE  vendorcity LIKE '%San Diego%')
GROUP BY   v.VendorID, v.VendorName
ORDER BY   VendorName DESC;

/*Charlie wants to know what type of chicken wing has the lowest price right now. Return a list of wings in from the db with average prices.*/
SELECT DISTINCT  i.IngredientID, IngredientName, FORMAT(AVG(UnitPrice) OVER(PARTITION BY d.IngredientID), 'C') AS AvgPrice
FROM             tblIngredients  i
JOIN             tblOrderDetails d ON i.IngredientID = d.IngredientID
WHERE            i.IngredientName LIKE '%wing%' 
ORDER BY         i.IngredientName;

/*Senior manager notices the first of the month was busy and wants to know how that affected orders for the rest of the week.
Return a list of the daily average price of orders from April 2nd to April 7th?*/
SELECT   DeliveryDate, FORMAT(AVG(UnitPrice), 'C') "AvgPrice"
FROM     tblVendorOrders v
JOIN     tblOrderDetails d ON v.OrderID = d.OrderID
WHERE    DeliveryDate BETWEEN '2020-04-02' AND '2020-04-07'
GROUP BY DeliveryDate;

/*Chef notices there haven't been many orders of blue cheese recently and wonders how often we order it compared to other cheese
Show how long it has been since we last ordered all cheese ingredients.*/
SELECT tblIngredients.IngredientName,
	(SELECT DATEDIFF(DAYOFYEAR, MAX(tblVendorOrders.DeliveryDate), CONVERT(DATE, GETDATE()))
		FROM       tblVendorOrders 
		INNER JOIN tblOrderDetails
		ON         tblVendorOrders.OrderID = tblOrderDetails.OrderID
		WHERE      tblOrderDetails.IngredientID = tblIngredients.IngredientID)  AS DaysSinceOrder
FROM  tblIngredients
WHERE tblIngredients.IngredientName
IN
	(SELECT tblIngredients.IngredientName
		FROM    tblIngredients
		WHERE   tblIngredients.IngredientName LIKE '%cheese%');

/*Charlie wants to know what products he has spent the most money on recently. Return a running total of items ordered by ascending order data.*/
SELECT   DeliveryDate, IngredientID,FORMAT(UnitPrice, 'C') UnitPrice,FORMAT(SUM(UnitPrice) OVER(ORDER BY DeliveryDate ASC), 'C') RunningTotalSpent
FROM     tblOrderDetails  o 
JOIN     tblVendorOrders  v ON o.OrderID = v.OrderID
ORDER BY DeliveryDate     ASC;

/*Charlie wants to know which ingredients he spends the most on per order on average. 
List the average cost by ingredient from orders between April 4th and April 8th from highest average cost to lowest average cost*/
 SELECT IngredientID, AVG(UnitPrice) AS AvgUnitPrice
 FROM   tblOrderDetails o
 JOIN   tblVendorOrders v ON o.OrderID = v.OrderID
 WHERE  o.OrderID IN
 (SELECT  v.OrderID
	FROM  tblVendorOrders
	WHERE DeliveryDate BETWEEN '04/04/2020' AND '04/08/2020')
	GROUP BY IngredientID
 ORDER BY AvgUnitPrice DESC;

/*Junior manager is preparing to change inventory taking days and is making a list of ingredients which have been in stock on each day.
What is the average quantity in stock on a certain day? */
SELECT   IngredientName, CAST(AVG(QuantityOnHand) AS DECIMAL (10,2)) AvgQuanityInStock
FROM     tblIngredients  i 
JOIN     tblOrderDetails o ON i.IngredientID = o.IngredientID
JOIN     tblVendorOrders v ON o.OrderID = v.OrderID
WHERE    DATENAME(WEEKDAY, DeliveryDate) = 'Friday'
GROUP BY IngredientName;

/*Charlie sees a whole table eating a Cowboy Burger and wants to know the food cost of such a creation.
Return the cost of every ingredient required for making a Cowboy Burger*/
SELECT DISTINCT RecipeTitle, IngredientName, FORMAT((Amount * UnitPrice), 'C') AS TotalCost
FROM            tblRecipes           r
JOIN            tblRecipeingredients ri ON r.recipeID = ri.RecipeID 
JOIN            tblIngredients       i  ON i.ingredientID = ri.ingredientID
JOIN            tblOrderDetails      o  ON O.IngredientID = ri.IngredientID
WHERE           RecipeTitle = 'The Cowboy Burger';
