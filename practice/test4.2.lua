a = 2
b = 3
c = 1

do
	local a2 = 2*a
	local d = math.sqrt(b^2 - 4*a*c)
	x1 = (-b + d)/a2
	x2 = (-b - d)/a2
end

print(x1, x2)
