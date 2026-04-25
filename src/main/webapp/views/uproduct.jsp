<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Products - Vijay Shop</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
  <style>
    :root { --primary: #00b341; --primary-dark: #008c32; --dark: #0d1117; --dark2: #161b22; --card-bg: #1c2230; --gold: #f0c040; --muted: #8b949e; }
    * { box-sizing: border-box; }
    body { font-family: 'Poppins', sans-serif; background: var(--dark); color: #e6edf3; min-height: 100vh; margin: 0; }
    .vs-nav { background: var(--dark2); border-bottom: 2px solid var(--primary); padding: 12px 30px; display: flex; align-items: center; justify-content: space-between; position: sticky; top: 0; z-index: 100; box-shadow: 0 2px 20px rgba(0,0,0,0.5); }
    .vs-brand { font-size: 1.6rem; font-weight: 800; color: var(--primary); text-decoration: none; }
    .vs-brand span { color: var(--gold); }
    .vs-nav-links { display: flex; align-items: center; gap: 8px; }
    .vs-nav-links a { color: #cdd9e5; text-decoration: none; padding: 8px 16px; border-radius: 8px; font-size: 0.9rem; font-weight: 500; transition: all 0.2s; }
    .vs-nav-links a:hover { background: rgba(0,179,65,0.15); color: var(--primary); text-decoration: none; }
    .btn-cart { background: var(--primary) !important; color: white !important; border-radius: 20px !important; padding: 8px 20px !important; font-weight: 600 !important; }
    .btn-cart:hover { background: var(--primary-dark) !important; color: white !important; transform: translateY(-1px); }

    .page-header { background: linear-gradient(135deg, #0a2e14, #0d1117); padding: 40px 30px; border-bottom: 1px solid rgba(0,179,65,0.15); }
    .page-header h1 { font-size: 2rem; font-weight: 800; margin-bottom: 4px; }
    .page-header h1 span { color: var(--primary); }
    .page-header p { color: var(--muted); font-size: 0.9rem; }

    .vs-section { padding: 36px 30px; max-width: 1400px; margin: 0 auto; }
    .product-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(230px, 1fr)); gap: 22px; }
    .product-card { background: var(--card-bg); border: 1px solid rgba(255,255,255,0.07); border-radius: 16px; overflow: hidden; transition: all 0.3s; display: flex; flex-direction: column; }
    .product-card:hover { transform: translateY(-5px); border-color: var(--primary); box-shadow: 0 10px 30px rgba(0,179,65,0.2); }
    .product-card .img-wrap { height: 180px; overflow: hidden; background: #0d1117; display: flex; align-items: center; justify-content: center; }
    .product-card .img-wrap img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.4s; }
    .product-card:hover .img-wrap img { transform: scale(1.06); }
    .product-card .card-info { padding: 16px; flex: 1; display: flex; flex-direction: column; }
    .cat-badge { display: inline-block; background: rgba(0,179,65,0.12); color: var(--primary); font-size: 0.72rem; font-weight: 600; padding: 3px 10px; border-radius: 20px; margin-bottom: 8px; text-transform: uppercase; }
    .product-card h5 { font-weight: 700; font-size: 1rem; color: #e6edf3; margin-bottom: 5px; }
    .product-card .desc { font-size: 0.82rem; color: var(--muted); margin-bottom: 14px; flex: 1; }
    .card-footer-row { display: flex; align-items: center; justify-content: space-between; margin-top: auto; }
    .price { font-size: 1.3rem; font-weight: 800; color: var(--gold); }
    .price small { font-size: 0.75rem; font-weight: 400; color: var(--muted); }
    .btn-add-cart { background: var(--primary); color: white; border: none; border-radius: 20px; padding: 8px 18px; font-size: 0.85rem; font-weight: 600; cursor: pointer; transition: all 0.2s; text-decoration: none; display: inline-flex; align-items: center; gap: 6px; }
    .btn-add-cart:hover { background: var(--primary-dark); color: white; text-decoration: none; transform: scale(1.04); }
    .empty-state { text-align: center; padding: 80px 20px; color: var(--muted); }
    .empty-state i { font-size: 4rem; color: rgba(0,179,65,0.3); margin-bottom: 16px; }
    .vs-footer { background: var(--dark2); border-top: 1px solid rgba(255,255,255,0.06); text-align: center; padding: 20px; color: var(--muted); font-size: 0.85rem; margin-top: 60px; }
    .vs-footer strong { color: var(--primary); }
  </style>
</head>
<body>

<nav class="vs-nav">
  <a href="/" class="vs-brand">Vijay<span>Shop</span></a>
  <div class="vs-nav-links">
    <a href="/"><i class="fas fa-home mr-1"></i>Home</a>
    <a href="/cart" class="btn-cart"><i class="fas fa-shopping-cart mr-1"></i>My Cart</a>
    <a href="/profileDisplay"><i class="fas fa-user mr-1"></i>Profile</a>
    <a href="/logout"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a>
  </div>
</nav>

<div class="page-header">
  <h1>Shop <span>All Products</span></h1>
  <p>Browse our fresh selection and add your favourites to the cart</p>
</div>

<div class="vs-section">
  <c:choose>
    <c:when test="${empty products}">
      <div class="empty-state">
        <i class="fas fa-shopping-basket"></i>
        <h4 style="color:#8b949e;">No products available yet.</h4>
      </div>
    </c:when>
    <c:otherwise>
      <div class="product-grid">
        <c:forEach var="product" items="${products}">
          <div class="product-card">
            <div class="img-wrap">
              <img src="${product.image}" alt="${product.name}"
                   onerror="this.src='https://via.placeholder.com/300x180?text=No+Image'">
            </div>
            <div class="card-info">
              <span class="cat-badge">${product.category.name}</span>
              <h5>${product.name}</h5>
              <p class="desc">${product.description}</p>
              <div class="card-footer-row">
                <div class="price">$${product.price} <small>/ unit</small></div>
                <a href="/cart/add?id=${product.id}" class="btn-add-cart">
                  <i class="fas fa-cart-plus"></i> Add
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<div class="vs-footer">&copy; 2024 <strong>Vijay Shop</strong>. All rights reserved.</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>