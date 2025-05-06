-- 📝 Assignment: Database Design and Normalization
-- 👇 Answer for Question 1: Achieving 1NF (First Normal Form)

-- Original table (for context, not needed if already exists):
-- ProductDetail(OrderID, CustomerName, Products)

-- Create a new table in 1NF with atomic values:
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Insert data with one product per row (no multivalued attributes):
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ✅ This table now satisfies First Normal Form (1NF)

-- --------------------------------------------------------------------------------------

-- 👇 Answer for Question 2: Achieving 2NF (Second Normal Form)

-- Step 1: Create a new table Orders to separate CustomerName (which depends only on OrderID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert unique OrderID and CustomerName combinations
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create OrderItems table where all non-key columns depend on full composite key
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert item data
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

