# Introduction

wiki-lua is a wrapper for running Mediawiki Lua models locally.

# Requirements

* Lua 5.2 & LuaRocks
* [mediawiki-extensions-Scribunto](https://github.com/wikimedia/mediawiki-extensions-Scribunto)
  * tested on commit d365ad3
  * note the installation directory of lualib (in the subdirectory *includes/engines/LuaCommon/lualib* of the package)

# Installation

To install this Lua package, run the following line from this directory.
~~~~
luarocks make --local
~~~~

Then run these lines to properly set environment variables. Replace '...' in the second line with the absolute path of lualib (see requirements above).
~~~~
eval $(luarocks path --bin)
export LUALIB_PATH=... # replace .. with path to lualib
~~~~
For this to persist across bash sessions, add the two lines above to your bash profile (~/.profile).

# Usage

Place Mediawiki modules in Module/ within your Lua package directory (run *luarocks path* to see the location of this directory). Begin your script with

~~~~
require 'wiki'
~~~~

You can then include Mediawiki modules in your code as follows:

~~~~
local at = require 'Module:ar-translit'
~~~~

For modules that have data includes, place the data script in Module/[module name]/data.lua. For example, the Wiktionary module [Module:headword](https://en.wiktionary.org/wiki/Module:headword) has a data include at [Module:headword/data](https://en.wiktionary.org/wiki/Module:headword/data), so these two Lua scripts will be saved in *Module/headword.lua* and *Module/headword/data.lua*.

Note that the Mediawiki modules may need to be edited to be compatible. Of the Scribunto libraries (*mw.\**) only mw.loadData, mw.ustring and mw.text are currently supported so you must remove logic that calls other Scribunto libraries. Wikimedia modules also include escape sequences due to Wikitext formatting where plain Lua does not (e.g. see how the variable PUNCTUATION is defined in [Module:languages/data2](https://en.wiktionary.org/wiki/Module:languages/data2)), so these must be removed.

# Sample

Try running the Wiktionary module [Module:ar-translit](https://en.wiktionary.org/wiki/Module:ar-translit) locally by running the sample script: (must be run from this directory)

~~~~
lua sample/ar-translit-demo.lua
~~~~

This displays Wiktionary's transliteration of the Arabic text in the file sample/arabic.txt.