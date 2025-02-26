local dap = require('dap')

vim.fn.setenv("RUBY_DEBUG_PORT", "3968")
vim.fn.setenv("RUBY_DEBUG_HOST", "127.0.0.1")
vim.fn.setenv("RUBYOPT", "-rdebug/open")

dap.adapters.ruby = {
  -- type = "executable",
  --  command = vim.fn.exepath("rdbg"),
  type = 'executable',
  command = '/Users/hugo.lopez/.rbenv/shims/rdbg',
}

dap.configurations.ruby = {
  {
    type = "ruby",
    name = "Debug Rails Server",
    request = "launch",
    --request = "attach",

    program = "run_intranet.sh", -- Script or Rails entry point
    -- program = "rails server", -- Script or Rails entry point
    projectDir = "${workspaceFolder}",
    exitAfterTaskReturns = false,
    debugAutoInterpretAllModules = false,
  },
}



-- local dap = require "dap"
-- local rdbg_debugger = vim.fn.exepath "rdbg"
--
--
-- if rdbg_debugger ~= "" then
--   dap.adapters.ruby = {
--     type = "executable",
--     command = rdbg_debugger,
--     options = {
--       env = {
--         RUBY_DEBUG_OPEN = true,
--         RUBY_DEBUG_PORT = '4000',
--         RUBY_DEBUG_HOST = '127.0.0.1',
--         RUBYOPT = '-rdebug/open',
--       }
--     }
--   }
--
--   dap.configurations.ruby = {
--     {
--       type = "ruby",
--       name = "rails server",
--       task = "run_intranet.sh",
--       --      request = "launch",
--       request = "attach",
--       projectDir = "${workspaceFolder}",
--       exitAfterTaskReturns = false,
--       debugAutoInterpretAllModules = false,
--     },
--   }
-- end

-- Command may not be in path, so travel up the directory tree to find it
-- local function find_cmd_dir(cmd)
--   local filepath = vim.fn.getcwd()
--   local og_filepath = filepath
--   if vim.fn.executable(cmd) == 1 then
--     return filepath
--   end
--   while filepath ~= "" and filepath ~= "/" do
--     if vim.fn.executable(filepath .. "/" .. cmd) == 1 then
--       return filepath
--     end
--     filepath = vim.fn.fnamemodify(filepath, ':h')
--   end
--   error(cmd .. " not found in " .. og_filepath .. " or any of its ancestors")
-- end
--
-- local function run_cmd(cmd, args, for_current_line, for_current_file, error_on_failure)
--   local handle
--   local pid_or_err
--   local stdout = vim.loop.new_pipe(false)
--   local working_dir = find_cmd_dir(cmd)
--   args = args or {}
--   if for_current_line then
--     table.insert(args, vim.fn.expand("%:p") .. ":" .. vim.fn.line("."))
--   elseif for_current_file then
--     table.insert(args, vim.fn.expand("%:p"))
--   end
--   local opts = { args = args, cwd = working_dir, stdio = { nil, stdout } }
--
--   handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
--     if handle then
--       handle:close()
--     end
--     if error_on_failure and code ~= 0 then
--       local full_cmd = cmd .. " " .. table.concat(args, " ")
--       error("Command `" .. full_cmd .. "` ran from `" .. working_dir .. "` exited with code " .. code)
--     end
--   end)
--
--   assert(handle, "Error running command: " .. cmd .. tostring(pid_or_err))
--
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require("dap.repl").append(chunk)
--       end)
--     end
--   end)
-- end
--
--
-- local base_config = { type = "ruby", request = "attach", options = { source_filetype = "ruby" }, error_on_failure = true, localfs = true }
-- local run_config = vim.tbl_extend("force", base_config, { waiting = 1000, random_port = true })
-- local function extend_run_config(config)
--   return vim.tbl_extend("force", run_config, config)
-- end
-- dap.configurations.ruby = {
--   --    extend_run_config({ name = "run rails", command = "bundle", args = { "exec", "rails", "s" } }),
--   extend_run_config({ name = "run rails", command = "run_intranet.sh" }),
-- }
