[Multitone](https://github.com/darkwiiplayer/multitone)
=========

Improved version of my duotone script

- Ported to [moonxml](https//github.com/darkwiiplayer/moonxml)
- Extended to support more than two colors (thus renamed duotone -> multitone)
- Parsing of colors removed *because useless*™

Usage
-----

	require'multitone'.generate(print, {20, 10, 10}, {200, 100, 100}, {80, 100, 200})

Exposes a single function that takes an output function followed by an arbitrary number of RGB colors represented by 3-tuples (Sequences of length 3). Colour values are interpreted in 0...255 and are clamped to that range.

License: [The Unlicense](license.md)