-- vim: ts=2 sw=2 sts=2 expandtab:cindent:
--------- --------- --------- --------- --------- --------- 
 
local THE  = require("the")
local Some = require("some")
local Num  = require("num")
local Tree = {is="Tree"}

function Tree.new(t)
  local i = Object.new()
  i.me, i.tbl  = Tree,t
  return i
end

local function num1(nums, n,   a) 
  for j,b in pairs(nums) do
    if j > 1 and n >= a.lo and n <= b.lo then return b end
    a = b
  end 
  return a
end

function Tree.range(i, col, y)
  local a, s = {}, Some.new()
  -- Sample the data in this column.
  for _,row in pairs(i.tbl.rows) do 
    Some.add(s, row.cells[col.pos]  )
  end
  -- Make one `Num` per division of that sample.
  for _,lo  in pairs( Some.divs(s) ) do 
    num = Num.new{lo=lo} 
    num.syms = Sym.new()
    a[#a+1] = num
  end
  -- Tag each value with its associated `Num`.
  for _,row in pairs(t.rows) do 
    local xval = row.cells[col.pos]
    if xval ~= THE.char.skip then 
      local num = num1(a, xval) 
      r.cooked[col.pos] = num 
      -- If the `klass` has already been discredited,
      -- then remember which range we say there
      if y then
        Sym.add( num.syms, y(row) ) end end end
  return y and Tree.combine(a) or a
end

function Tree.combine(a)
  right={}
  for j=#a,1,-1 do
    right[j]= Sym.new()
    Sym.adds(right[i], a[j].syms)
    if j<#a then
      Sym.adds(right[i], right[j+1].counts) end
  left=copy(a[1].syms)
  -- walk right
  end
end
-- add in the rows. work that way
-- how to do klass, now to combines:

function Tree.ranges(i, y)
  local klass = i.tbl.cols.y.klass
  local y = y or function(r) return r.cooked[klass.pos] end
  local goal = Tree.range(i,klass)
  local all = {}
  for _,col in pairs(i.tbl.cols.nums) do
    if col.pos ~= klass.pos then
      y = y or function(r) return r.cooked[klass.pos] end
      all[col.pos] = Tree.range(i, col,  y) end end
end

--- how to combine  