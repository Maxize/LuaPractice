function quick(list)
	if(#list > 0) then
		quick_sort(list, 1, #list);
	end

end


--  递归寻找中间位置知道各个区间只有一个数  --
function quick_sort(list, low, high)
	if(low < high) then
		local middle = get_middle(list, low, high);
		quick_sort(list, low, middle);
		quick_sort(list, middle+1, high);

	end

end

--   寻找中间位置    --
function get_middle(list, low, high)
	local tmp = list[low];
	while(low < high) do
		--  从右往左遍历找出大于基准值    ---
		while (low < high and list[high] >= tmp) do
			high = high - 1;
		end
		list[low] = list[high];
		--  从左往右遍历找出小于基准值的数  --
		while(low < high and list[low] <= tmp) do
			low = low + 1;
		end
		list[high] = list[low];
	end
	list[low] = tmp;
	return low;
end

x = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9}
quick(x);
for _, y in ipairs(x) do
	print(y);
end

