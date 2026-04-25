import urllib.request, urllib.parse, re, http.cookiejar

cj = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))

# 1. Admin login to get session + CSRF
resp = opener.open('http://localhost:8080/admin/login')
html = resp.read().decode('utf-8')
csrf = re.search(r'name="_csrf" value="([^"]+)"', html).group(1)
data = urllib.parse.urlencode({'username': 'admin', 'password': '123', '_csrf': csrf}).encode()
opener.open('http://localhost:8080/admin/loginvalidate', data)

# 2. Get update form page to grab a fresh CSRF
resp = opener.open('http://localhost:8080/admin/products/update/4')
html = resp.read().decode('utf-8')
# Extract CSRF from the form hidden input
csrf_match = re.search(r'name="_csrf"\s+value="([^"]+)"', html)
if not csrf_match:
    csrf_match = re.search(r'value="([^"]+)"\s+name="_csrf"', html)
if csrf_match:
    csrf = csrf_match.group(1)
    print("CSRF:", csrf)
else:
    print("CSRF not found in form, using session CSRF")

new_image = 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500'
post_data = urllib.parse.urlencode({
    '_csrf': csrf,
    'name': 'Bread',
    'categoryid': '6',
    'price': '3',
    'weight': '500',
    'quantity': '50',
    'description': 'Whole wheat loaf',
    'productImage': new_image,
}).encode()

try:
    # POST to /admin/products/update/4
    req = urllib.request.Request('http://localhost:8080/admin/products/update/4', data=post_data, method='POST')
    r = opener.open(req)
    print('Result URL:', r.geturl())
    print('Done! Image updated.')
except urllib.error.HTTPError as e:
    print('HTTPError:', e.code)
    print(e.read().decode()[:800])
