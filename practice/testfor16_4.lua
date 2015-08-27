--[[  原始版本 建立account的工厂模式

function newAccount (initialBalance)
	local self = {balance = initialBalance};
	local withdraw = function (v)
						self.balance = self.balance - v;
					end;
	local deposit = function (v)
						self.balance = self.balance + v;
					end;

	local getBalance = function () return self.balance end;

	return {
		withdraw = withdraw,
		deposit = deposit,
		getBalance = getBalance
	}

end


--]]

--  设置私有成员
function newAccount (initialBalance)
	local self = {
		balance = initialBalance,
		LIM = 10000.00,
	};

	local extra = function ()
		if self.balance > self.LIM then
			return self.balance * 0.10;
		else
			return 0;
		end
	end

	local withdraw = function (v)
						self.balance = self.balance - v;
					end;
	local deposit = function (v)
						self.balance = self.balance + v;
					end;

	local getBalance = function () return self.balance + extra(); end;

	return {
		-- extra = extra,
		withdraw = withdraw,
		deposit = deposit,
		getBalance = getBalance,
	}

end


acc1 = newAccount (100.00);
acc1.withdraw(110.00);
-- print(acc1.extra());
print(acc1.getBalance());
