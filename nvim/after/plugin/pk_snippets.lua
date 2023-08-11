local ls = require "luasnip" 

ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "-- this is what was expanded! "),
    },

    lua={
        --localfunction
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n    $0\nend"),

    }
}


