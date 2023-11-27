require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'c', 'cpp', 'css', 'json', 'nix', 'regex', 'rust', 'sql', 'yaml', 'zig',

		-- git
		'diff', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit',

		-- go
		'go', 'gomod', 'gosum', 'gowork',

		-- python
		'python',

		-- ruby
		'ruby', 'embedded_template',

		-- terraform
		'hcl', 'terraform',

		-- vim
		'lua', 'vim', 'vimdoc',

		-- shell
		'bash', 'fish',
	}
}
