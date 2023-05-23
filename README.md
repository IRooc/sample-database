# sample-database
sample database to practice queries

## create the database 
Go to [https://sqliteonline.com](https://sqliteonline.com) and paste in the contents from `create-schema.sql` and click RUN.

You now have a filled database where you can look around and start querying.

Example Query, (ingredient usage for all pizza's):
```sql
SELECT ingredients.Name, ingredients.portionsize * SUM(pizza_ingredients.portions) UsedAmount, COUNT(*) UsedCount
FROM pizza 
JOIN pizza_ingredients on pizza.ID = pizza_ingredients.PizzaID
JOIN ingredients on ingredients.ID = pizza_ingredients.IngredientID
GROUP BY ingredients.Name, ingredients.portionsize
```
