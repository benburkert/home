local lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json"

return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'zapling/mason-lock.nvim',
    opts = {
        lockfile_path = lockfile_path,
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function ()
      local registry = require("mason-registry")
      local lockfile_json = vim.json.decode(io.open(lockfile_path):read('*all'))

      local packages = vim.tbl_map(
        function (pkg_name)
          local pkg = registry.get_package(pkg_name)
          if pkg.spec.neovim == nil then
              return pkg_name
          end
          return pkg.spec.neovim.lspconfig
        end,
        vim.tbl_keys(lockfile_json)
      )

      require('mason-lspconfig').setup({
        ensure_installed = packages,
      })
    end,
  },
}
