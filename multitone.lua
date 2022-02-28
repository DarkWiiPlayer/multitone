--- Module to generate a duotone effect.
-- It also supports gradients of more than two colors.
local base = [[
<filter id='$id'>
	<feColorMatrix type="matrix" values=".375 .5 .125 0 0 .375 .5 .125 0 0 .375 .5 .125 0 0 0 0 0 1 0" />
	<feComponentTransfer color-interpolation-filter="sRGB">
		<feFuncR type="table" tableValues="$red" />
		<feFuncG type="table" tableValues="$green" />
		<feFuncB type="table" tableValues="$blue" />
	</feComponentTransfer>
</filter>
]]

local function normal(number)
	return math.min(1, math.max(0, math.floor(number*1000)/1000))
end

local function multitone(id, ...)
	local components = {{}, {}, {}}
	for i, color in ipairs({...}) do
		components[1][i] = tostring(normal(color[1]))
		components[2][i] = tostring(normal(color[2]))
		components[3][i] = tostring(normal(color[3]))
	end
	local options = {
		red = table.concat(components[1], ' ');
		green = table.concat(components[2], ' ');
		blue = table.concat(components[3], ' ');
		id = id
	}
	return (base:gsub("$%w+", function(key)
		return options[key:sub(2)] or error("Key "..key.." not found in options!")
	end))
end

return multitone
