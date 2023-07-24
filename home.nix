{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "trilla";
  home.homeDirectory = "/home/trilla";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/trilla/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    ls = "ls -a --color=auto";
    ll = "ls -l";
  };

  programs.dircolors = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      ".7z" = "01;91";
      ".aac" = "00;96";
      ".ace" = "01;91";
      ".alz" = "01;91";
      ".arc" = "01;91";
      ".arj" = "01;91";
      ".asf" = "01;95";
      ".au" = "00;96";
      ".avi" = "01;95";
      ".bmp" = "01;95";
      ".bz2" = "01;91";
      ".bz" = "01;91";
      ".cab" = "01;91";
      ".cgm" = "01;95";
      ".cpio" = "01;91";
      ".deb" = "01;91";
      ".dl" = "01;95";
      ".dwm" = "01;91";
      ".dz" = "01;91";
      ".ear" = "01;91";
      ".emf" = "01;95";
      ".esd" = "01;91";
      ".flac" = "00;96";
      ".flc" = "01;95";
      ".fli" = "01;95";
      ".flv" = "01;95";
      ".gif" = "01;95";
      ".gl" = "01;95";
      ".gz" = "01;91";
      ".jar" = "01;91";
      ".jpeg" = "01;95";
      ".jpg" = "01;95";
      ".lha" = "01;91";
      ".lrz" = "01;91";
      ".lz" = "01;91";
      ".lz4" = "01;91";
      ".lzh" = "01;91";
      ".lzma" = "01;91";
      ".lzo" = "01;91";
      ".m2v" = "01;95";
      ".m4a" = "00;96";
      ".m4v" = "01;95";
      ".mid" = "00;96";
      ".midi" = "00;96";
      ".mjpeg" = "01;95";
      ".mjpg" = "01;95";
      ".mka" = "00;96";
      ".mkv" = "01;95";
      ".mng" = "01;95";
      ".mov" = "01;95";
      ".mp3" = "00;96";
      ".mp4" = "01;95";
      ".mp4v" = "01;95";
      ".mpc" = "00;96";
      ".mpeg" = "01;95";
      ".mpg" = "01;95";
      ".nuv" = "01;95";
      ".oga" = "00;96";
      ".ogg" = "00;96";
      ".ogm" = "01;95";
      ".ogv" = "01;95";
      ".ogx" = "01;95";
      ".opus" = "00;96";
      ".pbm" = "01;95";
      ".pcx" = "01;95";
      ".pgm" = "01;95";
      ".png" = "01;95";
      ".ppm" = "01;95";
      ".qt" = "01;95";
      ".ra" = "00;96";
      ".rar" = "01;91";
      ".rm" = "01;95";
      ".rmvb" = "01;95";
      ".rpm" = "01;91";
      ".rz" = "01;91";
      ".sar" = "01;91";
      ".spx" = "00;96";
      ".svg" = "01;95";
      ".svgz" = "01;95";
      ".swm" = "01;91";
      ".t7z" = "01;91";
      ".tar" = "01;91";
      ".taz" = "01;91";
      ".tbz" = "01;91";
      ".tbz2" = "01;91";
      ".tga" = "01;95";
      ".tgz" = "01;91";
      ".tif" = "01;95";
      ".tiff" = "01;95";
      ".tlz" = "01;91";
      ".txz" = "01;91";
      ".tz" = "01;91";
      ".tzo" = "01;91";
      ".tzst" = "01;91";
      ".vob" = "01;95";
      ".war" = "01;91";
      ".wav" = "00;96";
      ".webm" = "01;95";
      ".wim" = "01;91";
      ".wmv" = "01;95";
      ".xbm" = "01;95";
      ".xcf" = "01;95";
      ".xpm" = "01;95";
      ".xspf" = "00;96";
      ".xwd" = "01;95";
      ".xz" = "01;91";
      ".yuv" = "01;95";
      ".z" = "01;91";
      ".zip" = "01;91";
      ".zoo" = "01;91";
      ".zst" = "01;91";
      BLK = "40;93;01";
      CAP = "30;41";
      CHR = "40;93;01";
      DIR = "01;94";
      DOR = "01;95";
      EXEC = "01;92";
      LNK = "01;96";
      MHL = "00";
      MISSING = "00";
      ORPHAN = "40;91;01";
      OTHER_WRITABLE = "34;42";
      PIPE = "40;93";
      RESET = "0";
      SETGID = "30;43";
      STICKY = "01;95";
      STICKY_OTHER_WRITABLE = "37;44";
      SETUID = "37;41";
      TW = "30;42";
    };
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = [
       pkgs.vimPlugins.molokai
       pkgs.vimPlugins.nerdtree
       pkgs.vimPlugins.nerdcommenter
       pkgs.vimPlugins.vim-nerdtree-tabs
       pkgs.vimPlugins.vim-airline
       pkgs.vimPlugins.vim-airline-themes
       pkgs.vimPlugins.vim-easy-align
       pkgs.vimPlugins.fzf-vim
       #pkgs.vimPlugins.ctrlsf-vim
       #pkgs.vimPlugins.vim-fswitch
       pkgs.vimPlugins.vim-indent-object
       pkgs.vimPlugins.vim-multiple-cursors
       pkgs.vimPlugins.python-mode
       pkgs.vimPlugins.supertab
       pkgs.vimPlugins.tagbar
       #pkgs.vimPlugins.cocoa.vim
       pkgs.vimPlugins.YouCompleteMe
       pkgs.vimPlugins.vim-qml
       pkgs.vimPlugins.vim-fugitive
       pkgs.vimPlugins.vim-move
       pkgs.vimPlugins.auto-pairs
       pkgs.vimPlugins.wildfire-vim
       pkgs.vimPlugins.indentLine
       pkgs.vimPlugins.ale
       pkgs.vimPlugins.vim-toml
       pkgs.vimPlugins.vim-nix
    ];
    extraConfig = ''
      set autoindent
      set smartindent
      set smarttab
      set expandtab

      set shiftwidth=2
      set ts=2
      set softtabstop=2
      set textwidth=80

      au BufRead,BufNewFile *.py set tabstop=4 softtabstop=4 shiftwidth=4
      au BufRead,BufNewFile *.html set tabstop=4 softtabstop=4 shiftwidth=4 
      au BufRead,BufNewFile *.qml set tabstop=4 softtabstop=4 shiftwidth=4

      set nocompatible
      set number
      syn on

      set noeb
      set t_Co=256
      set encoding=utf-8

      filetype plugin indent on

      set shortmess+=tToOI

      set guifont=Liberation\ Mono\ 12
      set guicursor+=n-v-c:blinkon0
      set guioptions+=e
      set guioptions-=r
      set guioptions-=R
      set guioptions-=b
      set guioptions-=l
      set guioptions-=L
      set guioptions-=T
      set guioptions-=m

      set ignorecase
      set smartcase
      set incsearch
      set hls
      map <F1> :nohl<CR>
      imap <F1> <ESC>:nohl<CR>

      let g:molokai_original = 1
      let g:rehash256 = 1
      colorscheme molokai

      au InsertLeave * if pumvisible() == 0|silent! pclose|endif
      set completeopt=menuone,menu,longest

      set clipboard=unnamedplus
      set iminsert=0

      "set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

      highlight ExtraWhitespace ctermbg=red guibg=red
      match ExtraWhitespace /\s\+$/
      autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
      autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
      autocmd InsertLeave * match ExtraWhitespace /\s\+$/
      autocmd BufWinLeave * call clearmatches()

      "function! s:insert_gates()
      "  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
      "  execute "normal! i#ifndef " . gatename
      "  execute "normal! o#define " . gatename . " "
      "  execute "normal! Go#endif /* " . gatename . " */"
      "  normal! kk
      "endfunction
      "autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

      imap <S-Tab> <Esc> :tabNext <CR>
      map <S-Tab> :tabNext <CR>
      imap <C-Tab> <Esc> :tabnext <CR>
      map <C-Tab> :tabnext <CR>
      map <C-S-PAGEUP> :tabmove -1 <CR>
      map <C-S-PAGEDOWN> :tabmove +1 <CR>

      map <F2> :wa<CR>
      imap <F2> <ESC>:wa<CR>

      vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


      map <F12> :TagbarToggle<CR>

      let g:ycm_clangd_uses_ycmd_caching = 0
      let g:ycm_clangd_binary_path = exepath("clangd")
      let g:ycm_goto_buffer_command = 'split'
      let g:ycm_show_diagnostics_ui = 0
      let g:ycm_enable_diagnostic_signs = 0
      let g:ycm_enable_diagnostic_highlighting = 0
      let g:ycm_max_num_candidates = 50
      let g:ycm_auto_trigger = 0

      set laststatus=2
      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#show_splits = 0
      let g:airline#extensions#tabline#show_buffers = 0
      let g:airline#extensions#ale#enabled = 1
      let g:airline_theme='kolor'

      let Tlist_Auto_Open=0
      let Tlist_Use_Right_Window=1

      map <F11> :NERDTreeTabsToggle<CR>
      let NERDTreeIgnore = ['\.pyc$']
      let g:NERDTreeDirArrows=0

      let g:NERDSpaceDelims = 1
      let g:NERDAltDelims_c=1
      let g:NERDTrimTrailingWhitespace = 1
      let g:NERDCustomDelimiters = { 'pro': { 'left': '#' } }

      let g:SuperTabDefaultCompletionType = "context"
      let g:SuperTabContextDefaultCompletionType = "<c-n>"

      let g:UltiSnipsExpandTrigger = "<c-tab>"
      let g:UltiSnipsListSnippets = '<c-CR>'
      let g:UltiSnipsJumpForwardTrigger = "<c-tab>"
      let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

      let g:cpp_class_scope_highlight = 1

      let g:alternateRelativeFiles = 1
      let g:alternativeAlwaysCreateBuffer = 1

      map <SPACE> <Plug>(wildfire-fuel)
      vmap <C-SPACE> <Plug>(wildfire-water)

      let g:indentLine_char_list = ['|', '¦', '┆', '┊']

      xmap ga <Plug>(EasyAlign)
      nmap ga <Plug>(EasyAlign)

      let g:move_key_modifier = 'C'

      let g:AutoPairsShortcutFastWrap = '<C-e>'

      let g:pymode_rope = 0
      let g:pymode_python = 'python3'
      let g:pymode_doc = 0
      let g:pymode_doc_key = 'K'
      let g:pymode_lint = 1
      let g:pymode_lint_checkers = []
      let g:pymode_lint_cwindow = 1
      let g:pymode_lint_ignore="E501,W601,C0110,C0111"
      let g:pymode_lint_write = 0
      let g:pymode_virtualenv = 1
      let g:pymode_breakpoint = 1
      let g:pymode_breakpoint_key = '<leader>b'
      let g:pymode_syntax = 1
      let g:pymode_syntax_all = 1
      let g:pymode_syntax_indent_errors = g:pymode_syntax_all
      let g:pymode_syntax_space_errors = g:pymode_syntax_all
      let g:pymode_folding = 0
      let g:pymode_run = 0
      let g:pymode_options_colorcolumn = 0

      let g:ale_lint_on_insert_leave = 0

      let g:ctrlp_key_loop=1
      let g:ctrlp_max_files=2000000

      let g:ctrlsf_search_mode = 'async'
      let g:ctrlsf_default_view_mode = 'compact'

      nmap     <C-F>f <Plug>CtrlSFPrompt
      vmap     <C-F>f <Plug>CtrlSFVwordPath
      vmap     <C-F>F <Plug>CtrlSFVwordExec
      nmap     <C-F>n <Plug>CtrlSFCwordPath
      nmap     <C-F>p <Plug>CtrlSFPwordPath
      nnoremap <C-F>o :CtrlSFOpen<CR>
      nnoremap <C-F>t :CtrlSFToggle<CR>
      inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

      nnoremap <silent> <C-p> :GFiles<CR>
      nnoremap <silent> <C-f> :Files<CR>

      let b:fswitchlocs = '../src,../source'
    '';
  };
}
