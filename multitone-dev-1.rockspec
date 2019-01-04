-- vim: set noexpandtab :miv --
package = "multitone"
version = "dev-1"
source = {
	url = "git://github.com/DarkWiiPlayer/multitone";
}
description = {
	summary = "A module that generates HTML/SVG code for duotone filters";
	detailed = ([[
		A module that generates HTML/SVG code for duotone filters.
		Unlike my previous script, this one actually does more than 2 colours as well.
	]]):gsub("\t", "");
	homepage = "https://github.com/DarkWiiPlayer/multitone";
	license = "Unlicense";
}
dependencies = {
	"lua >= 5.1";
	"moonxml ~> 3";
	"moonxml >= 3.2.0"
}
build = {
	type = "builtin";
	modules = {
		multitone = "src/main.lua"
	};
}
