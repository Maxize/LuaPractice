function MergeSort(a)
	p = {};
	mergesort(a, 1, #a, p);
	p = {};
end

--  对数组左右进行递归排序  再将左右合并    --
function mergesort(a, first, last, temp)
	if(first >= last) then
		return
	end

	--   获取中间数    --
	local mid = math.floor((first + last) / 2);

	--  左边有序  --
	mergesort(a, first, mid, temp);
	--  右边有序  --
	mergesort(a, mid+1, last, temp);

	--  合并左右两个区间  --
	mergearray(a, first, mid, last, temp);

end

--  合并两个有序区间  --
function mergearray(a, first, mid, last, temp)
	local i, j = first, mid + 1;
	local m, n = mid, last;
	local k = first;
	while (i <= m and j <= n) do
		if(a[i] <= a[j]) then
			temp[k] = a[i];
			k = k + 1;
			i = i + 1;
		else
			temp[k] = a[j];
			k = k + 1;
			j = j + 1;
		end
	end

	while(i <= m) do
		temp[k] = a[i];
		k = k + 1;
		i = i + 1;
	end

	while(j <= n) do
		temp[k] = a[j];
		k = k + 1;
		j = j + 1;
	end


	local v = first;
	while v < k do
		a[v] = temp[v];
		v = v + 1;
	end

end



x = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9}

MergeSort(x)

for _, y in ipairs(x) do
	print(y);
end







