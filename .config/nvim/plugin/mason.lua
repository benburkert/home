local lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json"

return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'zapling/mason-lock.nvim',
    init = function()
      require("mason-lock").setup({
        lockfile_path = lockfile_path,
      })

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

      for _, pkg in ipairs(packages) do
        vim.lsp.enable(pkg)
      end
    end,
  },
}
