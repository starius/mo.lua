package = "mo.lua"
version = "dev-1"
source = {
    url = "git://github.com/starius/mo.lua.git"
}
description = {
    summary = "Parser for MO files",
    homepage = "https://github.com/starius/mo.lua",
    license = "MIT",
}
dependencies = {
    "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {
        ['mo'] = 'src/mo.lua',
    },
}
