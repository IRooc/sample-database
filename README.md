# sample-database
sample database to practice queries

## use existing demo database
Go to [https://sqliteonline.com](https://sqliteonline.com) and select `File > Open DB` from the menu and select the file `sqlite_pizza_demo.db` .


## or create new the database 
Go to [https://sqliteonline.com](https://sqliteonline.com) and paste in the contents from `create-schema.sql` and click RUN.

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
