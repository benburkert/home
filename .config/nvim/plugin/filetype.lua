require('filetype').setup {
  overrides = {
    extensions = {
      -- terraform
      tf = 'terraform',
      tfvar = 'terraform',
    },
  },
}
