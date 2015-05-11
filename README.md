# mo.lua, parser of MO files

[![Travis build][travis-badge]][travis-page]
[![Coverage Status][coveralls-badge]][coveralls-page]
[![License][license-badge]][license-page]

[Implementation][mail] by J.Jørgen von Bargen was sent to
[lua-l][lua-l] mailing list as public domain.

## Installation

```bash
$ luarocks install mo
```

## Usage

```lua
-- load this module
mo = require 'mo'

-- load .mo file with translations
-- returns translating function on success
-- returns nil, 'error message' on failure
_ = mo('russian.mo')

-- translate from English into Russian
print(_("hello")) -- prints "привет"
-- the function returns its argument if it can't translate it
print(_("unknown phrase")) -- prints "unknown phrase"
```

## Unit tests

You need [busted][busted] and [gettext][gettext] to run unit tests.

```bash
$ busted
```

## See also

Let us translate some Lua project into Russian.

```bash
$ xgettext -p ru -s -j --language=Lua *.lua --from-code utf-8
```

This command creates (or adds to) file `ru/messages.po`.
It finds texts like `_("text")` in source files and adds them
to `.po` file.

There are a lot of programs to translate `.po` file.
One of them is [poedit][poedit].

To compile `.po` to `.mo`, run the following command:

```bash
$ msgfmt ru/messages.po -o ru/messages.mo
```

This module is used to parse `.mo` file from Lua.

[GNU gettext][gettext]

[mail]: http://lua-users.org/lists/lua-l/2010-04/msg00005.html
[lua-l]: http://www.lua.org/lua-l.html
[gettext]: http://www.gnu.org/software/hello/manual/gettext/MO-Files.html
[poedit]: http://poedit.net/
[busted]: http://olivinelabs.com/busted/
[travis-page]: https://travis-ci.org/starius/mo.lua
[travis-badge]: https://travis-ci.org/starius/mo.lua.png
[coveralls-page]: https://coveralls.io/r/starius/mo.lua
[coveralls-badge]: https://coveralls.io/repos/starius/mo.lua/badge.png
[license-page]: LICENSE
[license-badge]: http://img.shields.io/badge/License-MIT-brightgreen.png
