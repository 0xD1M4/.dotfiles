require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local colors = require("base46").get_theme_tb "base_30"

    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "NONE", fg = colors.green })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "NONE", fg = colors.red })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "NONE", fg = colors.green })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = colors.black })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = colors.black })

    -- https://github.com/NeogitOrg/neogit/blob/master/lua/neogit/lib/hl.lua#L142
    vim.api.nvim_set_hl(0, "NeogitDiffDelete", { fg = "#e06c75", bg = "#4f2629" }) -- Removed
    vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#e06c75", bg = "#4f2629" }) -- Removed

    vim.api.nvim_set_hl(0, "NeogitDiffAdd", { fg = "#98c379", bg = "#2c3a37" }) -- Removed
    vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = "#98c379", bg = "#2c3a37" }) -- Removed

    if next(vim.fn.argv()) == nil then
      vim.cmd "SessionManager! load_session"
    end
  end,
})
