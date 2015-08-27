function shellSort1(a, n)
	local gap = math.floor(n / 2);
	while( gap > 0) do
		local i = 1;
		while(i <= gap) do
			local j = i + gap;
			while(j <= n) do
				if(a[j] < a[j-gap]) then
					local temp = a[j];
					local k = j - gap;
					while(k >= 1 and a[k] > temp) do
						a[k+gap] = a[k];
						k = k - gap;
					end
					a[k+gap] = temp;
				end
				j = j + gap;
			end
			i = i + 1;
		end
		gap = math.floor(gap / 2);
	end
end


function shellSort2(a, n)
	local gap = math.floor(n/2);
	while(gap > 0) do
		local j = gap+1;
		while(j <= n) do
			if(a[j] < a[j-gap]) then
				local temp = a[j];
				local k = j - gap;
				while(k >= 1 and a[k] > temp) do
					a[k+gap] = a[k];
					k = k - gap;
				end
				a[k+gap] = temp;
			end
			j = j + 1;
		end
		gap = math.floor(gap/2);
	end
end



function shellSort(a, n)
	gap = math.floor(n / 2);
	while(gap > 0) do
		local i = gap + 1;
		while ( i <= n ) do
			j = i - gap;
			while ( j >= 1 and a[j] > a[j+gap]) do
				a[j], a[j+gap] = a[j+gap], a[j];
				j = j - gap;
			end
			i = i + 1;
		end
		gap = math.floor(gap / 2);
	end
end


x = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9}
--x = {13, 14, 94, 33, 82, 25, 59, 94, 65, 23, 45, 27, 73, 25, 39, 10}
--shellSort1(x, #x);
--shellSort2(x, #x);
shellSort(x, #x);
for _, y in ipairs(x) do
	print(y);
end


