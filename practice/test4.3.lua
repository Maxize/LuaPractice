function f(x)
	return x*5;
end


for i=1, f(5) do
	print(i);
end

for i=10,1,-1 do
	print(i);
end

for i=1,10 do
	print(i);
end


tbl = {"alpha", "beta", ["one"] = "uno", ["two"] = "dos"};
for key, value in pairs(tbl) do
print(key, value);
end
