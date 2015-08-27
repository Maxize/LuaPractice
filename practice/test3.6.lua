--[[
w = {x=0, y=0, label="console"}

-- x = {sin(0), sin(1), sin(2)}
x = {}
w[1] = "another field"

x.f = w
print(w["x"])
print(w[1])
print(w[2])
print(x.f[1])
w.x = nil

--]]
--[[
list = nil
for line in io.lines() do
	list = {next=list, value=line}
end

l = list
while l do
	print(l.value)
	l = l.next
end
--]]

polyline = {color="blue", thickness=2, npoints=4,
				{x=0, y=0},
				{x=-10, y=0},
				{x=-10, y=1},
				{x=0, y=1}
}
polyline[5] = {x=1, y=2}
print(polyline[2].x)
print(polyline[5].y)
print(polyline["thickness"])

--v = ""
for i,v in ipairs(polyline) do
	print(v.x, v.y)
end
