return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
                    "javascript", "html", "bash", "cmake", "cpp", "css", "csv",
                    "dockerfile", "gdscript", "gdshader", "gitignore", "go",
                    "java", "json", "jsdoc", "markdown", "markdown_inline",
                    "nginx", "python", "rust", "scss", "sql", "ssh_config",
                    "tmux", "toml", "tsx", "typescript", "typespec", "xml",
                    "yaml"
                },
                sync_install = false,
                highlight = {enable = true},
                indent = {enable = true}
            })
        end
    }
}
