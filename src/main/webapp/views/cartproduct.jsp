<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My Cart</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
    integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
    body { background-color: #f5f5f5; }
    .cart-header { background: linear-gradient(135deg, #1a1a2e, #16213e); color: white; padding: 15px 20px; }
    .cart-header .navbar-brand { font-size: 1.4rem; font-weight: 700; color: #ffd700; }
    .cart-header a { color: #ccc; }
    .cart-header a:hover { color: white; text-decoration: none; }
    .page-title { font-size: 1.8rem; font-weight: 700; color: #1a1a2e; margin: 30px 0 20px; }
    .cart-table { background: white; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); overflow: hidden; }
    .cart-table thead { background: #1a1a2e; color: white; }
    .cart-table thead th { padding: 14px 18px; font-weight: 600; border: none; }
    .cart-table tbody td { padding: 14px 18px; vertical-align: middle; border-bottom: 1px solid #f0f0f0; }
    .cart-table tbody tr:last-child td { border-bottom: none; }
    .cart-table tbody tr:hover { background: #fafafa; }
    .product-img { width: 70px; height: 70px; object-fit: cover; border-radius: 8px; border: 2px solid #eee; }
    .product-name { font-weight: 600; color: #333; }
    .price-badge { background: #e8f5e9; color: #2e7d32; padding: 4px 10px; border-radius: 20px; font-weight: 700; }
    .btn-remove { background: #fff0f0; color: #c0392b; border: 1px solid #f5c6cb; border-radius: 20px; padding: 5px 14px; font-size: 0.85rem; }
    .btn-remove:hover { background: #c0392b; color: white; text-decoration: none; }
    .cart-summary { background: white; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 25px; margin-top: 20px; }
    .total-row { font-size: 1.3rem; font-weight: 700; color: #1a1a2e; border-top: 2px solid #eee; padding-top: 15px; margin-top: 10px; }
    .btn-checkout { background: linear-gradient(135deg, #f39c12, #e67e22); color: white; border: none; padding: 12px 35px; font-size: 1rem; font-weight: 700; border-radius: 30px; letter-spacing: 0.5px; }
    .btn-checkout:hover { background: linear-gradient(135deg, #e67e22, #d35400); color: white; text-decoration: none; transform: translateY(-1px); box-shadow: 0 4px 12px rgba(230,126,34,0.4); }
    .btn-continue { background: transparent; color: #1a1a2e; border: 2px solid #1a1a2e; padding: 11px 30px; font-size: 1rem; font-weight: 600; border-radius: 30px; }
    .btn-continue:hover { background: #1a1a2e; color: white; text-decoration: none; }
    .empty-cart { text-align: center; padding: 80px 20px; color: #888; }
    .empty-cart i { font-size: 5rem; color: #ddd; margin-bottom: 20px; }
    .empty-cart h4 { font-size: 1.5rem; color: #aaa; }
    .badge-count { background: #ffd700; color: #1a1a2e; border-radius: 50%; width: 22px; height: 22px; display: inline-flex; align-items: center; justify-content: center; font-size: 0.75rem; font-weight: 700; margin-left: 5px; }
</style>
</head>
<body>

<nav class="cart-header navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="/"><i class="fas fa-store mr-2"></i>FreshMart</a>
        <div class="ml-auto d-flex align-items-center">
            <a href="/user/products" class="mr-4"><i class="fas fa-shopping-basket mr-1"></i>Products</a>
            <a href="/profileDisplay" class="mr-4"><i class="fas fa-user mr-1"></i>${username}</a>
            <a href="/logout"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a>
        </div>
    </div>
</nav>

<div class="container mt-4">

    <div class="page-title">
        <i class="fas fa-shopping-cart mr-2" style="color:#ffd700;"></i>
        My Cart
        <c:if test="${not empty cartProducts}">
            <span class="badge-count">${cartProducts.size()}</span>
        </c:if>
    </div>

    <c:choose>
        <c:when test="${empty cartProducts}">
            <div class="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <h4>Your cart is empty</h4>
                <p class="mb-4">Looks like you haven't added anything to your cart yet!</p>
                <a href="/user/products" class="btn-checkout" style="text-decoration:none; padding: 12px 35px; border-radius: 30px;">
                    <i class="fas fa-shopping-basket mr-2"></i>Browse Products
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="cart-table">
                <table class="table mb-0">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${cartProducts}">
                            <tr>
                                <td>
                                    <img src="${product.image}" alt="${product.name}" class="product-img"
                                         onerror="this.src='https://via.placeholder.com/70x70?text=No+Image'">
                                </td>
                                <td>
                                    <div class="product-name">${product.name}</div>
                                    <small class="text-muted">${product.description}</small>
                                </td>
                                <td>
                                    <span class="price-badge">$${product.price}</span>
                                </td>
                                <td>
                                    <a href="/cart/remove?productId=${product.id}" class="btn-remove">
                                        <i class="fas fa-trash-alt mr-1"></i>Remove
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="cart-summary">
                <div class="d-flex justify-content-between align-items-center total-row">
                    <span>Total Amount</span>
                    <span style="color: #e67e22;">$${total}</span>
                </div>
                <div class="d-flex justify-content-between mt-4">
                    <a href="/user/products" class="btn-continue">
                        <i class="fas fa-arrow-left mr-2"></i>Continue Shopping
                    </a>
                    <a href="/buy" class="btn-checkout">
                        <i class="fas fa-credit-card mr-2"></i>Checkout
                    </a>
                </div>
            </div>

        </c:otherwise>
    </c:choose>

</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>