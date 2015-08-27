--require("object");

Stack = {size = 0,array = {}};

Stack.ctor = function(self, length)
	self.size = length;
end

Stack.isEmpty = function(self)
	return #self.array == 0;
end

Stack.isFull = function(self)
	return self.size <= #self.array;
end

Stack.pop = function(self)
	if self:isEmpty() then
		print(" satck is empty");
		return;
	else
		local oldItem = self.array[self:count()];
		self.array[self:count()] = nil
		return oldItem;
	end
end

Stack.push = function(self, item)
	if self:isFull() then
		print(" stack is full");
		return;
	end
	self.array[#self.array + 1] = item;
end

Stack.size = function(self)
	return self.size;
end

Stack.count = function(self)
	return #self.array;
end

Stack.toString = function(self)
	for k, v in ipairs(self.array) do
		print(v);
	end
end



