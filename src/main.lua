local xml = require('moonxml').build
local max, min
do
  local _obj_0 = math
  max, min = _obj_0.max, _obj_0.min
end
local format
format = string.format
local normalize
normalize = function(color)
  return format('%1.4f', min(255, max(0, color)) / 255)
end
local generate = xml(function(...)
  local colors = {
    ...
  }
  local concat
  concat = function(t)
    return table.concat(t, ' ')
  end
  return svg({
    xmlns = 'http://www.w3.org/2000/svg',
    width = 0,
    height = 0
  }, function()
    return filter(function()
      feColorMatrix({
        type = 'matrix',
        values = concat({
          '.375 .5 .125 0 0',
          '.375 .5 .125 0 0',
          '.375 .5 .125 0 0',
          '0 0 0 1 0'
        })
      })
      return feComponentTransfer({
        ['color-interpolation-filter'] = 'sRGB'
      }, function()
        for idx, func in ipairs({
          feFuncR,
          feFuncG,
          feFuncB
        }) do
          func({
            type = 'table',
            tableValues = concat((function()
              local _accum_0 = { }
              local _len_0 = 1
              for _index_0 = 1, #colors do
                local color = colors[_index_0]
                _accum_0[_len_0] = normalize(color[idx])
                _len_0 = _len_0 + 1
              end
              return _accum_0
            end)())
          })
        end
      end)
    end)
  end)
end)
return {
  generate = generate
}
