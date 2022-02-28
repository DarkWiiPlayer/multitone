[Multitone](https://github.com/darkwiiplayer/multitone)
=========

Improved version of my duotone script.
It generates an SVG element with a svg-filter that can be applied to any other HTML element.
When called with two colours, it generates a duotone effect.
More colours can be used as well.

- Ported to [moonxml](https://github.com/darkwiiplayer/moonxml)
- Extended to support more than two colors (thus renamed duotone -> multitone)
- Parsing of colors removed *because useless*™

Here's a showcase of the effect: [codepen.io/darkwiiplayer/details/vaEKNQ](https://codepen.io/darkwiiplayer/details/vaEKNQ/)

Usage
-----

The repository provides both a JavaScript and a Lua implementation of the
multitone filter generator. Both versions of the generator follow the same API
and generate the same filter for equal input.
The Lua version returns a string of SVG code representing the filter.
The JavaScript version returns an SVG Dom node.

The generator accepts an ID to be applied to the filter element and a list of
colours represented as 3-tuples of values between 0 and 1 representing the RGB
colour channels. Out-of-range values will be clamped.

The filter will first map the input colour to its luminosity as a value between
black and white, then map this black-white gradient to a gradient where each of
the input colours represents a colour stop.

### Lua Usage

	local multitone = require('multitone')
	multitone("multitone", {0, 0, 1}, {0, 1, 1})

### JS Usage

	import multitone from 'multitone'
	let filter = multitone("multitone", [0, 0, 1], [0, 1, 1])

License: [The Unlicense](license.md)
