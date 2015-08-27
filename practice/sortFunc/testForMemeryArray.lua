local numbers = {};
function MemeryArray(a, b, c)
	local i, j, k = 1, 1, 1;
	while(i <= #a and j <= #b) do
		if(a[i] < b[j]) then
			c[k] = a[i];
			k = k + 1;
			i = i + 1;
		else
			c[k] = b[j];
			k = k + 1;
			j = j + 1;
		end
	end

	while(i <= #a) do
		c[k] = a[i];
		k = k + 1;
		i = i + 1;
	end

	while(j <= #b) do
		c[k] = b[j];
		k = k + 1;
		j = j + 1;
	end
	numbers = c;
end

x = {1,3,5,7,9};
y = {2,4,6,8,10};
z = {};
MemeryArray(x, y, z);

for _, k in ipairs(numbers) do
	print(k);
end



