CREATE TABLE "Employees" (
  "Emp_ID" INT,
  "Name" VARCHAR(15),
  "Surname" VARCHAR(20),
  "Date_Employed" DATE,
  "Role" VARCHAR(30),
  "Salary" NUMBER(4,2),
  "Contact_No" NUMBER(9),
  "Email" VARCHAR(30),
  "Manager_ID" INT,
  PRIMARY KEY ("Emp_ID")
);

CREATE TABLE "Suppliers" (
  "Supplier_ID" INT,
  "Product_Type" INT,
  "Supplier_Name" VARCHAR(30),
  PRIMARY KEY ("Supplier_ID")
);

CREATE TABLE "Tobacco_Products" (
  "Product_ID" INT,
  "Product_Name" VARCHAR(20),
  "Type_ID" INT,
  "Supplier" INT,
  "Location" INT,
  "Price" DEC(3,2),
  PRIMARY KEY ("Product_ID"),
  CONSTRAINT "FK_Tobacco_Products.Supplier"
    FOREIGN KEY ("Supplier")
      REFERENCES "Suppliers"("Supplier_ID")
);

CREATE TABLE "Outlet" (
  "Outlet_ID" INT,
  "Manager_ID" INT,
  "Location" VARCHAR(50),
  PRIMARY KEY ("Outlet_ID")
);

CREATE TABLE "E-Liquid_Products" (
  "Product_ID" INT,
  "Product_Name" VARCHAR(20),
  "Type_ID" INT,
  "Supplier" INT,
  "Location" INT,
  "Price" DEC(3,2),
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
  "Price" DEC(3,2),
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
  PRIMARY KEY ("Type_ID"),
  CONSTRAINT "FK_Types.Type_ID"
    FOREIGN KEY ("Type_ID")
      REFERENCES "Suppliers"("Product_Type")
);

