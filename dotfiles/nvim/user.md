# Neovim keybindings

Press `Esc` to return to Normal mode. **Leader is Space**. Press the keys in a sequence one after another. For example, `<leader>w` means press Space, then `w`.

## Start here

| Keys | Action |
| --- | --- |
| `i`, `a`, `o` | Insert before the cursor, after it, or on a new line below |
| `h` `j` `k` `l` | Move left, down, up, right |
| `w`, `b`, `gg`, `G` | Next word, previous word, first line, last line |
| `v`, `V` | Select characters or whole lines |
| `yy`, `dd`, `p` | Copy a line, cut a line, paste after the cursor |
| `u`, `Ctrl-r` | Undo, redo |
| `Space w`, `:q` | Save, quit |
| `Space u` | Open this guide |

Run `:Tutor` for a hands-on introduction. Try opening a scratch file with `:edit /tmp/nvim-practice.md`, typing a few lines, saving with `Space w`, and experimenting with undo.

## Navigate files and notes

| Keys | Action |
| --- | --- |
| `Space e` | Browse the current file's directory. Press Enter to open a file |
| `:e path` | Open a file. Use Tab to complete the path |
| `:ls`, `:b NUMBER` | List buffers, switch to the given buffer |
| `:split`, `:vsplit` | Open a horizontal or vertical split |
| `Ctrl-w` then `h` `j` `k` `l` | Move between splits |
| `/text` then Enter, `n`, `N` | Search the current buffer, then move through matches |
| `Space g` | Search for literal text from the current file's Git root or the working directory |
| `[q`, `]q`, `:cclose` | Previous result, next result, close the results window |

From the results window, press Enter to open a match. Project search uses ripgrep and respects ignore rules.

## Code navigation and completion

Language servers are enabled when their executables are on your PATH. This setup recognizes `clangd` for C/C++, `pyright-langserver` for Python, and `marksman` for Markdown. Use `:checkhealth vim.lsp` to see what is attached.

| Keys | Action |
| --- | --- |
| `gd`, `grr`, `K` | Go to definition, find references, show hover documentation |
| `grn`, `gra` | Rename a symbol, open code actions |
| `[d`, `]d`, `Space d` | Previous diagnostic, next diagnostic, show diagnostic details |
| `Ctrl-n` / `Ctrl-p` | Select next or previous completion item |
| `Ctrl-y`, `Ctrl-e` | Accept or dismiss the completion menu |

Code actions and navigation depend on the attached language server. With no server, `Ctrl-n` and `Ctrl-p` still offer words from open buffers.
