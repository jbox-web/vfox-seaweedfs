--- Performs additional setup after installation
--- Documentation: https://mise.jdx.dev/tool-plugin-development.html#postinstall-hook
--- @param ctx {rootPath: string, runtimeVersion: string, sdkInfo: table} Context

require("base")

function PLUGIN:PostInstall(ctx)
  local sdkInfo = ctx.sdkInfo[PLUGIN.name]
  local path = sdkInfo.path

  -- Verify installation works
  local destFile = path .. "/" .. "weed"

  local result = os.execute(destFile .. " version")
  if result ~= 0 then
    error(PLUGIN.name .. " installation appears to be broken")
  end
end
