# Laravel Vue Shopping Cart

This project is a simple e-commerce shopping cart system built with Laravel and Vue.js.  
It allows authenticated users to browse products, add them to a cart, update quantities, and remove items.

The application follows Laravel best practices and uses the official Laravel authentication starter kit.

## Implemented Feature:
•	Implemented user authentication and authorization.
•	Developed a product catalog with shopping cart functionality (add/remove items).
•	Implemented Cash on Delivery checkout with shipping address management.
•	Developed inventory management logic that automatically detects low stock levels. 
•	Implemented automatic low-stock email notifications using Laravel Jobs. 
•	Created scheduled daily sales report using Laravel Task Scheduler and a custom Artisan Command
•	Built responsive user interfaces in Vue.js integrated with Laravel through Inertia.js.


---

## Application Features

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
- Submit order
- Stock validation

Each shopping cart is linked to the authenticated user via the `User` model.  
Cart actions are persisted in the database and are not handled through sessions or local storage.

---

## Tech Stack

- **Backend:**  PHP, Laravel
- **Frontend:** Vue.js, Inertia.js
- **Styling:** Tailwind CSS
- **Database:** MySQL
---

## Project Structure

The application follows the MVC pattern:

### Models: 
- User
- Category
- Product
- Cart
- Order
- City

### Controllers (Handle cart and product logic): 
- CartController
- CategoryController
- HomeController
- OrderController
- ProductController

### Vue components (Manage frontend interactions):
- MainLayout.vue
- Footer.vue
- Header.vue
- Cart.vue
- Category.vue
- Home.vue
- Order.vue
- Product.vue

### Database migrations (Define product and cart structure):      
- create_carts_table
- create_category_table
- create_products_table
- create_cart_product_table
- create_city_table
- create_orders
- create_order_product
- add_cart_status_cart_table

### Seeders (Seed tables in database): 
- CategorySeeder
- CitySeeder
- ProductSeeder

---

## Installation
Requirements: PHP 8.x, Composer, Node.js, npm, MySQL
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <project-folder>
   ```
2. Install PHP dependencies
   ```bash
    composer install
   ```
3. Install Node.js dependencies
   ```bash
    npm install
   ```
4. Configure the environment 
   - Copy `env.example` to `.env`
   - Configure your database connection
5. Generate the application key
    ```bash
    php artisan key:generate
   ```
6. Run database migration
    ```bash
    php artisan migrate
   ```
7. Populate the database with sample data
   ```bash
    php artisan db:seed
   ```
8. Start the development server
    npm run dev
    php artisan serve

## Notes
This project was created as a learning project to practice Laravel, Vue.js, and Inertia.js while implementing common e-commerce workflows and backend practices.
