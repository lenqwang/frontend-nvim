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

vim.opt.rtp:prepend(lazypath)
require "plugins"

dofile(vim.g.base46_cache .. "defaults")

-- local moveline = require('moveline')
-- vim.keymap.set('n', '<M-k>', moveline.up)
-- vim.keymap.set('n', '<M-j>', moveline.down)
-- vim.keymap.set('v', '<M-k>', moveline.block_up)
-- vim.keymap.set('v', '<M-j>', moveline.block_down)
