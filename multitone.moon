moonxml = require'moonxml'

import max, min from math
import format from string
normalize = (color) ->
  format '%1.4f', min(255, max 0, color)/255

generator = (...) ->
  args    = {...}
  colors  = [tab for tab in *args when #tab==3]
  options = [tab for tab in *args when #tab==0]
  options = options[#options] or {}
  concat  = (t) -> table.concat t, ' '
  svg {
    xmlns: 'http://www.w3.org/2000/svg'
    width: 0
    height: 0
		class: options.class or 'multitone'
  }, ->
    filter {
      id: options.id or 'multitone'
    }, ->
      feColorMatrix type: 'matrix', values: concat {
        '.375 .500 .125 0 0'
        '.375 .500 .125 0 0'
        '.375 .500 .125 0 0'
        '0 0 0 1 0'
      }
      feComponentTransfer {['color-interpolation-filter']: 'sRGB'}, ->
        for idx,func in ipairs{feFuncR, feFuncG, feFuncB}
          func type: 'table', tableValues:
            concat [normalize color[idx] for color in *colors]

buffer = ->
	b = {}
	((str) -> table.insert(b, str)), (-> table.concat(b, '\n'))

lang = moonxml.xml\derive!

{
	generate: (...) ->
		insert, result = buffer!
		lang.environment.print = insert
		lang\hack(generator, ...)
		result!
}
