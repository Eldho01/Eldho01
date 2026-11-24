vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 5

local map = vim.keymap.set
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save buffer" })
map("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Browse files beside current buffer" })
map("n", "<leader>u", function()
  vim.cmd.edit(vim.fn.stdpath("config") .. "/user.md")
end, { desc = "Open keybinding guide" })
map("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous search result" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next search result" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })

map("n", "<leader>g", function()
  local query = vim.fn.input("Search text: ")
  if query == "" then
    return
  end

  local root = vim.fs.root(0, ".git") or vim.fn.getcwd()
  local result = vim.system({
    "rg", "--vimgrep", "--color=never", "--fixed-strings", "--smart-case", "--", query, root,
  }, { text = true }):wait()
  if result.code > 1 then
    vim.notify(result.stderr, vim.log.levels.ERROR)
    return
  end

  vim.fn.setqflist({}, " ", {
    title = "Search: " .. query,
    lines = vim.split(result.stdout, "\n", { trimempty = true }),
    efm = "%f:%l:%c:%m",
  })
  if result.code == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
    vim.notify("No matches")
  end
end, { desc = "Search project text" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method("textDocument/completion", event.buf) then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
    map("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
  end,
})

local servers = {
  clangd = { filetypes = { "c", "cpp", "objc", "objcpp" }, root_markers = { "compile_commands.json", "compile_flags.txt", ".git" } },
  ["pyright-langserver"] = { args = { "--stdio" }, filetypes = { "python" }, root_markers = { "pyproject.toml", ".git" } },
  marksman = { args = { "server" }, filetypes = { "markdown" }, root_markers = { ".marksman.toml", ".git" } },
}

for executable, server in pairs(servers) do
  if vim.fn.executable(executable) == 1 then
    vim.lsp.config(executable, {
      cmd = vim.list_extend({ executable }, server.args or {}),
      filetypes = server.filetypes,
      root_markers = server.root_markers,
    })
    vim.lsp.enable(executable)
  end
end
