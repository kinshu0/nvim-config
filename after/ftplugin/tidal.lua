-- <localleader>a : send every paragraph in the file to Tidal, one block at a time.
-- vim-tidal's region-send wraps a selection in a single :{ :} so multiple
-- blocks would be glued into one expression; this sends them separately.
vim.keymap.set("n", "<localleader>a", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local start = nil
  for i, l in ipairs(lines) do
    local blank = l:match("^%s*$") ~= nil
    if not blank and not start then start = i end
    if (blank or i == #lines) and start then
      local stop = blank and i - 1 or i
      vim.cmd(start .. "," .. stop .. "TidalSend")
      start = nil
    end
  end
end, { buffer = true, desc = "Tidal: send all paragraphs" })
