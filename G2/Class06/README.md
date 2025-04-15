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

### 🍕 Pizzas

- **Each pizza**:
  - Can have **multiple toppings**
  - Has **one size**
  - Belongs to **one order**
- **Pizza Information:**
  - Name
  - Price (specific to this pizza)
  - Size ID (foreign key to Pizza Sizes)
  - Order ID (foreign key to Orders)

---

### 🛒 Orders

- **Each order**:
  - Belongs to **one user**
  - Can include **multiple pizzas**
- **Order Information:**
  - Is Delivered (boolean)
  - Price (for the delivery itself)
  - User ID (foreign key to Users)

---

### 🧀 Toppings

- **Each topping** can be used in **multiple pizzas** (many-to-many relationship).
- **Topping Information:**
  - Name
  - Price (per topping)

---

### 📏 Pizza Sizes

- **Each size** can be associated with **multiple pizzas**.
- **Size Information:**
  - Name (e.g., Small, Medium, Large)

---

## 🔁 Relationships Summary

- **User** 1 — ∞ **Order**  
- **Order** 1 — ∞ **Pizza**  
- **Pizza** ∞ — ∞ **Topping**  
- **Pizza Size** 1 — ∞ **Pizza**

---
