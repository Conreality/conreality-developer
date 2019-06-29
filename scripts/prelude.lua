--print("Prelude begins") -- DEBUG

printf = function(fmt, ...) print(fmt:format(...)) end
sprintf = function(fmt, ...) fmt:format(...) end

--print("Prelude ends") -- DEBUG
