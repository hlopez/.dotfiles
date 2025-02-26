local dap, dapui, hydra = require "dap", require "dapui", require "hydra"
-- Use "tabnew" for all debug adapters
dapui.setup()
dap.set_log_level('DEBUG') -- Set to DEBUG for verbose logging
dap.defaults.fallback.terminal_win_cmd = 'tabnew'


-- Setup Virtual Text
require("nvim-dap-virtual-text").setup {}

-- Setup Telescope dap extension
local ok_telescope, telescope = pcall(require, "telescope")
if ok_telescope then
  telescope.load_extension "dap"
end

-- Setup cmp dap
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
  cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
    sources = cmp.config.sources({
      { name = "dap" },
    }, {
      { name = "buffer" },
    }),
  })
end

-- Menu
local hint = [[
 Nvim DAP
 _d_: Start/Continue  _j_: StepOver _k_: StepOut _l_: StepInto ^
 _bp_: Toggle Breakpoint  _bc_: Conditional Breakpoint ^
 _?_: log point ^
 _c_: Run To Cursor ^
 _h_: Show information of the variable under the cursor ^
 _x_: Stop Debbuging ^
 ^^                                                      _<Esc>_
]]

hydra {
  name = "dap",
  hint = hint,
  mode = "n",
  config = {
    color = "blue",
    invoke_on_body = true,
    hint = {
      border = "rounded",
      position = "bottom",
    },
  },
  body = "<leader>d",
  heads = {
    {
      "d",
      function()
        dap.continue()
      end,
    },
    { "bp", dap.toggle_breakpoint },
    { "l",  dap.step_into },
    { "j",  dap.step_over },
    { "k",  dap.step_out },
    { "h",  dapui.eval },
    { "c",  dap.run_to_cursor },
    {
      "bc",
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          dap.set_breakpoint(condition)
        end)
      end,
    },
    {
      "?",
      function()
        vim.ui.input({ prompt = "Log: " }, function(log)
          dap.set_breakpoint(nil, nil, log)
        end)
      end,
    },
    {
      "x",
      function()
        dap.terminate()
        dapui.close {}
        dap.clear_breakpoints()
      end,
    },

    { "<Esc>", nil, { exit = true } },
  },
}


dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Load Confgis for languages
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/ugho/dap/configs/*.lua", true)) do
  loadfile(ft_path)()
end
