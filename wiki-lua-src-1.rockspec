package = "wiki-lua"
version = "src-1"
source = {
   url = "git+https://github.com/morrisalp/wiki-lua"
}
description = {
   homepage = "https://github.com/morrisalp/wiki-lua",
   license = "GPL-3.0"
}
dependencies = {
   "lua ~> 5.2"
}
build = {
   type = "builtin",
   modules = {
      ["Module.ar-translit"] = "src/Module/ar-translit.lua",
      wiki = "src/wiki.lua"
   }
}
