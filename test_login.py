import urllib.request, urllib.parse, re, http.cookiejar

cj = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))

# 1. Get login page to grab CSRF
response = opener.open('http://localhost:8080/login')
html = response.read().decode('utf-8')
csrf_match = re.search(r'name="_csrf" value="([^"]+)"', html)
if not csrf_match:
    print("CSRF token not found!")
    exit(1)
csrf_token = csrf_match.group(1)

# 2. Post login
data = urllib.parse.urlencode({'username': 'admin', 'password': '123', '_csrf': csrf_token}).encode('utf-8')
try:
    login_response = opener.open('http://localhost:8080/userloginvalidate', data)
    print('Login Response URL:', login_response.geturl())
    print('Login Response Code:', login_response.getcode())
except urllib.error.HTTPError as e:
    print('HTTPError:', e.code)
    print('Error URL:', e.geturl())
    print('Content:', e.read().decode('utf-8')[:500])
