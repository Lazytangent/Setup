## Installing Neovim Nightly

Install luajit and luarocks first:

```sh
brew install --HEAD luajit luarocks
```

If it gives you an error about them being already installed, run

```sh
brew unlink <package_name>
```

Then, run the install for those packages again. You might have to do that for
Neovim as well.

```sh
brew install --HEAD neovim
```

### Installing Language Servers for Nvim-LspConfig

#### `npm` Install Command

```sh
npm i -g \
    @angular/language-server \
    bash-language-server \
    dockerfile-language-server-nodejs \
    pyright \
    typescript \
    graphql-language-service-cli \
    vscode-langservers-extracted \
    typescript-language-server \
    vim-language-server \
    sql-language-server \
    yaml-language-server \
    @prisma/language-server \
    stylelint-lsp \
    @tailwindcss/language-server \
    vls
```

#### Other installs

```sh
pip install -U \
    jedi-language-server \
    python-lsp-server \
    'python-lsp-server[all]' \
    black
```

```sh
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```

```sh
cargo install stylua
```

```sh
brew install \
    efm-langserver \
    rust-analyzer \
    shellcheck \
    terraform-ls \
    terraform-lsp
```

Using go instead:

```sh
go get github.com/mattn/efm-langserver
```

```sh
gem install solargraph
gem install rubocop
```


### Rust Language Server (Rust needs to be installed)

#### Manual Installation
Download the binary from `https://github.com/rust-analyzer/rust-analyzer` and
place in PATH.
```sh
rustup component add rust-src
```

Or add it via `rustup`
```sh
rustup +nightly component add rust-analyzer-preview
```

Install `rust-analyzer` into `~/.local/bin` with

Make sure the `~/.local/bin` directory exists first.

```sh
mkdir -p ~/.local/bin
```

```sh
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-<version>.gz \
    | gunzip -c - > ~/.local/bin/rust-analyzer
```

Let the script be executable

```sh
chmod +x ~/.local/bin/rust-analyzer
```

### Elixirls

[Elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls)
[Erlangls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#erlangls)

## Nvim-Treesitter Troubleshooting

If you get an error about something, something, "wrong architecture".

* Try running `:TSUninstall all`, then reinstall all parsers with `:TSInstall
    all`
## Octo.nvim

This plugin requires that you have the GitHub CLI command `gh` installed.

On devices with Homebrew installed, you can run

```sh
brew install gh
```
## `debugpy`
Following the instructions from mfussenegger's nvim-dap-python repository on
GitHub: <https://github.com/mfussenegger/nvim-dap-python>

```bash
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

Changing the `pip` command to `pip install -U pip debugpy` will updated pip and
install `debugpy`.

The `setup` for the `dap-python` plugin will require the full path to the
`python` executable that has `debugpy` installed.

## Neotest for Rust
The `neotest-rust` plugin that provides support for running tests in the Rust
programming language in Neovim via neotest requires that `cargo-nextest` is
installed.

Install with `cargo` by running:
```bash
cargo install cargo-nextest
```
## Jdtls Setup for Neovim on Arch Linux
### Using a package manager
`jdtls` is available as a package that includes a binary and configurations in
the AUR. You can install it with `yay`:
```bash
yay jdtls
```

Once installed, you'll need to update your `jdtls` configuration for Neovim to
point to the `jdtls` binary that was installed and to the configurations that
were installed as well.
```lua
local workspace_folder = -- ...

local config = {
  cmd = {
    '/usr/bin/jdtls',
    '-configuration', '/usr/share/java/jdtls/config_linux',
    '-data', workspace_folder,
  },
  -- ...
}
```

In order for the Neovim LSP Client to run the command successfully, the user
you're logged in as needs permissions to the config directory used for the
`-configuration` flag in the `cmd`. Use `chown` to alter that directory's
permissions.

