return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "markdown_inline",
        "javascript",
        "markdown",
        "c_sharp",
        "vimdoc",
        "python",
        "java",
        "html",
        "css",
        "vim",
        "lua",
        "cpp",
        "go",
        "c",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    })
  end
}
