---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by xieym.
--- DateTime: 2023/3/6 19:46
---

--[[

Lua 模块加载机制

语法：require("module_name") 或 require "module_name"



参考
    https://www.cnblogs.com/nickcan/p/15115075.html

--]]

print(package.cpath)
print("====")
print(package.path)

local module = require("module")

print(module.ModuleName)

local res = module.Add(1, 2)
print(res)