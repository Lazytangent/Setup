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

cargo install --git https://github.com/latex-lsp/texlab.git --locked
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
