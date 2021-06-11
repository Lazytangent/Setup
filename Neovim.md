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
npm i -g @angular/language-server bash-language-server \
    vscode-css-languageserver-bin dockerfile-language-server-nodejs \
    graphql-language-service-cli vscode-html-languageserver-bin \
    vscode-json-languageserver pyright typescript \
    typescript-language-server vim-language-server \
    sql-language-server yaml-language-server
```

#### Other installs

```sh
pip install -U jedi-language-server
```

```sh
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```

* Rust Language Server (Rust needs to be installed)

Download the binary from `https://github.com/rust-analyzer/rust-analyzer` and
place in PATH.
```sh
rustup component add rust-src
```

Or add it via `rustup`
```sh
rustup +nightly component add rust-analyzer-preview
```

#### Angular
#### Bash
#### Clang

#### CSS
#### Dockerfile
#### GraphQL
#### HTML
#### Jedi
#### JSON
#### Pyright
#### SQL
#### Tex
#### TSServer
#### Vim
#### YAML

## Nvim-Treesitter Troubleshooting

If you get an error about something, something, "wrong architecture".

* Try running `:TSUninstall all`, then reinstall all parsers with `:TSInstall
    all`
