local envs = {
  enable_copilot = "NVIM_ENABLE_COPILOT",
}

local M = {
  envs,
}

local function get_bool_env(env_name)
  local rawEnv = vim.env[env_name]
  return tonumber(rawEnv or 0) > 0
end

M.enable_copilot = get_bool_env(envs.enable_copilot)

return M
