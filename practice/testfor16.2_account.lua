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

SpecialAccount = Account:new ();

function SpecialAccount:withdraw (v)
	if v - self.balance >= self:getLimit() then
		error "insufficient funds ";
	end
	self.balance = self.balance - v;
end

function SpecialAccount:getLimit ()
	return self.limit or 0;
end

s = SpecialAccount:new{limit = 1000.0};

function s:getLimit ()
	return self.balance * 0.10;
end


-- return Account;

--[[

s:deposit(1000);


s:withdraw(1099.00);

print(s.balance);

--]]
