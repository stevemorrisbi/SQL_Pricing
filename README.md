# Pricing Discount Strategy

### Developing a SQL query to calculate a discount percentage for different segmentation of customers.

### The SQL script can be found in this repository.
---
#### About this project:
#### Taking an Orders table and a Customers table - Nested CASE statements have been utilised to develop a calculation of different discount percentages for customers. 
#### The discount percentages take into account the total customer spend along with the total number of orders from 'People' and 'Businesses'.

--- 
#### Query Explained:

The multiple CASE statements allows for conditional logic for seperating and calculating a discount. In order to join the Customers Table and the Orders Table an Inner Join is used to ensure all matching records between both tables. The subquery in which the join is made onto the Customers table is used for the aggregations of the Sum of order spend and Count of the orders for each Customer (using data from the Orders table). The Customer Key is used for the GROUP BY to tell us this information for each customer and then the Customer Key has been used as the joining key. 
