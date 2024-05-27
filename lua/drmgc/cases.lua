local M = {}

---@param str string
---@return string
function M.normalize(str)
  local spaces = str:gsub("[-%._%s]+", " ")
  local words = spaces:gsub("(%l)(%u)", function(a, b) return a .. " " .. b end)

  return string.lower(words)
end

---@param str string
---@return string
function M.to_camel(str)
  local normalized = M.normalize(str)
  local converted = normalized:gsub("%s(%w)", function(letter) return string.upper(letter) end)
  return converted
end

---@param str string
---@return string
function M.to_pascal(str)
  local camel = M.to_camel(str)
  local converted = camel:gsub("^%l", string.upper)
  return converted
end

return M
