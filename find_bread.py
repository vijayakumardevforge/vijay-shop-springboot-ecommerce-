import urllib.request, urllib.parse, re, http.cookiejar

cj = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))

# 1. Admin login
resp = opener.open('http://localhost:8080/admin/login')
html = resp.read().decode('utf-8')
csrf = re.search(r'name="_csrf" value="([^"]+)"', html).group(1)
data = urllib.parse.urlencode({'username': 'admin', 'password': '123', '_csrf': csrf}).encode()
opener.open('http://localhost:8080/admin/loginvalidate', data)

# 2. Get all products to find Bread's ID
resp = opener.open('http://localhost:8080/admin/products')
html = resp.read().decode('utf-8')
print("Products page fetched, length:", len(html))

# Find product IDs and names
import re
ids = re.findall(r'href="/admin/products/update/(\d+)"', html)
names = re.findall(r'<td[^>]*>\s*([A-Za-z ]+)\s*</td>', html)
print("IDs found:", ids)
print("Names found:", names[:20])

# Print relevant section around "Bread"
idx = html.find("Bread")
if idx != -1:
    print("Context around Bread:", html[max(0,idx-300):idx+300])
