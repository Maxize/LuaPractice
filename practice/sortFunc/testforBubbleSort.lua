
------------- 简单冒泡 --------------------

function BubbleSort_1(numbers)
	for i = 1, #numbers do
		--j =  table.getn(numbers);
		j = #numbers;
		while j > i do
			if numbers[j-1] > numbers[j] then
				numbers[j-1] , numbers[j] = numbers[j], numbers[j-1];
			end
			j = j - 1;
		end
	end
end


------------- 标记法冒泡  -------------------

function BubbleSort_2(numbers)
	local isF = true;
	local n = #numbers;
	while isF do
		isF = false;
		j = 2;
		while j <= n do
			if numbers[j] < numbers[j-1] then
				numbers[j], numbers[j-1] = numbers[j-1], numbers[j];
				isF = true;
			end
			j = j + 1;
		end
		n = n - 1;
	end
end


-------------- 假设 有一种情况是 一部分无序一部分有序的数组 --------------------
function BubbleSort_3(numbers)

	local flag = #numbers;
	while flag > 0 do
		k = flag;
		flag = 0;
		j = 2;
		while j <= k do
			if numbers[j] < numbers[j-1] then
				numbers[j], numbers[j-1] = numbers[j-1], numbers[j];
				flag = j;
			end
			j = j + 1;
		end
	end
end


a = {12, 1, 43, 56, 78, 67, 34, 13, -1, 43, 6, 155, 0.2}

for i in ipairs(a) do
	print(a[i]);
end

print(".................................\n");

BubbleSort_1(a);
for i in ipairs(a) do
	print(a[i]);
end
