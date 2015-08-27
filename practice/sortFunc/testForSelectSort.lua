----  直接选择排序   -----
--[[
	1. 初始时数组无序区为  a[1...n]. i = 1
	2. 在无序区a[i... n]选择一个最小的元素,与a[i]交换， a[0..i]即为有序区
	3. i++重复至无序区只剩一个元素
--]]

function Selectsort(a, n)
	for i=1, n do
		--  找最小元素的位置  --
		nMinIndex = i;
		j = i + 1;
		while(j <= n) do
			if(a[j] < a[nMinIndex]) then
				nMinIndex = j;
			end
			j = j + 1;
		end
		a[i], a[nMinIndex] = a[nMinIndex], a[i];  --  将这个元素放到无序区的开头
		i = i + 1;
	end
end

x = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9}
Selectsort(x, #x);
for _, y in ipairs(x) do
	print(y);
end
