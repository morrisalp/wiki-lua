
require 'wiki'

local at = require 'Module:ar-translit'

for line in io.lines('sample/arabic.txt') do
    print(at.tr(line))
end