---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by xieym.
--- DateTime: 2023/3/6 17:48
---

--[[
注释
    单行注释 ---
    多行注释
数据类型
    Lua 是动态类型语言，变量不需要类型定义
    Lua 有 8 个基本类型：nil，boolean，number，string，userdata，function，thread，table
        - userdata 表示任意存储在变量中的C数据结构
        - table Lua 中的 table 是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型

type 函数：获取变量或值的类型



--]]

print("Hello World!")

print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))                   --> function
print(type(type))                    --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))                 --> string

--- 对于全局变量和 table，nil 还有一个"删除"作用，给全局变量或者 table 表里的变量赋一个 nil 值，等同于把它们删掉
tab1 = { key1 = "val1", key2 = "val2", "val3" }
print("===table===")
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
print("===========")

print("===table===")
tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
print("===========")

