---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by xieym.
--- DateTime: 2023/9/6 10:14
---

local is_apisix_or, process = pcall(require, "resty.apisix.process")

if is_apisix_or then
    print("yes")
else
    print("no")
end