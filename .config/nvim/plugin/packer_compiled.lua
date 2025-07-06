-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/cankurttekin/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?.lua;/home/cankurttekin/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?/init.lua;/home/cankurttekin/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?.lua;/home/cankurttekin/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cankurttekin/.cache/nvim/packer_hererocks/2.1.1744318430/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  amber = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/amber",
    url = "https://github.com/camgunz/amber"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0B\0\2\1K\0\1\0\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["img-clip.nvim"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/img-clip.nvim",
    url = "https://github.com/HakonHarnes/img-clip.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nœ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\4\23section_separators\5\25component_separators\5\ntheme\tauto\18icons_enabled\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["render-markdown.nvim"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["solarized.nvim"] = {
    config = { "\27LJ\2\n¼\2\0\0\5\0\17\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0034\4\0\0=\4\v\0034\4\0\0=\4\f\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\bvim\vstyles\14variables\14functions\rkeywords\1\0\1\vitalic\2\rcomments\1\0\4\14variables\0\rcomments\0\14functions\0\rkeywords\0\1\0\1\vitalic\2\16transparent\1\0\1\venable\1\1\0\3\16transparent\0\vstyles\0\ntheme\bneo\nsetup\14solarized\frequire\0" },
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/solarized.nvim",
    url = "https://github.com/maxmx03/solarized.nvim"
  },
  ["supermaven-nvim"] = {
    config = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0æ\2\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\14condition\0\ncolor\1\0\2\ncterm\3n\21suggestion_color\f#7aa2f7\21ignore_filetypes\1\0\1\bcpp\2\fkeymaps\1\0\a\21ignore_filetypes\0\30disable_inline_completion\1\14log_level\tinfo\ncolor\0\20disable_keymaps\1\fkeymaps\0\14condition\0\1\0\3\21clear_suggestion\n<C-]>\22accept_suggestion\n<Tab>\16accept_word\n<C-j>\nsetup\20supermaven-nvim\frequire\0" },
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/supermaven-nvim",
    url = "https://github.com/supermaven-inc/supermaven-nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/cankurttekin/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0B\0\2\1K\0\1\0\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nœ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\4\23section_separators\5\25component_separators\5\ntheme\tauto\18icons_enabled\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: supermaven-nvim
time([[Config for supermaven-nvim]], true)
try_loadstring("\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0æ\2\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\14condition\0\ncolor\1\0\2\ncterm\3n\21suggestion_color\f#7aa2f7\21ignore_filetypes\1\0\1\bcpp\2\fkeymaps\1\0\a\21ignore_filetypes\0\30disable_inline_completion\1\14log_level\tinfo\ncolor\0\20disable_keymaps\1\fkeymaps\0\14condition\0\1\0\3\21clear_suggestion\n<C-]>\22accept_suggestion\n<Tab>\16accept_word\n<C-j>\nsetup\20supermaven-nvim\frequire\0", "config", "supermaven-nvim")
time([[Config for supermaven-nvim]], false)
-- Config for: solarized.nvim
time([[Config for solarized.nvim]], true)
try_loadstring("\27LJ\2\n¼\2\0\0\5\0\17\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0034\4\0\0=\4\v\0034\4\0\0=\4\f\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\bvim\vstyles\14variables\14functions\rkeywords\1\0\1\vitalic\2\rcomments\1\0\4\14variables\0\rcomments\0\14functions\0\rkeywords\0\1\0\1\vitalic\2\16transparent\1\0\1\venable\1\1\0\3\16transparent\0\vstyles\0\ntheme\bneo\nsetup\14solarized\frequire\0", "config", "solarized.nvim")
time([[Config for solarized.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
