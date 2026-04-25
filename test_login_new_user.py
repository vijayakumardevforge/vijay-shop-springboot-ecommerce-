import urllib.request, urllib.parse, re, http.cookiejar

cj = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))

response = opener.open('http://localhost:8080/login')
html = response.read().decode('utf-8')
csrf_token = re.search(r'name="_csrf" value="([^"]+)"', html).group(1)

data = urllib.parse.urlencode({'username': 'testuser2', 'password': 'password123', '_csrf': csrf_token}).encode('utf-8')
try:
    login_response = opener.open('http://localhost:8080/userloginvalidate', data)
    print('Login Response URL:', login_response.geturl())
except urllib.error.HTTPError as e:
    print('HTTPError:', e.code)
