# kong-plugin-url-regex-rewriter
```
url_a  --> kong-plugin-url-regex-rewriter --> url_b --> upstream
```

eg.
```
source: /a/resource
target: /b/resource
```

in plugin setting page:
```
set regex = /a/(.*)$
set replace = /b/$1
```

refer to :

[ngx.re.sub(subject, regex, replace, options?)](https://github.com/openresty/lua-nginx-module#ngxresub)

the arg url_a pass to sub function as ```subject```,  ```regex``` and ```replace``` are the same as setting page.
