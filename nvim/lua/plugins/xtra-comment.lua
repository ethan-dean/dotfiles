-- Enable commenting code out with <C-/>
return {
  "numtoStr/Comment.nvim",
  opts = {
    toggler = {
			line = "gcc",
			block = "gbc",
		},
  },
  lazy = false,
}
