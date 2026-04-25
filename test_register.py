import urllib.request, urllib.parse, re, http.cookiejar

cj = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))

# 1. Get register page
response = opener.open('http://localhost:8080/register')
html = response.read().decode('utf-8')
csrf_token = re.search(r'name="_csrf" value="([^"]+)"', html).group(1)

# 2. Post register
data = urllib.parse.urlencode({
    'username': 'testuser2',
    'password': 'password123',
    'email': 'testuser2@example.com',
    'address': '123 Test St',
    '_csrf': csrf_token
}).encode('utf-8')

try:
    reg_response = opener.open('http://localhost:8080/newuserregister', data)
    print('Register Response URL:', reg_response.geturl())
    print('Register Response Code:', reg_response.getcode())
    print('Body:', reg_response.read().decode('utf-8')[:300])
except urllib.error.HTTPError as e:
    print('HTTPError:', e.code)
    print('Error URL:', e.geturl())
    print('Content:', e.read().decode('utf-8'))
