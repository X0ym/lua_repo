---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by xieym.
--- DateTime: 2023/9/25 15:58
---

local ipairs      = ipairs
local setmetatable = setmetatable
local tonumber    = tonumber
local type = type
local str_upper = string.upper
local str_lower = string.lower
local new_tab     = require("table.new")

local _M = {}
local mt = { __index = _M }
local not_op = "!"

local function compile(rules)
    local n_rule = #rules
    if n_rule <= 0 then
        return nil, "rule too short"
    end

    local compiled = {
        logic_op = "AND",
        exprs = new_tab(n_rule, 0),
    }

    if type(rules[1]) == "table" then
        for i, expr in ipairs(rules) do
            local res, err = compile(rules[i])
            if not res then
                return nil, err
            end

            compiled.exprs[i] = res
        end
        return compiled
    end

    local op = str_upper(rules[1])
    if logic_ops[op] then
        compiled.logic_op = op
        if n_rule <= 2 then
            return nil, "rule too short"
        end

        for i = 2, n_rule do
            local res, err = compile(rules[i])
            if not res then
                return nil, err
            end

            compiled.exprs[i - 1] = res
        end

        return compiled
    end

    return compile_expr(rules)
end

function _M.new(rule)
    if not rule then
        return nil, "missing argument rule"
    end

    local n_rule = #rule
    if n_rule == 0 then
        return setmetatable({}, mt)
    end

    if type(rule[1]) ~= "table" then
        local op = str_upper(rule[1])
        if not logic_ops[op] then
            return nil, "rule should be wrapped inside brackets"
        end
    end

    local compiled, err = compile(rule)
    if not compiled then
        return nil, err
    end

    return setmetatable({rule = compiled}, mt)
end
