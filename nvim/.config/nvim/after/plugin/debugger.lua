--require("dapui").setup()
-- require("dap-ruby").setup()
-- require("mason-nvim-dap").setup({ ensure_installed = { "firefox", "chrome", "node2" } })
-- in lua/ugho/dap/init.lua
require("ugho/dap")

local ok_telescope, telescope = pcall(require, "telescope")
if ok_telescope then
  telescope.load_extension("dap")
end

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
