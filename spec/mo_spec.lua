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

    it("returns trivial function if mo file doesn't exist",
    function()
        local mo = require 'mo'
        local _ = assert(mo('spec/messages.mo.nofile'))
        assert.equal('hello', _("hello"))
        assert.equal('hello', _("today"))
        assert.equal('unknown', _("unknown"))
    end)
end)
