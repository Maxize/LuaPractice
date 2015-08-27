function heapSort(a)
	initCreateHeap(a);
	local heapSize = #a;
	local i = #a;
	while i>1 do
		a[1], a[i] = a[i], a[1];
		keepHeapify(a, 1, heapSize);
		--  keepHeapifyNoRecurisive(a, 1, heapSize);
		i = i - 1;
		heapSize = heapSize - 1;
	end
end

--  初始化堆
function initCreateHeap(a)
	local i = math.floor(#a/2);
	while (i >= 1) do
		keepHeapify(a, i, #a);
		--keepHeapifyNoRecurisive(a, i, #a);

		i = i - 1;
	end
end
--  递归调用
function keepHeapify(a, i, heapSize)
	local left = left(i);
	local right = right(i);
	local largest = i;
	if(left < heapSize and a[left] > a[i]) then
		largest = left;
	end

	if(right < heapSize and a[right] > a[largest]) then
		largest = right;
	end

	if(largest ~= i) then
		a[largest], a[i] = a[i], a[largest];
		keepHeapify(a, largest, heapSize);
	end

end


function keepHeapifyNoRecurisive(a, i, heapSize)
	local largest = i;
	while (largest < heapSize) do
		local left = left(i);
		local right = right(i);

		print(left.."....."..right);
		if(left < heapSize and a[left] > a[i]) then
			largest = left;
		end
		if(right < heapSize and a[right] > a[largest]) then
			largest = right;
		end

		if(largest == i) then break; end

		a[largest], a[i] = a[i], a[largest];
		i = largest;
	end
end

function left(i)
	return i * 2;
end

function right(i)
	return i * 2 + 1;
end



x = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9}
--x = {13, 14, 94, 33, 82, 25, 59, 94, 65, 23, 45, 27, 73, 25, 39, 10}
--initCreateHeap(x);

heapSort(x);
for _, y in ipairs(x) do
	print(y);
end
