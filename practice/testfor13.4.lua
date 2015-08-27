Window = {}

Window.prototype = {x=0, y=0, width=100, height=100};

Window.mt = {}
function Window.new (o)
	setmetatable(o, Window.mt);
	return o;
end

Window.mt.__index = function (table, key)
	return Window.prototype[key];
end

w = Window.new {x=10, y=20}
print(w.width);


-- 将一个table作为__index 元方法是一种快捷的、实现单一继承的方式。


-- 函数更灵活，可以实现多继承、缓存及其他一些功能


---13.4.3

--  设置table的默认值

--[[


function setDefault (t, d)
	local mt = {
		__index = function () return d end
	};
	setmetatable(t, mt);
end



local mt = P{__index = function (t) return t.___ end}
function setDefault (t, d)
	t.___ = d;
	setmetatable(t, mt);
end
--]]
--[[


local key = {};
local mt = {__index = function (t) return t[key] end}

function setDefault (t, d)
	t[key] = d;
	setmetatable(t, mt);
end



tab = {x=10, y=20};
print(tab.x, tab.z);
setDefault(tab, 0);
print(tab.x, tab.z);


--  13.4.4

t = {};

local _t = t;

t = {};

local mt = {
	__index = function (t, k)
		print("*access to elemetn " .. tostring(k));
		return _t[k];
	end,
	__newindex = function (t, k, v)
		print("update of element " .. tostring(k) .. " to " .. tostring(v));
		_t[k] = v;
	end
}
setmetatable(t, mt);

t[2] = "hello";

print(t[2]);

--]]

-- 13.4.4b
local index = {};

local mt = {
	__index = function (t, k)
		print("*access to elemetn " .. tostring(k));
		return t[index][k];
	end,

	__newindex = function (t, k, v)
		print("update of element " .. tostring(k) .. " to " .. tostring(v));
		t[index][k] = v;
	end
}

function track (t)
	local proxy = {};
	proxy[index] = t;
	setmetatable(proxy, mt);
	return proxy;
end


-- 13.4.5

function readOnly (t)
	local proxy = {};
	local mt = {
		__index = t,
		__newindex = function (t, k, v)
			error("attempt to update a read-only table ", 2);
		end
	}
	setmetatable(proxy, mt);
	return proxy;
end

days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

print(days[1]);
days[2] = "Noday";

