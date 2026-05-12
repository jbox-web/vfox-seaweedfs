--- Returns download information for a specific version
--- Documentation: https://mise.jdx.dev/tool-plugin-development.html#preinstall-hook
--- @param ctx {version: string, runtimeVersion: string} Context
--- @return table Version and download information

require("base")
require("checksum")

function PLUGIN:PreInstall(ctx)
  local github_repo = "seaweedfs/seaweedfs"
  local version     = ctx.version
  local url         = github_download_url(github_repo, version)
  local md5         = fetch_checksum(github_repo, version)

  return {
    version = version,
    url     = url,
    md5     = md5,
    note    = "Downloading " .. PLUGIN.name .. " " .. version,
  }
end
