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

      for _, pkg_name in ipairs(vim.tbl_keys(lockfile_json)) do
        local pkg = registry.get_package(pkg_name)
        local name = pkg.spec.neovim and pkg.spec.neovim.lspconfig or pkg_name
        if name then
          vim.lsp.enable(name)
        end
      end
    end,
  },
}
