names = {"Perter", "Paul", "Mary"}
grades = {Mary = 10, Paul = 7, Perter = 8}
table.sort(names, function (n1, n2)
	return grades[n1] > grades[n2] end
)

for i,n in ipairs(names) do
print(n);
end
