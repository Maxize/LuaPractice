SuperSort = {
	a = {},
	n = 1,
}

function SuperSort:new(o)
	o = o or {};
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function SuperSort:initDate(list, count)
	self.a = list;
	self.n = count;
end

function SuperSort:exchange(x, y)
	self.a[x], self.a[y] = self.a[y], self.a[x];
end

-- 冒泡排序
function SuperSort:bubbleSort()
	for i = 1, self.n do
		local j = self.n;
		while j > i do
			if self.a[j-1]>self.a[j] then
				SuperSort:exchange(j-1, j);
				-- self.a[j-1], self.a[j] = self.a[j], self.a[j-1];
			end
			j = j - 1;
		end
	end
end

--  插入排序
function SuperSort:insertSort()
	local i = 2;
	while i <= self.n do
		j = i - 1;
		while (j>=1 and self.a[j]>self.a[j+1]) do
			-- SuperSort:exchange(self.a[j-1], self.a[j]);
			self.a[j+1], self.a[j] = self.a[j], self.a[j+1];
			j = j - 1;
		end
		i = i + 1;
	end
end

-- 选择排序
function SuperSort:selectSort()
	local i = 1;
	while(i <= self.n) do
		--  找到最小元素的位置  --
		nMinIndex = i;
		j = i + 1;
		while(j <= self.n) do
			if(self.a[j] < self.a[nMinIndex]) then
				nMinIndex = j;
			end
			j = j + 1;
		end
		-- SuperSort:exchange(self.a[i], self.a[nMinIndex]);
		self.a[i], self.a[nMinIndex] = self.a[nMinIndex], self.a[i];  --  将该元素放到无序区的第一个位置
		i = i + 1;
	end
end

-- 快排开始
function SuperSort:quickSort()
	if(self.n > 0) then
		SuperSort:quick_sort(self.a, 1, self.n);
	end
end

--  递归寻找中间位置知道各个区间只有一个数  --
function SuperSort:quick_sort(a, low, high)
	if(low < high) then
		local middle = SuperSort:get_middle(a, low, high);
		SuperSort:quick_sort(a, low, middle);
		SuperSort:quick_sort(a, middle+1, high);

	end

end

--   寻找中间位置    --
function SuperSort:get_middle(a, low, high)
	local tmp = a[low];
	while(low < high) do
		--  从右往左遍历找出大于基准值    ---
		while (low < high and a[high] >= tmp) do
			high = high - 1;
		end
		a[low] = a[high];
		--  从左往右遍历找出小于基准值的数  --
		while(low < high and a[low] <= tmp) do
			low = low + 1;
		end
		a[high] = a[low];
	end
	a[low] = tmp;
	return low;
end

--  快排结束


-- 归并排序开始
function SuperSort:mergeSort()
	local p = {};
	SuperSort:Mergesort(self.a, 1, self.n, p);
	p = {};
end

--  对数组左右进行递归排序  再将左右合并    --
function SuperSort:Mergesort(a, first, last, temp)
	if(first >= last) then
		return
	end

	--   获取中间数    --
	local mid = math.floor((first + last) / 2);

	--  左边有序  --
	SuperSort:Mergesort(a, first, mid, temp);
	--  右边有序  --
	SuperSort:Mergesort(a, mid+1, last, temp);

	--  合并左右两个区间  --
	SuperSort:mergearray(a, first, mid, last, temp);

end

--  合并两个有序区间  --
function SuperSort:mergearray(a, first, mid, last, temp)
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


-- 归并排序结束

--  希尔排序
function SuperSort:shellSort()
	local gap = math.floor(self.n / 2);
	while(gap > 0) do
		local i = gap + 1;
		while ( i <= self.n ) do
			local j = i - gap;
			while ( j >= 1 and self.a[j] > self.a[j+gap]) do
				SuperSort:exchange(j, j+gap);
				-- self.a[j], self.a[j+gap] = self.a[j+gap], self.a[j];
				j = j - gap;
			end
			i = i + 1;
		end
		gap = math.floor(gap / 2);
	end
end

-- 堆排序
function SuperSort:heapSort()
	SuperSort:initCreateHeap(self.a);
	local heapSize = self.n;
	local i = self.n;
	while i>1 do
		SuperSort:exchange(1, i);
		-- a[1], a[i] = a[i], a[1];
		SuperSort:keepHeapify(self.a, 1, heapSize);
		--  keepHeapifyNoRecurisive(a, 1, heapSize);
		i = i - 1;
		heapSize = heapSize - 1;
	end
end

--  初始化堆
function SuperSort:initCreateHeap(a)
	local i = math.floor(self.n/2);
	while (i >= 1) do
		SuperSort:keepHeapify(a, i, self.n);
		--keepHeapifyNoRecurisive(a, i, #a);
		i = i - 1;
	end
end
--  递归调用
function SuperSort:keepHeapify(a, i, heapSize)
	local left = SuperSort:left(i);
	local right = SuperSort:right(i);
	local largest = i;
	if(left < heapSize and a[left] > a[i]) then
		largest = left;
	end

	if(right < heapSize and a[right] > a[largest]) then
		largest = right;
	end

	if(largest ~= i) then
		a[largest], a[i] = a[i], a[largest];
		SuperSort:keepHeapify(a, largest, heapSize);
	end

end

function SuperSort:left(i)
	return i * 2;
end

function SuperSort:right(i)
	return i * 2 + 1;
end

-- 堆排序结束


return SuperSort;

