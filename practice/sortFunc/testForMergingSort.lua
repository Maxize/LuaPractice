function g_sort(list, left, right)
	if(left < right) then
		-----  找到中间索引  -------

		center = math.floor((left+right) / 2);
		print(left.."----"..center.."======="..right);
		-----  对左边数组进行递归   -------
		g_sort(list, left, center);
		-----  对右边数组进行递归   -------
		g_sort(list, center+1, right);
		-----   合并   ------
		merge(list, left, center, right);
	end
end

function merge(list, left, center, right)
	local tmpArr = list;
	local mid = center + 1;

	local third = left;
	local tmp = left;

	while(left <= center and mid <= right) do
		if(list[left] <= list[mid]) then
			tmpArr[third] = list[left];
			third = third + 1;
			left = left + 1;
		else
			tmpArr[third] = list[mid];
			third = third + 1;
			mid = mid + 1;
		end
	end

	while(mid <= right) do
		tmpArr[third] = list[mid];
		third = third + 1;
		mid = mid + 1;
	end

	while(left <= center) do
		tmpArr[third] = list[left];
		third = third + 1;
		left = left + 1;
	end

	while(tmp < third) do
		list[tmp] = tmpArr[tmp];
		tmp = tmp + 1;
	end
end


x = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9}
g_sort(x, 1, #x);
for _, y in ipairs(x) do
	print(y);
end

-- print(#x);
