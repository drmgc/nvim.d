local envs = {
  enable_copilot = "NVIM_ENABLE_COPILOT",
  ts_importModuleSpecifierPreference = "NVIM_TS_importModuleSpecifierPreference",
}

local M = {
  envs,
}

---@param env_name string
---@return boolean | nil
local function get_bool_env(env_name)
  local rawEnv = vim.env[env_name]
  return tonumber(rawEnv or 0) > 0
end

---@param env_name string
---@param enum string[]
---@return string | nil
local function get_enum_env(env_name, enum)
  local rawEnv = vim.env[env_name]
  for _, value in pairs(enum) do
    if value == rawEnv then return rawEnv end
  end

  vim.notify("Invalid " .. env_name .. ": " .. rawEnv, vim.log.levels.ERROR)
  return nil
end

M.enable_copilot = get_bool_env(envs.enable_copilot)
M.ts = {
  importModuleSpecifierPreference = get_enum_env(
    envs.ts_importModuleSpecifierPreference,
    { "shortest", "project-relative", "relative", "non-relative" }
  ),
}

return M
