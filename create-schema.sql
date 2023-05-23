-- Recreate schema
DROP TABLE IF EXISTS pizza;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS pizza_ingredients;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_lines;
DROP TABLE IF EXISTS order_custom_ingredients;

CREATE TABLE pizza (ID integer PRIMARY KEY, Name varchar(200), Price currency );
CREATE TABLE ingredients (ID integer PRIMARY KEY, Name varchar(200), Type varchar(20), PortionSize decimal, Stock decimal);
CREATE TABLE customers (ID integer PRIMARY KEY, Name varchar(200), Address text);

CREATE TABLE pizza_ingredients (PizzaID integer NOT NULL, IngredientID integer NOT NULL, Portions decimal NOT NULL,
                                PRIMARY KEY(PizzaID, IngredientID),
                                FOREIGN KEY(PizzaID) REFERENCES pizza(ID),
                                FOREIGN KEY(IngredientID) REFERENCES ingredients(ID));

CREATE TABLE orders (ID integer PRIMARY KEY, CustomerID integer, AmountPaid currency, Date datetime,
                                       FOREIGN KEY(CustomerID) REFERENCES customers(ID));
                                       
CREATE TABLE order_lines (ID integer PRIMARY KEY, OrderID integer, PizzaID integer, Amount integer,
                                       FOREIGN KEY(PizzaID) REFERENCES pizza(ID),
                                       FOREIGN KEY(OrderID) REFERENCES orders(ID));

CREATE TABLE order_custom_ingredients (OrderLineID integer NOT NULL, IngredientID integer NOT NULL, Portions decimal,
                                       PRIMARY KEY(OrderLineID, IngredientID),
                                       FOREIGN KEY(OrderLineID) REFERENCES order_lines(ID),
                                	   FOREIGN KEY(IngredientID) REFERENCES ingredients(ID));

--INSERT DATA								
INSERT INTO pizza (ID, Name, Price) VALUES(1, 'Margarita', 14.50);
INSERT INTO pizza (ID, Name, Price) VALUES(2, 'Pepperoni', 16.50);
INSERT INTO pizza (ID, Name, Price) VALUES(3, 'Hawaii', 15.50);
INSERT INTO pizza (ID, Name, Price) VALUES(4, 'Four Cheese', 17.50);
INSERT INTO pizza (ID, Name, Price) VALUES(5, 'BBQ Chicken', 18.50);
INSERT INTO pizza (ID, Name, Price) VALUES(6, 'CUSTOM', 20.50);

INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(1, 'Cheese', 'Topping', 100.0, 10000.0);
INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(2, 'Mozarella', 'Topping', 100.0, 10000.0);
INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(3, 'Pepperoni', 'Topping', 6.0, 200.0);
INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(4, 'Pineapple', 'Topping', 5.0, 150.0);
INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(5, 'Chicken', 'Topping', 10.0, 350.0);
INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(6, 'Tomato', 'Sauce', 150.0, 5000.0);
INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(7, 'BBQ', 'Sauce', 145.0, 7000.0);
INSERT INTO ingredients (ID, Name, Type, PortionSize, Stock) VALUES(8, 'Ham', 'Topping', 50.0, 900.0);

INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(1, 1, 2.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(1, 6, 1.0);

INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(2, 1, 1.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(2, 3, 1.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(2, 6, 1.0);

INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(3, 1, 1.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(3, 8, 2.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(3, 6, 2.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(3, 4, 1.0);

INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(4, 1, 2.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(4, 2, 2.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(4, 6, 1.0);

INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(5, 1, 2.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(5, 5, 1.0);
INSERT INTO pizza_ingredients (PizzaID, IngredientID, Portions) VALUES(5, 7, 1.0);

INSERT INTO customers (ID, Name, Address) VALUES(1, 'Henk', 'Homestreet 1');
INSERT INTO customers (ID, Name, Address) VALUES(2, 'Peter', 'Homestreet 2');
INSERT INTO customers (ID, Name, Address) VALUES(3, 'Sonia', 'Homestreet 3');
INSERT INTO customers (ID, Name, Address) VALUES(4, 'Madeline', 'Homestreet 4');

INSERT INTO orders (ID, CustomerID, AmountPaid, Date) VALUES(1, 1, 30.00, '2023-05-01 17:30');
INSERT INTO order_lines (ID, OrderID, PizzaID, Amount) VALUES(1, 1, 1, 2);

INSERT INTO orders (ID, CustomerID, AmountPaid, Date) VALUES(2, 1, 72.00, '2023-05-02 18:00');
INSERT INTO order_lines (ID, OrderID, PizzaID, Amount) VALUES(2, 2, 3, 2);
INSERT INTO order_lines (ID, OrderID, PizzaID, Amount) VALUES(3, 2, 5, 2);

INSERT INTO orders (ID, CustomerID, AmountPaid, Date) VALUES(3, 3, 85.00, '2023-05-11 17:45');
INSERT INTO order_lines (ID, OrderID, PizzaID, Amount) VALUES(4, 3, 2, 5);

INSERT INTO orders (ID, CustomerID, AmountPaid, Date) VALUES(4, 2, 72.00, '2023-05-21 18:10');
INSERT INTO order_lines (ID, OrderID, PizzaID, Amount) VALUES(5, 4, 2, 2);
INSERT INTO order_lines (ID, OrderID, PizzaID, Amount) VALUES(6, 4, 6, 2);

INSERT INTO order_custom_ingredients (OrderLineID, IngredientID, Portions) VALUES(6, 1, 1.0);
INSERT INTO order_custom_ingredients (OrderLineID, IngredientID, Portions) VALUES(6, 2, 1.0);
INSERT INTO order_custom_ingredients (OrderLineID, IngredientID, Portions) VALUES(6, 3, 1.0);
INSERT INTO order_custom_ingredients (OrderLineID, IngredientID, Portions) VALUES(6, 5, 1.0);
INSERT INTO order_custom_ingredients (OrderLineID, IngredientID, Portions) VALUES(6, 8, 1.0);
