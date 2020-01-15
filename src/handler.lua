-- load the base plugin object
local BasePlugin = require "kong.plugins.base_plugin"

-- creating handler
local plugin = BasePlugin:extend()

plugin.PRIORITY = 777
plugin.VERSION  = "0.1.0"

-- constructor
function plugin:new()
  plugin.super.new(self, "url-regex-rewriter")
end

-- Main Logic
function plugin:access(conf) -- Executed for every request upon it's reception from a client and before it is being proxied to the upstream service.
  plugin.super.access(self)

  local newstr, n, err = ngx.re.sub(ngx.var.uri, conf.regex, conf.replace)
  if n > 0 then
      ngx.var.upstream_uri = newstr
      ngx.log(ngx.NOTICE, string.format("%s ---> %s", ngx.var.uri, ngx.var.upstream_uri))
  end
end

return plugin
