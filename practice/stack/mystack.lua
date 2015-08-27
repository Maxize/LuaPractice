--require("object");

Stack = class();

Stack.defaultStack = function(self)
	size = 0;
	array = {};
	for k = 1, 50 do
		array[k] = 0;
	end
end

Stack.ctor = function(self, length)
	size = 0;
	array = {};
	for k = 1, length do
		array[k] = 0;
	end 
end

Stack.isEmpty = function(self)
	return size == 0;
end

Stack.pop = function(self)
	if size == 0 then
		print(" satck is empty");
		return;
	else
		local oldSize = size;
		size = size - 1;
		return array[oldSize];
	end
end

Stack.push = function(self, item)
	if size >= #array then
		print(" stack is full");
		return;
	end
--	local oldSize = size;
	size = size + 1;
	array[size] = item;
end

Stack.size = function(self)
	return size;
end

Stack.toString = function(self)
	for k= size, 1, -1 do
		print(array[k]);
	end
end



