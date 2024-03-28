#!/usr/bin/env lua

local exec = os.execute;

local src = arg[1];
local out = src .. ".out"

function remove(path)
	return exec(("rm %s"):format(path));
end

function touch(path)
	return exec(("touch %s"):format(path));
end

if not exec(("gcc %s -o %s"):format(src, out))
then
	touch(src .. ".fail");
	print "Compilation Failed!";
	return 0;
end

exec(("./%s > %s.list"):format(out, src));

local file = assert(io.open(src .. ".list"));
local list = file:read("a");
file:close();
exec(("rm %s"):format(src .. ".list"));

for s in list:gmatch("%s(%d+)%s")
do
	if not exec(("./%s %s"):format(out, s))
	then
		touch(src .. ".fail");
		print "Run test failed!";
		goto exit;
	end
end

print(("%s succeeded"):format(src));

::exit::
exec(("rm %s"):format(out));
