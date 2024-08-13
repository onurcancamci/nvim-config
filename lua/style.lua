require("tokyonight").setup({
    -- use the night style
    style = "night",
    -- disable italic for functions
    styles = {comments = {italic = false}, keywords = {italic = false}},
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    on_colors = function(colors)
        -- colors.hint = colors.orange
        -- colors.error = "#ff0000"
    end
})

-- require('ayu').colorscheme()
vim.cmd [[colorscheme tokyonight]]
-- vim.cmd.colorscheme "catppuccin-mocha"
