Set = {};

local mt = {};


function Set.new (l)
	local set = {};
	setmetatable(set,mt);
	for _, v in ipairs(l) do
		set[v] = true;
	end
	return set;
end

function Set.union(a, b)
	if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
		error(" attempt to 'add' a set with a non-set value ",2);
	end
	local res = Set.new{};
	for k in pairs(a) do
		res[k] = true;
	end
	for k in pairs(b) do
		res[k] = true;
	end
	return res;
end

function Set.intersection(a, b)
	if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
		error(" attempt to 'mul' a set with a non-set value ",2);
	end
	local res = Set.new{};
	for k in pairs(a) do
		res[k] = b[k];
	end
	return res;
end

function Set.toString(set)
	local l = {};
	for e in pairs(set) do
		l[#l+1] = e;
	end
	return "{".. table.concat(l, ", ") .. "}";
end


function Set.print(s)
	print(Set.toString(s));
end

s1 = Set.new{10, 20, 30, 50};

for _, k in pairs(s1) do
	print(_, k);
end

print(" ---------------  ");
s2 = Set.new{30, 40, 50};

print(getmetatable(s1));
print(getmetatable(s2));


mt. __add = Set.union;

s3 = s1 + s2;

Set.print(s3);

mt. __mul = Set.intersection;

Set.print((s1 + s2) * s1);


