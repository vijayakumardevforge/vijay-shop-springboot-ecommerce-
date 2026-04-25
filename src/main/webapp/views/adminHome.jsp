<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Panel - Vijay Shop</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
  <style>
    :root { --primary: #00b341; --primary-dark: #008c32; --dark: #0d1117; --dark2: #161b22; --card-bg: #1c2230; --gold: #f0c040; --muted: #8b949e; }
    * { box-sizing: border-box; }
    body { font-family: 'Poppins', sans-serif; background: var(--dark); color: #e6edf3; min-height: 100vh; margin: 0; }

    .vs-nav { background: var(--dark2); border-bottom: 2px solid var(--primary); padding: 12px 30px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 2px 20px rgba(0,0,0,0.5); }
    .vs-brand { font-size: 1.6rem; font-weight: 800; color: var(--primary); text-decoration: none; }
    .vs-brand span { color: var(--gold); }
    .vs-badge { background: rgba(240,192,64,0.15); border: 1px solid var(--gold); color: var(--gold); padding: 4px 12px; border-radius: 20px; font-size: 0.75rem; font-weight: 600; }
    .vs-nav-links { display: flex; gap: 8px; }
    .vs-nav-links a { color: #cdd9e5; text-decoration: none; padding: 8px 16px; border-radius: 8px; font-size: 0.9rem; transition: all 0.2s; }
    .vs-nav-links a:hover { background: rgba(0,179,65,0.15); color: var(--primary); }
    .vs-nav-links .btn-logout { background: rgba(255,80,80,0.1); color: #ff6b6b; border-radius: 8px; }
    .vs-nav-links .btn-logout:hover { background: rgba(255,80,80,0.2); }

    .vs-hero { background: linear-gradient(135deg, #0a2e14, #0d1117, #1a1a2e); padding: 50px 30px; text-align: center; border-bottom: 1px solid rgba(0,179,65,0.15); }
    .vs-hero h1 { font-size: 2.4rem; font-weight: 800; margin-bottom: 6px; }
    .vs-hero h1 span { color: var(--primary); }
    .vs-hero p { color: var(--muted); font-size: 1rem; }

    .vs-section { padding: 40px 30px; max-width: 1200px; margin: 0 auto; }
    .vs-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px; }

    .vs-card {
      background: var(--card-bg); border: 1px solid rgba(255,255,255,0.07); border-radius: 16px;
      padding: 30px 24px; text-align: center; transition: all 0.3s; cursor: pointer; text-decoration: none; display: block;
    }
    .vs-card:hover { transform: translateY(-5px); border-color: var(--primary); box-shadow: 0 10px 30px rgba(0,179,65,0.15); text-decoration: none; }
    .vs-card .icon-wrap { width: 70px; height: 70px; border-radius: 18px; display: flex; align-items: center; justify-content: center; margin: 0 auto 18px; font-size: 2rem; }
    .vs-card .icon-wrap.green { background: rgba(0,179,65,0.15); color: var(--primary); }
    .vs-card .icon-wrap.gold { background: rgba(240,192,64,0.15); color: var(--gold); }
    .vs-card .icon-wrap.blue { background: rgba(88,166,255,0.15); color: #58a6ff; }
    .vs-card .icon-wrap.purple { background: rgba(188,140,255,0.15); color: #bc8cff; }
    .vs-card h4 { font-weight: 700; color: #e6edf3; font-size: 1.1rem; margin-bottom: 8px; }
    .vs-card p { color: var(--muted); font-size: 0.85rem; margin-bottom: 20px; }
    .vs-card .btn-manage {
      background: var(--primary); color: white; border: none; border-radius: 20px;
      padding: 8px 24px; font-size: 0.85rem; font-weight: 600; text-decoration: none; display: inline-block;
    }
    .vs-card:hover .btn-manage { background: var(--primary-dark); }

    .vs-footer { background: var(--dark2); border-top: 1px solid rgba(255,255,255,0.06); text-align: center; padding: 20px; color: var(--muted); font-size: 0.85rem; margin-top: 60px; }
    .vs-footer strong { color: var(--primary); }
  </style>
</head>
<body>

<nav class="vs-nav">
  <div style="display:flex; align-items:center; gap:14px;">
    <a href="/admin/" class="vs-brand">Vijay<span>Shop</span></a>
    <span class="vs-badge"><i class="fas fa-shield-alt mr-1"></i>Admin</span>
  </div>
  <div class="vs-nav-links">
    <a href="/admin/profileDisplay"><i class="fas fa-user mr-1"></i>${admin}</a>
    <a href="/admin/logout" class="btn-logout"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a>
  </div>
</nav>

<div class="vs-hero">
  <h1>Welcome Back, <span>${admin}</span> 👋</h1>
  <p>Manage your store from the Vijay Shop Admin Panel</p>
</div>

<div class="vs-section">
  <div class="vs-grid">

    <a href="/admin/categories" class="vs-card">
      <div class="icon-wrap green"><i class="fas fa-tags"></i></div>
      <h4>Categories</h4>
      <p>Add, edit and delete product categories.</p>
      <span class="btn-manage">Manage</span>
    </a>

    <a href="/admin/products" class="vs-card">
      <div class="icon-wrap gold"><i class="fas fa-box"></i></div>
      <h4>Products</h4>
      <p>Manage all your store products here.</p>
      <span class="btn-manage">Manage</span>
    </a>

    <a href="/admin/customers" class="vs-card">
      <div class="icon-wrap blue"><i class="fas fa-users"></i></div>
      <h4>Customers</h4>
      <p>View all registered customers.</p>
      <span class="btn-manage">View</span>
    </a>

    <a href="/admin/products/add" class="vs-card">
      <div class="icon-wrap purple"><i class="fas fa-plus-circle"></i></div>
      <h4>Add Product</h4>
      <p>Quickly add a new product to your store.</p>
      <span class="btn-manage">Add Now</span>
    </a>

  </div>
</div>

<div class="vs-footer">&copy; 2024 <strong>Vijay Shop</strong>. Admin Panel.</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>