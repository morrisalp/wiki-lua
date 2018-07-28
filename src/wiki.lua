local lualib_path = os.getenv('LUALIB_PATH')
package.path = package.path .. ';' .. lualib_path .. '/?.lua;' .. lualib_path .. '/mw.?.lua'
-- decorate require to handle Wikimedia module includes ('Module:___')
local string, r = require 'string', require
function require(x)
    return r(string.gsub(x , ':', '.'))
end
mw = {
    loadData = require,
    ustring = require 'ustring.ustring',
    text = require 'text'
}