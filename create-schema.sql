DROP TABLE IF EXISTS pizza;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS pizza_ingredients;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_custom_ingredients;

CREATE TABLE pizza (ID integer PRIMARY KEY, Name varchar(200), Price currency );
CREATE TABLE ingredients (ID integer PRIMARY KEY, Name varchar(200), Type varchar(20), PortionSize decimal, Stock decimal);
CREATE TABLE customers (ID integer PRIMARY KEY, Name varchar(200), Address text);

CREATE TABLE pizza_ingredients (PizzaID integer NOT NULL, IngredientID integer NOT NULL, Portions decimal NOT NULL,
                                PRIMARY KEY(PizzaID, IngredientID),
                                FOREIGN KEY(PizzaID) REFERENCES pizza(ID),
                                FOREIGN KEY(IngredientID) REFERENCES ingredients(ID));

CREATE TABLE orders (ID integer PRIMARY KEY, CustomerID integer, PizzaID integer, Cost currency, Date datetime,
                                       FOREIGN KEY(PizzaID) REFERENCES pizza(ID),
                                       FOREIGN KEY(CustomerID) REFERENCES customers(ID));
                                       
CREATE TABLE order_custom_ingredients (OrderID integer NOT NULL, IngredientID integer NOT NULL, Portions decimal,
                                       PRIMARY KEY(OrderID, IngredientID),
                                       FOREIGN KEY(OrderID) REFERENCES orders(ID),
                                	   FOREIGN KEY(IngredientID) REFERENCES ingredients(ID));

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

