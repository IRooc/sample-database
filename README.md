# sample-database
sample database to practice queries

## use existing demo database
Clone the repository to a local folder
```cmd
git clone https://github.com/IRooc/sample-database.git
```
Go to [https://sqliteonline.com](https://sqliteonline.com) and select `File > Open DB` from the menu and select the file `sqlite_pizza_demo.db` from the local folder.


## or create new the database 
Go to [https://sqliteonline.com](https://sqliteonline.com) and paste in the contents from [create-schema.sql](https://raw.githubusercontent.com/IRooc/sample-database/main/docs/create-schema.sql) and click RUN.


## start querying
You now have a filled database where you can look around and start querying.

Example Query, (ingredient usage for all normal pizza's):

```sql
SELECT ingredients.Name, ingredients.portionsize * SUM(pizza_ingredients.portions) UsedAmount, COUNT(*) UsedCount
FROM pizza 
JOIN pizza_ingredients on pizza.ID = pizza_ingredients.PizzaID
JOIN ingredients on ingredients.ID = pizza_ingredients.IngredientID
GROUP BY ingredients.Name, ingredients.portionsize
```

Query getting the ingredients used in current orders:

```sql
SELECT IFNULL(ingredients2.Name, ingredients.Name), count(*)
FROM orders
JOIN order_lines on orders.ID = order_lines.orderid
LEFT JOIN order_custom_ingredients ON order_lines.ID = order_custom_ingredients.OrderLineID
LEFT JOIN ingredients ingredients2 on order_custom_ingredients.IngredientID = ingredients2.id
LEFT JOIN pizza on order_lines.pizzaid = pizza.id
LEFT JOIN pizza_ingredients ON pizza.id = pizza_ingredients.pizzaid
LEFT JOIN ingredients on pizza_ingredients.ingredientid = ingredients.id
GROUP BY IFNULL(ingredients2.name, ingredients.name)
```
