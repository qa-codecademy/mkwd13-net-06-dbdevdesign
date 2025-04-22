# 🍕 Pizza Ordering App - Database Design

This document outlines the database structure for a Pizza Ordering App. The system is designed to manage users, pizzas, orders, toppings, and pizza sizes effectively.

---

## 📦 Entities & Relationships

### 👤 Users

- **Each user** can have **multiple orders**.
- **User Information:**
  - First Name
  - Last Name
  - Address
  - Phone

---

### 🛒 Orders

- **Each order**:
  - Belongs to **one user**.
  - Can include **multiple pizzas**.
- **Order Information:**
  - Is Delivered (boolean)
  - TotalPrice (for the entire order)
  - UserId

---

### 🍕 Pizzas

- **Each pizza**:
  - Can have **multiple toppings**.
  - Belongs to **multiple orders**.
- **Pizza Information:**
  - Name (e.g. Margherita, Pepperoni etc.)
  - Price (base price of the pizza without toppings)
  - Description (e.g. the pizza's ingredients, optional)

---

### 🧀 Toppings

- **Each topping** can be used in **multiple pizzas**.
- **Topping Information:**
  - Name (e.g. Extra Cheese, Bacon, Olives)
  - Price (per topping)

---

### 📏 Pizza Sizes

- **Each size** can be associated with **multiple pizzas**.
- **Size Information:**
  - Name (e.g., Small, Medium, Large)

---

## 📃 Extra Requirements

1. Create a scalar function named `GetFullName` that accepts a `UserId` and returns the concatenated full name (`FirstName + ' ' + LastName`) of the user.
2. There should be a view to show all pizzas that are not delivered yet and the full names of the users waiting for them.
3. There should be a view that lists pizzas by the number of times ordered (Call this view ordered by the most popular pizza on top).
4. There should be a view with users and the amount of pizzas they ordered.
5. There should be a function that when provided an Order Id, can return the full price of a whole order (All Pizza + All Toppings + Quantity) 