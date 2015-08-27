--[[

Account = {["balance"] = 0};

function Account.withdraw (self, v)
	self.balance = self.balance - v;
end


-- Account.withdraw(100.00);

print (Account.balance);


a1 = Account;
Account = nil;

a1.withdraw(a1, 100.00);

print (a1.balance);


a2 = {balance = 0, withdraw = Account.withdraw};


a2.withdraw(a2, 260.00);
print(a2.balance);

--]]


--  冒号和点的区别  冒号可以隐藏一个额外的参数
Account = {balance = 0,
			withdraw = function (self, v)
				self.balance = self.balance - v;
			end
		};

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
	self.balance = self.balance - v;
end
--[[
a = Account;
Account = nil;

a.withdraw(a, 100.00);

a:withdraw(100.00);

print(a.balance);

--]]

b = Account:new();

b:deposit(500);
print(b.balance);
