require "testfor16_2_account";
--[[
-- Account类 begin

Account = { balance = 0};

function Account:new (o)
	o = o or {};
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function Account:deposit (v)
	self.balance = self.balance + v;
end

function Account:withdraw (v)
	if v > self.balance then error "insufficient funds" end
	self.balance = self.balance - v;
end
-- Account类 end
--]]

local function search (k, plist)
	for i=1, #plist do
		local v = plist[i][k];
		if v  then return v; end
	end
end

function createClass (...)
	local c = {};
	local parents = {...};

	setmetatable(c, {__index = function (t, k)
						return search(k, parents);
					end
	});

	c.__index = c;

	function c:new (o)
		o = o or {};
		setmetatable(o, c);
		return o;
	end
	return c;
end

-- Named 类 begin

Named = {};

function Named:getname ()
	return self.name;
end

function Named:setname (n)
	self.name = n;
end

-- Named 类 end

NamedAccount = createClass(Account, Named);
account = NamedAccount:new{name = "Paul"};
print(account:getname());
