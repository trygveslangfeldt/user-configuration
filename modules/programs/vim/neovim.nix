{ config, pkgs, ... }:

let
  # Custom plugins not in nixpkgs
  vim-cpp-modern = pkgs.vimUtils.buildVimPlugin {
    name = "vim-cpp-modern";
    src = pkgs.fetchFromGitHub {
      owner = "bfrg";
      repo = "vim-cpp-modern";
      rev = "850561ee5b2a600cd00efcf95d85162dba988765";
      sha256 = "sha256-g7w3zG9jQTg8xJDATyWcOIXvEqmjHxHX7uCBNVhHJXU=";

    };
  };

  # Lua configuration for LSP and modern features
  luaConfig = ''
    -- LSP Configuration
    local lspconfig = require('lspconfig')
    local cmp_capabilities = pcall(require, 'cmp_nvim_lsp') and require('cmp_nvim_lsp').default_capabilities() or {}

    -- Setup language servers
    local servers = {
      'clangd',
      'pyright',
      'rust_analyzer',
      'tsserver',
      'nil_ls', -- Nix LSP
      'html',
      'cssls',
      'jsonls'
    }

    for _, lsp in ipairs(servers) do
      local binary_name = lsp == 'nil_ls' and 'nil' or lsp
      if vim.fn.executable(binary_name) == 1 then
        lspconfig[lsp].setup {
          capabilities = cmp_capabilities,
          on_attach = function(client, bufnr)
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
          end,
        }
      end
    end

    -- nvim-cmp setup (if available)
    if pcall(require, 'cmp') then
      local cmp = require'cmp'
      local luasnip = require'luasnip'

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end

    -- Treesitter configuration (if available)
    if pcall(require, 'nvim-treesitter.configs') then
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
    end
  '';

in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      copilot-vim
      # Core editing
      nerdtree
      vim-commentary
      fzf-vim
      vim-easy-align
      auto-pairs
      wildfire-vim
      vim-multiple-cursors
      vim-move
      vim-projectionist

      # UI and themes
      vim-airline
      vim-airline-themes
      indentLine
      vim-code-dark
      molokai

      # Git integration
      vim-fugitive

      # Language support
      vim-nix
      vim-toml
      vim-qml


      # Tools
      tagbar

      # LSP and completion (modern replacements)
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip

      # Treesitter
      nvim-treesitter.withAllGrammars

    ];

    extraConfig = ''
      " Basic settings (from your original config)
      set autoindent
      set smartindent
      set smarttab
      set expandtab
      set shiftwidth=2
      set ts=2
      set softtabstop=2
      set textwidth=80
      set number
      set nocompatible
      syn on
      set noeb
      set t_Co=256
      set encoding=utf-8
      filetype plugin indent on
      set noswapfile
      set nobackup
      set shortmess+=tToOI
      set ignorecase
      set smartcase
      set incsearch
      set hls
      set clipboard=unnamedplus
      set iminsert=0
      set laststatus=2

      " Modern Neovim settings
      set termguicolors
      set signcolumn=yes
      set updatetime=300
      set timeoutlen=500
      set completeopt=menu,menuone,noselect
      set hidden
      set cmdheight=2
      set shortmess+=c

      " File type specific settings
      au BufRead,BufNewFile *.py set tabstop=4 softtabstop=4 shiftwidth=4
      au BufRead,BufNewFile *.html set tabstop=4 softtabstop=4 shiftwidth=4
      au BufRead,BufNewFile *.qml set tabstop=4 softtabstop=4 shiftwidth=4

      " Highlight trailing whitespace
      highlight ExtraWhitespace ctermbg=red guibg=red
      match ExtraWhitespace /\s\+$/
      autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
      autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
      autocmd InsertLeave * match ExtraWhitespace /\s\+$/
      autocmd BufWinLeave * call clearmatches()

      " Key mappings (preserved from your config)
      let mapleader = " "

      map <F1> :nohl<CR>
      imap <F1> <ESC>:nohl<CR>

      map <F2> :wa<CR>
      imap <F2> <ESC>:wa<CR>

      imap <S-Tab> <Esc>:tabNext<CR>
      map <S-Tab> :tabNext<CR>
      imap <C-Tab> <Esc>:tabnext<CR>
      map <C-Tab> :tabnext<CR>
      map <C-S-PAGEUP> :tabmove -1<CR>
      map <C-S-PAGEDOWN> :tabmove +1<CR>

      vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

      map <F12> :TagbarToggle<CR>
      map <F11> :NERDTreeToggle<CR>

      " FZF mappings
      nnoremap <silent> <C-p> :GFiles<CR>
      nnoremap <silent> <C-f> :Files<CR>
      nnoremap <c-w>b :b#<cr>

      " Plugin configurations
      let g:molokai_original = 1
      let g:rehash256 = 1
      colorscheme codedark

      au InsertLeave * if pumvisible() == 0|silent! pclose|endif
      set completeopt=menuone,menu,longest

      " Airline
      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#show_splits = 0
      let g:airline#extensions#tabline#show_buffers = 0
      let g:airline_theme='codedark'

      " NERDTree
      let NERDTreeIgnore = ['\.pyc$']
      let g:NERDTreeDirArrows=1
      let g:NERDSpaceDelims = 1
      let g:NERDAltDelims_c=1
      let g:NERDTrimTrailingWhitespace = 1
      let g:NERDCustomDelimiters = { 'pro': { 'left': '#' } }

      " Wildfire
      map <SPACE> <Plug>(wildfire-fuel)
      vmap <C-SPACE> <Plug>(wildfire-water)

      " IndentLine
      let g:indentLine_char_list = ['|', '¦', '┆', '┊']

      " EasyAlign
      xmap ga <Plug>(EasyAlign)
      nmap ga <Plug>(EasyAlign)

      " vim-move
      let g:move_key_modifier = 'C'

      " AutoPairs
      let g:AutoPairsShortcutFastWrap = '<C-e>'

      " Neovide specific settings
      let g:neovide_cursor_animation_length = 0
      let g:neovide_cursor_trail_size = 0


      " Switch header/source file
      nnoremap <leader>sh :ClangdSwitchSourceHeader<CR>
      " Smart toggle for NERDTree: finds the current file on open, closes otherwise.
      nnoremap <leader>k :if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1 \| NERDTreeClose \| else \| NERDTreeFind \| endif<CR>

      " Cland format
      nnoremap <leader>f :%!clang-format<CR>

      " Projectionist config
      let g:projectionist_heuristics = {
      \ "src/*.cpp": {
      \   "src/*.cpp": { "alternate": "include/{}.h", "type": "source" },
      \   "include/*.h": { "alternate": "src/{}.cpp", "type": "header" },
      \ },
      \ "*.cpp": {
      \   "*.cpp": { "alternate": "{}.h", "type": "source" },
      \   "*.h": { "alternate": "{}.cpp", "type": "header" },
      \ }
      \ }


      lua << EOF
      vim.o.guifont = "JetBrainsMono Nerd Font:h11"
          vim.o.guifont = "JetBrainsMono Nerd Font:h11"

      -- FONT RESIZING FUNCTION AND COMMAND
      -- Helper function to change the font size
      local function change_font_size(delta)
        local current_font = vim.o.guifont
        local name, size = string.match(current_font, "^(.-):h(%d+)$")
        if name and size then
          local new_size = tonumber(size) + delta
          if new_size > 0 then
            vim.o.guifont = name .. ":h" .. new_size
            vim.notify("Font size set to " .. new_size, vim.log.levels.INFO, { title = "Neovide" })
          end
        else
          vim.notify("Could not parse 'guifont'. Expected format: 'FontName:h<size>'", vim.log.levels.ERROR, { title = "Config Error" })
        end
      end

      -- Create the user command :FontSize
      vim.api.nvim_create_user_command(
        'FontSize',
        function(opts)
          local delta = tonumber(opts.args)
          if delta then
            change_font_size(delta)
          else
            vim.notify("Usage: :FontSize +1 or :FontSize -1", vim.log.levels.WARN, { title = "Input Error" })
          end
        end,
        { nargs = 1, desc = "Increase/decrease font size (e.g., :FontSize +1)" }
      )

      -- Add keymaps for convenience
      vim.keymap.set({ 'n', 'i' }, '<C-=>', function() change_font_size(1) end, { noremap = true, silent = true, desc = "Increase font size" })
      vim.keymap.set({ 'n', 'i' }, '<C-->', function() change_font_size(-1) end, { noremap = true, silent = true, desc = "Decrease font size" })

      -- Your existing Lua config starts here
      ${luaConfig}
      EOF
    '';
  };

  programs.zsh.shellAliases = {
    gvim = "${pkgs.neovide}/bin/neovide";
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      gvim = "${pkgs.neovide}/bin/neovide . &";
    };
  };

}
