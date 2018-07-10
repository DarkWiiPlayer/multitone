xml = require'moonxml'.build

import max, min from math
import format from string
normalize = (color) ->
  format '%1.4f', min(255, max 0, color)/255

multitone = xml (...) ->
  colors = {...}
  concat = (t) -> table.concat t, ' '
  svg {
    xmlns: 'http://www.w3.org/2000/svg'
    width: 0
    height: 0
  }, ->
    filter ->
      feColorMatrix type: 'matrix', values: concat {
        '1 0 0 0 0'
        '1 0 0 0 0'
        '1 0 0 0 0'
        '0 0 0 1 0'
      }
      feComponentTransfer {['color-interpolation-filter']: 'sRGB'}, ->
        for idx,func in ipairs{feFuncR, feFuncG, feFuncB}
          func type: 'table', tableValues:
            concat [normalize color[idx] for color in *colors]
