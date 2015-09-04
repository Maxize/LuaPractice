-- 测试排序算法的demo 
--  打印数组
function print_arr(a)
	for _, k in ipairs(a) do
		print(k);
	end
	print("*************************************");
end

--  引入SuperSort对象
local arraysort = require "SuperSort";
s = arraysort;

print("an array for example");
print("list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};");
print("input a number to sort:");
print("1: bubbleSort ");
print("2: insertSort ");
print("3: selectSort ");
print("4: quickSort ");
print("5: mergeSort ");
print("6: shellSort ");
print("7: heapSort ");
print("'exit' to exit");

-- list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};

-- s:initDate(list, #list);


while true do
	local inputnum = io.read();
	if inputnum == "1" then
		list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};
		s:initDate(list, #list);
		print("bubbleSort:");
		s:bubbleSort();
		print_arr(s.a);
	elseif inputnum == "2" then
		list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};
		s:initDate(list, #list);
		print("insertSort:");
		s:insertSort();
		print_arr(s.a);
	elseif inputnum == "3" then
		list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};
		s:initDate(list, #list);
		print("selectSort:");
		s:selectSort();
		print_arr(s.a);
	elseif inputnum == "4" then
		list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};
		s:initDate(list, #list);
		print("quickSort:");
		s:quickSort();
		print_arr(s.a);
	elseif inputnum == "5" then
		list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};
		s:initDate(list, #list);
		print("mergeSort:");
		s:mergeSort();
		print_arr(s.a);
	elseif inputnum == "6" then
		list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};
		s:initDate(list, #list);
		print("shellSort:");
		s:shellSort();
		print_arr(s.a);
	elseif inputnum == "7" then
		list = {1, 3, 5, 8, 4, 10, 6, 2, 7, 9};
		s:initDate(list, #list);
		print("heapSort:");
		s:heapSort();
		print_arr(s.a);
	elseif inputnum == "exit" then
		print("The end");
		break;
	else
		print("I cant deal with it!");
	end
end

-- s:bubbleSort();
-- s:insertSort();
-- s:selectSort();
-- s:quickSort();
-- s:mergeSort();
-- s:shellSort();
-- s:heapSort();

