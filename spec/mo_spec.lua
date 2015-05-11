local msgfmt = 'msgfmt spec/messages.po -o spec/messages.mo'

describe("mo", function()
    it("compiles .po to .mo and load .mo", function()
        os.execute(msgfmt)
        local mo = require 'mo'
        local _ = assert(mo('spec/messages.mo'))
        assert.equal('привет', _("hello"))
        assert.equal('сегодня', _("today"))
        assert.equal('unknown', _("unknown"))
    end)

    it("reads little endian file (intel magic)", function()
        os.execute(msgfmt .. ' --endianness=little')
        local mo = require 'mo'
        local _ = assert(mo('spec/messages.mo'))
        assert.equal('привет', _("hello"))
    end)

    it("reads big endian file (motorola magic)", function()
        os.execute(msgfmt .. ' --endianness=big')
        local mo = require 'mo'
        local _ = assert(mo('spec/messages.mo'))
        assert.equal('привет', _("hello"))
    end)

    it("returns trivial function if mo file doesn't exist",
    function()
        local mo = require 'mo'
        local _ = assert(mo('spec/messages.mo.nofile'))
        assert.equal('hello', _("hello"))
        assert.equal('today', _("today"))
        assert.equal('unknown', _("unknown"))
    end)

    it("returns trivial function if mo file is not specified",
    function()
        local mo = require 'mo'
        local _ = assert(mo())
        assert.equal('hello', _("hello"))
        assert.equal('today', _("today"))
        assert.equal('unknown', _("unknown"))
    end)

    it("returns trivial function if version of mo file > 0",
    function()
        os.execute(msgfmt)
        -- patch .mo file
        local f = io.open('spec/messages.mo', 'r+')
        f:seek('set', 4)
        f:write('1234')
        f:close()
        -- read it with MO parser
        local mo = require 'mo'
        local _ = assert(mo('spec/messages.mo.nofile'))
        assert.equal('hello', _("hello"))
    end)
end)
