week = {
	[1] = "Monday",
	[2] = "Tuesday",
	[3] = "Wednesday", 
	[4] = "Thursday",
	[5] = "Friday",
	[6] = "Saturday",
	[7] = "Sunday",
	["Holiday"] = "Mid-autumn festival"
}

for k, v in pairs(week) do
	print(k, v);
end

print("---------------------------------------");

for k, v in ipairs(week) do
	print(k, v);
end

print("---------------------------------------");

for k = 1, #week do
	print(week[k]);
end

