local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
local types = require "luasnip.util.types"
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local cases = require "drmgc.cases"

return {
  s(
    { trig = "nestUseCase" },
    fmt(
      [[
        import { Injectable } from '@nestjs/common';

        @Injectable()
        export class <dClassName> {
          constructor(<iConstr>) {}

          async execute(<iArgs>): <iRet> {
           <iBody>
          }
        }

      ]],
      {
        dClassName = d(1, function(_, parent)
          local env = parent.snippet.env

          local filename = env.TM_FILENAME
          local basename = filename:gsub(".ts$", "")
          local class_name = cases.to_pascal(basename)

          return sn(nil, { t(class_name) })
        end, {}),
        iConstr = i(2),
        iArgs = i(3),
        iRet = sn(nil, { t "Promise<", i(4, "unknown"), t ">" }),
        iBody = i(0, "throw new Error('Not yet implemented');"),
      },
      {
        delimiters = "<>",
      }
    )
  ),
}, {
  s(
    { trig = "nestService" },
    fmt(
      [[
        import { Injectable } from '@nestjs/common';

        @Injectable()
        export class <dClassName> { <iBody> }

      ]],
      {
        dClassName = d(1, function(_, parent)
          local env = parent.snippet.env

          local filename = env.TM_FILENAME
          local basename = filename:gsub(".ts$", "")
          local class_name = cases.to_pascal(basename)

          return sn(nil, { t(class_name) })
        end, {}),
        iBody = i(0),
      },
      {
        delimiters = "<>",
      }
    )
  ),
}
