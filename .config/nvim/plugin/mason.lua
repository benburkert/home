local lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json"

return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'zapling/mason-lock.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    config = function()
      local registry = require("mason-registry")
      local lockfile_json = vim.json.decode(io.open(lockfile_path):read('*all'))

      -- mason-lock rewrites the lockfile from the installed packages after
      -- every install, so only set it up once the missing packages are in.
      local setup = vim.schedule_wrap(function()
        require("mason-lock").setup({
          lockfile_path = lockfile_path,
        })
      end)

      registry.refresh(function()
        local pending = 0
        for pkg_name, version in pairs(lockfile_json) do
          local pkg = registry.get_package(pkg_name)
          if not pkg:is_installed() then
            pending = pending + 1
            pkg:install({ version = version }):once("closed", function()
              pending = pending - 1
              if pending == 0 then
                setup()
              end
            end)
          end
        end
        if pending == 0 then
          setup()
        end
      end)
    end,
  },
}
