--  ��֤���������˽���ԣ���һ��table��Ч

function newObject(value)
	return function (action, v)
				if action == "get" then return value;
				elseif action == "set" then value = v;
				else error("invalid action");
				end
			end
end

d = newObject(10);

print(d("get"));

d("set", 100);

print(d("get"));
