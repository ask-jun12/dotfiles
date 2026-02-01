return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>")
      vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>")
    end,
    ft = { "markdown" },
  },
}