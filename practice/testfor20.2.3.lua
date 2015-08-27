str = "Lua is great f";
count = select(2, string.gsub(str, " ", " "));

count_1 = select(2,1,2);
print(count);

print(count_1);

function abc(...)
	for i = 1,4 do
		-- local arg = select(i,...);
		print(i, select(i,...));
	end
end
abc("111", "222", "333", "444");

