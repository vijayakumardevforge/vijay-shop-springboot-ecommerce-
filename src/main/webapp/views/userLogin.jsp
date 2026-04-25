<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Login - Vijay Shop</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
  <style>
    :root { --primary: #00b341; --primary-dark: #008c32; --dark: #0d1117; --gold: #f0c040; }
    * { box-sizing: border-box; }
    body { font-family: 'Poppins', sans-serif; background: var(--dark); display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; }
    .login-wrap { width: 420px; }
    .login-logo { text-align: center; margin-bottom: 28px; }
    .login-logo .brand { font-size: 2.5rem; font-weight: 800; color: var(--primary); }
    .login-logo .brand span { color: var(--gold); }
    .login-logo .sub { color: #8b949e; font-size: 0.9rem; margin-top: 4px; }
    .login-card { background: #1c2230; border: 1px solid rgba(255,255,255,0.08); border-radius: 20px; padding: 36px 32px; box-shadow: 0 20px 60px rgba(0,0,0,0.5); }
    .login-card h3 { font-size: 1.3rem; font-weight: 700; color: #e6edf3; margin-bottom: 6px; }
    .login-card .sub-text { color: #8b949e; font-size: 0.85rem; margin-bottom: 26px; }
    .form-group label { color: #cdd9e5; font-size: 0.85rem; font-weight: 600; margin-bottom: 6px; }
    .input-wrap { position: relative; }
    .input-wrap i { position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: #8b949e; }
    .input-wrap input { background: #0d1117; border: 1px solid rgba(255,255,255,0.1); color: #e6edf3; border-radius: 10px; padding: 12px 14px 12px 40px; width: 100%; font-size: 0.95rem; font-family: 'Poppins', sans-serif; transition: border-color 0.2s; }
    .input-wrap input:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 3px rgba(0,179,65,0.15); background: #0d1117; color: #e6edf3; }
    .btn-login { width: 100%; background: var(--primary); color: white; border: none; border-radius: 10px; padding: 13px; font-size: 1rem; font-weight: 700; font-family: 'Poppins', sans-serif; cursor: pointer; transition: all 0.2s; margin-top: 8px; }
    .btn-login:hover { background: var(--primary-dark); transform: translateY(-1px); box-shadow: 0 6px 20px rgba(0,179,65,0.4); }
    .error-msg { background: rgba(255,80,80,0.1); border: 1px solid rgba(255,80,80,0.3); color: #ff6b6b; border-radius: 8px; padding: 10px 14px; font-size: 0.85rem; margin-top: 14px; text-align: center; }
    .register-link { text-align: center; margin-top: 18px; color: #8b949e; font-size: 0.85rem; }
    .register-link a { color: var(--primary); font-weight: 600; text-decoration: none; }
    .register-link a:hover { color: #00d44e; }
    .divider { border: none; border-top: 1px solid rgba(255,255,255,0.07); margin: 20px 0; }
  </style>
</head>
<body>
<div class="login-wrap">
  <div class="login-logo">
    <div class="brand">Vijay<span>Shop</span></div>
    <div class="sub">Fresh Groceries, Delivered Fast</div>
  </div>
  <div class="login-card">
    <h3>Welcome back!</h3>
    <p class="sub-text">Sign in to continue shopping</p>
    <form action="/userloginvalidate" method="post">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <div class="form-group">
        <label>Username</label>
        <div class="input-wrap">
          <i class="fas fa-user"></i>
          <input type="text" name="username" id="username" placeholder="Your username" required>
        </div>
      </div>
      <div class="form-group">
        <label>Password</label>
        <div class="input-wrap">
          <i class="fas fa-lock"></i>
          <input type="password" name="password" id="password" placeholder="Your password" required>
        </div>
      </div>
      <button type="submit" class="btn-login"><i class="fas fa-sign-in-alt mr-2"></i>Sign In</button>
      <c:if test="${not empty msg}">
        <div class="error-msg"><i class="fas fa-exclamation-circle mr-1"></i>${msg}</div>
      </c:if>
    </form>
    <hr class="divider">
    <div class="register-link">
      Don't have an account? <a href="/register">Register here</a>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
