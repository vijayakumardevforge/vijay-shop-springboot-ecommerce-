# 🛒 Vijay Shop – Spring Boot E-Commerce

A full-stack E-Commerce web application built using **Spring Boot, Spring Security, Hibernate, and JSP** with role-based authentication for Admin and Users.

---

## 🚀 Features

- 🔐 Secure Authentication (Admin & User)
- 🛍️ Product browsing & cart system
- 🧾 User registration & profile management
- 🛠️ Admin dashboard (Products, Categories, Customers)
- 🔒 BCrypt password encryption
- 🎨 Modern UI using Bootstrap

---

## 🏗️ Architecture

Browser (JSP Pages)  
      ↕  
Spring MVC Controllers  
      ↕  
Service Layer (Business Logic)  
      ↕  
DAO Layer (Hibernate)  
      ↕  
H2 Database  

---

## 🛠️ Tech Stack

- Java 11  
- Spring Boot  
- Spring MVC  
- Spring Security  
- Hibernate ORM  
- H2 Database  
- JSP + JSTL  
- Bootstrap  

---

## ▶️ How to Run

```bash
# Clone project
git clone https://github.com/your-username/vijay-shop-springboot-ecommerce.git

# Navigate to project
cd vijay-shop-springboot-ecommerce

# Run application
./mvnw spring-boot:run

🔑 Default Login
Role	Username	Password
Admin	admin	123
User	lisa	765
📸 Screenshots
🔐 User Login

📝 Register Screen

🛍️ Product Screen

🛒 Cart Screen

👤 User Profile

🔐 Admin Login

⚙️ Admin Dashboard

📂 Categories

👥 Customers

➕ Add Products

📦 Project Structure
controller/
service/
dao/
model/
config/
views/
💡 Highlights
Full MVC architecture
Role-based authentication system
Real-world e-commerce workflow
Backend-focused implementation
📌 Future Improvements
Payment integration
Order tracking
REST API version
Deployment (AWS / Docker)
