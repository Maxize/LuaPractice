List = {};
function List.new()
	return {first = 0, last = -1};
end

function List.pushfirst(list, value)
	local first = list.first - 1;
	list.first = first;
	list[first] = value;
end

function List.pushlast(list, value)
	local last = list.last + 1;
	list.last = last + 1;
	list[last] = value;
end

function List.popfirst(list, value)
	local first = list.first;
	if first > list.last then
		error(" list is empty ! ");
	end
	local value = list[first];
	list[first] = nil;
	list.first = first + 1;
	return value
end

function List.poplast(list, value)
	local last = list.last;
	if last < list.first then
		error(" list is empty");
	end
	local value = list[last];
	list[last] = nil;
	list.last = last - 1;
	return value
end

