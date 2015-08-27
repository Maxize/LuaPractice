-- object.lua
-- Description: Provide object mechanism for lua


-- Note for the object model here:
--		1The feature like C++ static members is not support so perfect.
--		What that means is that if u need something like c++ static members,
--		U can access it as a right value like C++, but if u need access it
--		as a left value u must use [class.member] to access,but not [object.member].
--		2The function delete cannot release the object, because the parameters are
--		passed by value in lua.If u want to relase all the object memory , u have to 
--      set the obj to nil to enable lua gc to recover the memory after calling delete.


---------------------Global functon new -------------------------------------------------
--Parameters: 	class_type -- Table(As Class in C++)
-- 				...		   -- All other parameters requisted in constructor
--Return 	:   return an object
--Note		:	This function is defined to simulate C++ new function.
--				First it called the constructor of base class then to be derived class's.
-----------------------------------------------------------------------------------------
new = function(class_type,...)
    local obj = {};
    local mt = getmetatable(class_type);
    setmetatable(obj, { __index = class_type; __newindex = mt and mt.__newindex;});
    do
        local create;
        create =
            function(c, ...)
                if c.super then
                    create(c.super, ...);
                end
                if rawget(c,"ctor") then
                    c.ctor(obj, ...);
                end
            end

        create(class_type, ...);
    end
    
    return obj;
end

---------------------Global functon delete ----------------------------------------------
--Parameters: 	obj -- the object to be deleted
--Return 	:   no return
--Note		:	This function is defined to simulate C++ delete function.
--				First it called the destructor of derived class then to be base class's.
-----------------------------------------------------------------------------------------

delete = function(obj)
    do
        local destory =
            function(c)
                while c do
                    if rawget(c,"dtor") then
                        c.dtor(obj);
                    end
              
                    c = getmetatable(c);
                    c = c and c.__index;                   
                end
            end
        _G[tostring(obj)] = nil;
        destory(obj);
    end
end

---------------------Global functon delete ----------------------------------------------
--Parameters: 	super -- the super class to inherit
--Return 	:   return a derived class
-----------------------------------------------------------------------------------------

function class(super)
    local class_type    = {};

    if super then
		class_type.super    = super;
		local mt = getmetatable(super);
		setmetatable(class_type, { __index = super; __newindex = mt and mt.__newindex;});
    end

    return class_type;
end

