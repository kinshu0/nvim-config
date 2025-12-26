vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "globals",
  "folds",
  "localoptions",
}

local session_file = ".Session.vim"

local function file_exists(path)
  local stat = vim.uv.fs_stat(path)
  return stat and stat.type == "file"
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end

    local session_path = vim.fn.getcwd() .. "/" .. session_file
    if file_exists(session_path) then
      vim.cmd("silent source " .. vim.fn.fnameescape(session_path))
    end
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end

    local session_path = vim.fn.getcwd() .. "/" .. session_file
    vim.cmd("silent mksession! " .. vim.fn.fnameescape(session_path))
  end,
})
