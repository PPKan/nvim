-- reset leader key for VSCode
if vim.g.vscode then
  vim.keymap.set("", "<Space>", "<Nop>")
  vim.g.mapleader = " "
end

-- Navigate by visual lines (wrapped lines)
if vim.g.vscode then
  local vscode = require("vscode")
  vim.keymap.set("n", "j", function()
    if vim.v.count == 0 then
      vscode.action("cursorDown")
    else
      vim.cmd("normal! " .. vim.v.count .. "j")
    end
  end, { silent = true })
  vim.keymap.set("n", "k", function()
    if vim.v.count == 0 then
      vscode.action("cursorUp")
    else
      vim.cmd("normal! " .. vim.v.count .. "k")
    end
  end, { silent = true })
  vim.keymap.set("n", "$", function() vscode.action("cursorEnd") end, { silent = true })
  vim.keymap.set("n", "0", function() vscode.action("cursorHome") end, { silent = true })
else
  vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
  vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
  vim.keymap.set("n", "$", "g$", { noremap = true, silent = true })
  vim.keymap.set("n", "0", "g0", { noremap = true, silent = true })
end

-- yank to system clipboard
if vim.g.vscode then
    -- https://github.com/vscode-neovim/vscode-neovim/issues/298
    vim.opt.clipboard:append("unnamedplus")
end

-- second clipboard followed by leader key
vim.keymap.set({ "n", "x" }, "<leader>y", '"zy', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<leader>p", '"zp', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<leader>d", '"zd', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<leader>yy", '"zyy', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<leader>dd", '"zdd', { noremap = true, silent = true })