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


# Clone project
git clone https://github.com/vijayakumardevforge/vijay-shop-springboot-ecommerce-.git

# Navigate to project
cd vijay-shop-springboot-ecommerce

# Run application
./mvnw spring-boot:run

🔑 Default Login

| Role  | Username | Password |
| ----- | -------- | -------- |
| Admin | admin    | 123      |
| User  | vijay    | 123      |



📸 **Screenshots**


🔐 User Login



<img width="1911" height="909" alt="Image" src="https://github.com/user-attachments/assets/e253f7e6-97e2-40df-9bc1-bf06e18cda8e" />



📝 Register Screen



<img width="1905" height="908" alt="Image" src="https://github.com/user-attachments/assets/cdeebde7-32d4-45c6-8343-3f8c6a563a48" />



🛍️ Product Screen



<img width="1919" height="850" alt="Image" src="https://github.com/user-attachments/assets/a9004249-52bb-45a6-b339-65055cefdc64" />



🛒 Cart Screen



<img width="1914" height="910" alt="Image" src="https://github.com/user-attachments/assets/599ebdd5-4e8f-4137-bd03-3616b7415d4a" />



👤 User Profile



<img width="1917" height="908" alt="Image" src="https://github.com/user-attachments/assets/bcc0370b-30a9-47bf-b6b2-6109ebd37b95" />



🔐 Admin Login



<img width="1747" height="934" alt="Image" src="https://github.com/user-attachments/assets/5c9e8299-3d25-4b3c-a761-c2457927f909" />



⚙️ Admin Dashboard



<img width="1912" height="882" alt="Image" src="https://github.com/user-attachments/assets/6078237b-5442-4fd8-8792-d494067cd57e" />



📂 Categories



<img width="1792" height="871" alt="Image" src="https://github.com/user-attachments/assets/f2bd6739-0063-4504-a7e2-27fd2a53fab1" />



👥 Customers



<img width="1917" height="539" alt="Image" src="https://github.com/user-attachments/assets/0bfcd93e-c0a3-4336-8b10-af5f4d25dba3" />



➕ Add Products



<img width="1837" height="890" alt="Image" src="https://github.com/user-attachments/assets/1c3af4c8-776a-4ada-bc1e-8c077674de9a" />


📦 **Project Structure**


controller/

service/

dao/

model/

config/

views/


💡 **Highlights**


Full MVC architecture

Role-based authentication system

Real-world e-commerce workflow

Backend-focused implementation


📌 **Future Improvements**


Payment integration

Order tracking

REST API version

Deployment (AWS / Docker)
