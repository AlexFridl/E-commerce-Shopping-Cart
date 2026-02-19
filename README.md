# Laravel Vue Shopping Cart

This project is a simple e-commerce shopping cart system built with Laravel and Vue.  
It allows authenticated users to browse products, add them to a cart, update quantities, and remove items.

The application follows Laravel best practices and uses built-in authentication from the official starter kit.

---

## Features

- User authentication (Laravel starter kit)
- Product listing (name, price, stock quantity)
- Add products to cart
- Update cart item quantities
- Remove items from cart
- Cancel cart
- Cart associated with authenticated users (stored in database)
- Stock validation on add/update actions
- Create order
- Cancel order
- Send order

Each shopping cart is linked to the authenticated user via the `User` model.  
Cart actions are persisted in the database and are not handled through sessions or local storage.

---

## Tech Stack

- **Backend:** Laravel
- **Frontend:** Vue (Laravel starter kit)
- **Styling:** Tailwind CSS
- **Database:** MySQL

---

## Project Structure

The application follows the MVC pattern:

- Models: User, Category, Product, Cart, Order, City
- Controllers (Handle cart and product logic): CartController, CategoryController, HomeController, OrderController, ProductController
- Vue components (Manage frontend interactions): MainLayout.vue, Footer.vue, Header.vue, Cart.vue, Category.vue, Home.vue, Order.vue, Product.vue
- Database migrations (Define product and cart structure):      2026_01_26_113800_create_carts_table.php
2026_01_26_113850_create_category_table.php
2026_01_26_113858_create_products_table.php
2026_01_26_113875_create_cart_product_table.php
2026_01_26_120001_create_city_table.php
2026_01_26_120010_create_orders.php
2026_01_26_120018_create_order_product.php
2026_01_29_200940_add_cart_status_cart_table.php
- Seeders (Seed tables in database): CategorySeede.php, CitySeeder.php, ProductSeeder.php


---

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
2. Install dependencies
    composer install
    npm install
3. Install Node dependencies (for Vue and Tailwind)
    npm install
3. Configure environmen
    Copy .env.example to .env
    Set database credentials
4. Run migrations
    php artisan migrate
5. Start the development server
    npm run dev
    php artisan serve

## Notes
This project was created as a technical exercise focused on implementing a clean and structured shopping cart system using Laravel authentication and Vue for frontend interacion. 
Application should be accessible at http://127.0.0.1:8000.
