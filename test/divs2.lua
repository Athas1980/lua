-- vim: ts=2 sw=2 sts=2 expandtab:cindent:
--------- --------- --------- --------- --------- --------- 

package.path = '../src/?.lua;' .. package.path
local Lib=require("lib")
local ok   = require("ok")

local Object=require("object")
local Some=require("some")
local divs = require("divs2")
local Tbl = require("tbl")

local r, o, map, same = Lib.r, Lib.o, Lib.map, Lib.same
local round , within  = Lib.round, Lib.within

local function y1(x)
  x = round(x,3)
  if     x <= 0.15 then return {x,1}
  elseif x <= 0.35  then return {x,1}
  elseif x <= 0.55 then return {x,1}
  elseif x <= 0.85 then return {x,5}
  else                  return {x,6} end end

local function y2(x)
  x = round(x,3)
  if     x <= 0.25 then return {x,1+r()}
  elseif x <= 0.5 then return {x,2+r()}
  elseif x <= 0.75 then return {x,3+r()}
  else                 return {x,4+r()} end end

local function first(a) return a[1] end
local function second(a) return a[2] end

local function big(   a,s,m,d)
  a,m = {},1000
  for i=1,m do a[#a+1] = y1(r()) end
  --map(a,o)
  d= divs.some(a,{fx=first,fy=second})
  map(d,o)
  assert(within(0.549,d[1].hi,0.551))
end

ok{big=big}

ok{autos= function(  a,d)
  a={10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10 , 10, 10,
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
  10, 10, 10, 10, 10, 10, 10, 10 , 10, 10, 10, 10,
  10, 10, 10, 10, 10, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20 , 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20 , 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20 , 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20 ,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20 , 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20 , 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20 , 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20 , 20, 20, 20, 20, 20, 20, 20, 20,
  20, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30 , 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30 ,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30 , 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30 , 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30 , 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30 , 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40,
  40, 40 , 40, 40, 40, 40, 40, 40, 40, 40, 40, 40,
  40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40 ,
  40, 50 }
  d= divs.some(a,{x=same})
  Lib.map(d,o)
  assert(d[1].hi==10)
  assert(d[2].hi==20)
  assert(d[3].hi==30)
  assert(d[4].hi==math.maxinteger)
end}
