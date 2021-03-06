/* Entity Creation */
CREATE TABLE "Employees" (
  "Emp_ID" INT,
  "Name" VARCHAR(15),
  "Surname" VARCHAR(20),
  "Date_Employed" DATE,
  "Role" VARCHAR(30),
  "Salary" NUMBER(15,2),
  "Contact_No" NUMBER(9),
  "Email" VARCHAR(30),
  "Manager_ID" INT,
  PRIMARY KEY ("Emp_ID")
);

CREATE TABLE "Suppliers" (
  "Supplier_ID" INT,
  "Product_Type" INT,
  "Supplier_Name" VARCHAR(30),
  PRIMARY KEY ("Supplier_ID"),
  CONSTRAINT "FK_Suppliers.Product_Type"
    FOREIGN KEY("Product_Type")
        References "Types"("Type_ID")
);

CREATE TABLE "Tobacco_Products" (
  "Product_ID" INT,
  "Product_Name" VARCHAR(20),
  "Type_ID" INT,
  "Supplier" INT,
  "Location" INT,
  "Price" DEC(5,2),
  PRIMARY KEY ("Product_ID"),
  CONSTRAINT "FK_Tobacco_Products.Supplier"
    FOREIGN KEY ("Supplier")
      REFERENCES "Suppliers"("Supplier_ID")
);

DROP TABLE "Tobacco_Products";
DROP TABLE "E-Liquid_Products";
DROP TABLE "Misc_Products";

CREATE TABLE "Outlet" (
  "Outlet_ID" INT,
  "Manager_ID" INT,
  "Location" VARCHAR(50),
  PRIMARY KEY ("Outlet_ID")
);

CREATE TABLE "E-Liquid_Products" (
  "Product_ID" INT,
  "Product_Name" VARCHAR(40),
  "Type_ID" INT,
  "Supplier" INT,
  "Location" INT,
  "Price" DEC(5,2),
  PRIMARY KEY ("Product_ID"),
  CONSTRAINT "FK_E-Liquid_Products.Supplier"
    FOREIGN KEY ("Supplier")
      REFERENCES "Suppliers"("Supplier_ID")
);

CREATE TABLE "Misc_Products" (
  "Product_ID" INT,
  "Product_Name" VARCHAR(20),
  "Type_ID" INT,
  "Supplier" INT,
  "Location" INT,
  "Price" DEC(5,2),
  PRIMARY KEY ("Product_ID"),
  CONSTRAINT "FK_Misc_Products.Location"
    FOREIGN KEY ("Location")
      REFERENCES "Outlet"("Outlet_ID")
);

CREATE TABLE "Product_Types" (
  "Type_ID" INT,
  "Product_ID" INT,
  "Product_Name" VARCHAR(20),
  PRIMARY KEY ("Type_ID", "Product_ID")
);

CREATE TABLE "Types" (
  "Type_ID" INT,
  "Type" VARCHAR(15),
  PRIMARY KEY ("Type_ID")
);

/* Populating Existing Entities */
INSERT INTO "Employees" VALUES (1000, 'James', 'Ryan', '03-20-2019', 'Chairman', 100000.00, 557837099, 'james.ryan@virginia.cz', NULL);
INSERT INTO "Employees" VALUES (1001, 'Dylan', 'Fluke', '05-01-2019', 'Manager', 50000.00, 485748398, 'dylan.fluke@virginia.cz', NULL);
INSERT INTO "Employees" VALUES (1002, 'Orhan', 'Yilmaz', '10-01-2019', 'Manager', 50000.00, 444987898, 'orhan.yulmaz@virginia.cz', NULL);
INSERT INTO "Employees" VALUES (1003, 'Jan', 'Havranek', '03-20-2019', 'Manager', 50000.00, 344998989, 'jan.havranek@virginia.cz', NULL);
INSERT INTO "Employees" VALUES (1004, 'Elizaveta', 'Horyn', '10-25-2019', 'Salesperson', 25000.00, 999487298, 'elizaveta.horyn@virginia.cz', 1001);
INSERT INTO "Employees" VALUES (1005, 'Rashid', 'Abdul', '10-25-2019', 'Salesperson', 24500.50, 555987398, 'rashid.abdul@virginia.cz', 1001);
INSERT INTO "Employees" VALUES (1006, 'Ahmed', 'Damir', '10-25-2019', 'Salesperson', 26100.10, 139999487, 'ahmed.damir@virginia.cz', 1001);
INSERT INTO "Employees" VALUES (1007, 'Sanjay', 'Sindh', '11-03-2020', 'Salesperson', 23100.50, 998778665, 'sanjay.sind@virginia.cz', 1002);
INSERT INTO "Employees" VALUES (1008, 'Babatunde', 'Owalabi', '03-01-2020', 'Salesperson', 23150.55, 199388994, 'babatunde.owalabi@virginia.cz', 1003);
INSERT INTO "Employees" VALUES (Emp_ID.Seq.nextval, 'Joshua', 'Fluke', '04-02-2020', 'Salesperson', 23500.55, 999876356, 'joshua.fluke@virginia.cz', 1003);
INSERT INTO "Employees" VALUES ("Emp_Seq".nextval, 'Joshua', 'Fluke', '04-02-2020', 'Salesperson', 23500.55, 999876356, 'joshua.fluke@virginia.cz', 1003);

INSERT INTO "Outlet" VALUES (1, 1001, 'Central');
INSERT INTO "Outlet" VALUES (2, 1002, 'Zizkov');
INSERT INTO "Outlet" VALUES (3, 1003, 'Andel');

INSERT INTO "Suppliers" VALUES (1, 1, 'TO-Bacco');
INSERT INTO "Suppliers" VALUES (2, 2, 'Longstick');
INSERT INTO "Suppliers" VALUES (3, 3, 'Fruitjuice');
INSERT INTO "Suppliers" VALUES (4, 4, 'Nile');
INSERT INTO "Suppliers" VALUES (5, 4, 'Western');

INSERT INTO "Types" VALUES (1, 'Rolling Tobacco');
INSERT INTO "Types" VALUES (2, 'Cigarettes');
INSERT INTO "Types" VALUES (3, 'E-Liquid');
INSERT INTO "Types" VALUES (4, 'No-Nicotine');

INSERT INTO "Tobacco_Products" VALUES (1, 'Virginia Gold 30g', 1, 1, 1, 229.30);
INSERT INTO "Tobacco_Products" VALUES (2, 'Camel 110g', 1, 1, 1, 658.10);
INSERT INTO "Tobacco_Products" VALUES (3, 'Chesterfield 71g', 1, 1, 1, 356.00);
INSERT INTO "Tobacco_Products" VALUES (4, 'Malboro Gold 20ks', 2, 2, 1, 136.33);

INSERT INTO "E-Liquid_Products" VALUES (1, 'Salt Blueberry 10mg 10ml', 3, 3, 1, 125.00);
INSERT INTO "E-Liquid_Products" VALUES (2, 'Salt Cherry 10mg 10ml', 3, 3, 1, 125.00);
INSERT INTO "E-Liquid_Products" VALUES (3, 'Salt Blueberry 20mg 10ml', 3, 3, 1, 125.00);

INSERT INTO "Misc_Products" VALUES(1, 'Cigaretter Roller', 4, 4, 2, 110.00);
INSERT INTO "Misc_Products" VALUES(2, 'IBECO Lighter', 4, 4, 2, 35.00);
INSERT INTO "Misc_Products" VALUES(3, 'OCB Regular Filters', 4, 5, 2, 35.00);

/* Auto Incrementing */
CREATE SEQUENCE "Emp_Seq" START WITH 1008 INCREMENT BY 1 NOCACHE;

CREATE TRIGGER "Emp_AutoIncrement"
BEFORE INSERT ON "Employees"
FOR EACH ROW
BEGIN 
SELECT "Emp_Seq".nextval INTO :new."Emp_ID" FROM DUAL;
END;w
INSERT INTO "Employees" VALUES ("Emp_Seq".nextval, 'Joshua', 'Fluke', '04-02-2020', 'Salesperson', 23500.55, 999876356, 'joshua.fluke@virginia.cz', 1003);

/* Editing Entity Entries */
UPDATE "Employees" SET "Manager_ID" = 1002 WHERE "Emp_ID" = 1006;

/* Querying Existing Data */

/* Employees Entity Queries */
SELECT SUM("Salary") FROM "Employees";
SELECT * FROM "Employees" WHERE "Salary" < 30000 ORDER BY "Emp_ID" ASC;
SELECT LAST_DAY("Date_Employed") FROM "Employees" WHERE "Date_Employed" > '03/31/2020';

/* Tobacco_Products Entity Queries*/
SELECT CEIL(AVG("Price")) FROM "Tobacco_Products";
SELECT COUNT("Product_ID"), "Product_Name" FROM "Tobacco_Products" GROUP BY ("Product_Name");

/* E-Liquid_Products Entity Queries */
SELECT SUM("Price"), "Product_ID" FROM "E-Liquid_Products" GROUP BY ("Product_ID");
SELECT CEIL("Price") FROM "E-Liquid_Products" WHERE "Product_ID" = 1
SELECT * FROM (SELECT * FROM "E-Liquid_Products" ORDER BY "Price" DESC) where ROWNUM <= 3;

/* Misc_Products Entity Queries */
SELECT DISTINCT "Product_Name" FROM "Misc_Products"; 
SELECT "Location" AS "Misc Products Available At" FROM "Misc_Products" ORDER BY "Product_Name" ASC;
SELECT * FROM "Misc_Products" WHERE "Price" = (SELECT MIN("Price") FROM "Misc_Products"); 

/* Outlet Entity Queries */ 
SELECT "Outlet_ID" from "Outlet" INNER JOIN "Tobacco_Products" ON "Tobacco_Products"."Product_ID" = "Outlet_ID";
SELECT * FROM "Outlet" WHERE "Outlet_ID" = (SELECT "Outlet_ID" FROM "Outlet" WHERE "Location" LIKE 'Central');

/* Product_Types Entity Queries */
SELECT FIRST("Product_ID") FROM "Product_Types";
SELECT MIN ("Type_ID") FROM "Product_Types";
SELECT * FROM "Product_Types";

/* Types Entity Queries*/
SELECT * FROM "Types" WHERE "Type" = 'E-Liquid';
SELECT "Type_ID", "Type" FROM "Types" ORDER BY "Type_ID" ASC;