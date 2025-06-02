return {
	{
		"laytan/cloak.nvim",
		lazy = false,
		config = function()
			require("cloak").setup({
				patterns = {
					{
						file_pattern = "**/*.env*",
						cloak_pattern = "=.+",
					},
					{
						file_pattern = "**/*.opencode.json",
						cloak_pattern = '("apiKey":) .+',
						replace = "%1 ",
					},
				},
			})
		end,
	},
}