--[[
设数组为a[0…n-1]。
1. 初始时，a[0]自成1个有序区，无序区为a[1..n-1]。令i=1
2. 将a[i]并入当前的有序区a[0…i-1]中形成a[0…i]的有序区间。
3. i++并重复第二步直到i==n-1。排序完成。

--]]

------------- 原始直接插入排序  -------------------

function InsertSort_1(numbers)
	local i = 2;
	while i <= #numbers do
		-----为numbers[i]在前面的numbers[1... i]中找一个合适的位置   ----
		j = i - 1;
		while j >= 1 do
			if(numbers[j] < numbers[i]) then
				break;
			end
			j = j - 1;
		end

		---- 如找到了一个合适的位置  -----
		if(j ~= i - 1) then
			temp = numbers[i];
			----  将比numbers[i]大的数据后移  -----
			k = i -1;
			while k > j do
				numbers[k+1] = numbers[k];
				k = k - 1;
			end
			----  将numbers[i] 放在正确的位置   ------
			numbers[k+1] = temp;
		end
		i = i + 1;
	end
end

---------  修改插入排序  合并搜索和数据后移     --------

function InsertSort_2(numbers)
	local i = 2;
	while i <= #numbers do
		if(numbers[i] < numbers[i-1]) then
			temp = numbers[i];
			j = i - 1;
			while (j>=1 and numbers[j]>temp) do
				numbers[j+1] = numbers[j];
				j = j - 1;
			end
			numbers[j+1] = temp;
		end
		i = i + 1;
	end
end


---------  修改插入排序  数据交换代替数据后移   --------

function InsertSort_3(numbers)
	local i = 2;
	while i <= #numbers do
		j = i - 1;
		while (j>=1 and numbers[j]>numbers[j+1]) do
			numbers[j+1], numbers[j] = numbers[j], numbers[j+1];
			j = j - 1;
		end
		i = i + 1;
	end
end




a = {12, 1, 43, 56, 78, 67, 34, 13, -1, 43, 6, 155, 0.2}

for i in ipairs(a) do
	print(a[i]);
end

print(".................................\n");

-- InsertSort_1(a);

-- InsertSort_2(a);

InsertSort_3(a);

for i in ipairs(a) do
	print(a[i]);
end


