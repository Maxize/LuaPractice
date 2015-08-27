local m = require "io";

m.write("hello world\n");


-- local com = require "complex_1";

-- local com = require "complex_modname";

local com = require "complex_setfenv";
a = {r= 1, i = 2};
b = {r= 2, i = 1}


print (a.r+ b.r);
c = com.add(a, b);

for _, v in pairs(c) do
	print(v);
end


-- print(com.new(1, 2));
