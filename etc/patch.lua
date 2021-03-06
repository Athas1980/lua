-- vim: ts=2 sw=2 sts=2 expandtab:cindent:
--------- --------- --------- --------- --------- ---------

local fix={}

fix.mathjax=[[
<script src="https://kit.fontawesome.com/7abee6b155.js" crossorigin="anonymous"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id=MathJax-script async 
        src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
]]

fix.inline=[[
<script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            tex2jax: {
                  inlineMath: [ ['$','$'], ["\\(","\\)"] ],
                  processEscapes: true
            }
        });
</script>
]]

fix.gh=[[

<a href="https://github.com/timm/lua/src"><img 
  width="149" height="149" 
  src="https://github.blog/wp-txt/uploads/2008/12/forkme_right_red_aa0000.png\?resize=149%%2C149" 
  class="attachment-full size-full" 
  alt="Fork me on GitHub" 
  data-recalc-dims="1"></a>

]]



fix.top=[[
<center>
<a href="index.html">home</a> :: 
<a href="about.html">about</a> :: 
<a href="https://github.com/timm/lua/tree/master/INSTALL.md">install</a> :: 
<a href="https://github.com/timm/lua/tree/master/test">demos</a> :: 
<a href="http://github.com/timm/lua">github</a>   :: 
<a href="http://github.com/timm/lua/issues>discuss"</a>  
<a href="https://github.com/timm/lua/blob/master/LICENSE.md">&copy;&nbsp;2020</a>&nbsp;by&nbsp;<a href="http://menzies.us">timm</a>
<hr>
]]

fix.title = "DUO =  Data Miners using and/or used-by Optimizers"

fix.buttons=[[
<center>
<a href="https://www.lua.org"><img 
      src=https://img.shields.io/badge/language-lua-orange></a>
<img  src=https://img.shields.io/badge/purpose-teach,ai,se-blueviolet> 
<img  src=https://img.shields.io/badge/platform-mac,*nux-informational> 
<a    href="https://travis-ci.org/timm/lua"><img 
      src=https://travis-ci.org/timm/lua.svg?branch=master></a>
      <hr>
]]

fix.image=[[
<br>
<span style="font-size: 75px; color: purple;">
  <i class="fas fa-bezier-curve"></i>
  </span>
<br>

<!-- img 
 src="https://raw.githubusercontent.com/timm/lua/master/etc/img/otter.png"
 width=100 --><br>
]]

function fix.spit(file,x, f)
  local f = io.open(file, "w")
  f:write(x)
  f:close()
end

function fix.slurp(file)
  local f = io.open(file, "rb")
  local content = f:read("*all")
  f:close()
  return content
end

file=arg[1]

x=fix.slurp(file)
local function swap(a,b) x= string.gsub(x,a,b,1) end


swap("</head>" , fix.mathjax .. fix.inline .. "</head>")
swap("<h1>"    , fix.top.. "<h1>"  .. fix.title .. "<br>" .. fix.image )
swap("<p>vim:([^\n]*)\n([^\n]*)\n",fix.buttons)

fix.spit(file,x)
