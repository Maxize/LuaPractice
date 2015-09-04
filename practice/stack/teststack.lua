require("mystack");

a = new(Stack,10);
-- a:defaultStack();
for k = 1, 5 do
	a:push(k);
end
a:toString();
print("------------------------");

for k = 5, 1, -1 do
	print(a:pop());
end

print("Test the second demo for stack");
require("stack");
a = Stack;
a:ctor(15);
-- a:defaultStack();
for k = 1, 5 do
	a:push(k);
end
a:toString();
print("------------------------");
for k = 5, 1, -1 do
	print(a:pop());
end

