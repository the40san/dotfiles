set encoding=utf-8

set number

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set list
set listchars=tab:>-

set autoindent
set smartindent

set backspace=indent,eol,start

set ignorecase
set smartcase

set hlsearch

syntax on
set t_Co=256
colorscheme molokai
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
autocmd BufWritePre * :%s/\s\+$//e

set nocompatible               " be iMproved
filetype on

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
  " originalrepos on github
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'VimClojure'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'jpalardy/vim-slime'
  NeoBundle 'scrooloose/syntastic'
  ""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

  filetype plugin indent on     " required!
  filetype indent on

  NeoBundleLazy 'taichouchou2/vim-endwise.git', {
        \ 'autoload' : {
        \   'insert' : 1,
        \ } }

  NeoBundleLazy 'Shougo/neocomplcache-rsense', {
        \ 'depends': 'Shougo/neocomplcache',
        \ 'autoload': { 'filetypes': 'ruby' }}
  NeoBundleLazy 'taichouchou2/rsense-0.3', {
        \ 'build' : {
        \    'mac': 'ruby etc/config.rb > ~/.rsense',
        \    'unix': 'ruby etc/config.rb > ~/.rsense',
        \ } }

  NeoBundle 'tomtom/tcomment_vim'
  NeoBundleLazy 'tpope/vim-surround', {
        \ 'autoload' : {
        \   'mappings' : [
        \     ['nx', '<Plug>Dsurround'], ['nx', '<Plug>Csurround'],
        \     ['nx', '<Plug>Ysurround'], ['nx', '<Plug>YSurround'],
        \     ['nx', '<Plug>Yssurround'], ['nx', '<Plug>YSsurround'],
        \     ['nx', '<Plug>YSsurround'], ['vx', '<Plug>VgSurround'],
        \     ['vx', '<Plug>VSurround']
        \ ]}}

  NeoBundle 'tpope/vim-rails'
  NeoBundleLazy 'ujihisa/unite-rake', {
        \ 'depends' : 'Shougo/unite.vim' }
  NeoBundleLazy 'basyura/unite-rails', {
        \ 'depends' : 'Shjkougo/unite.vim' }
  NeoBundleLazy 'taichouchou2/unite-rails_best_practices', {
        \ 'depends' : 'Shougo/unite.vim',
        \ 'build' : {
        \    'mac': 'gem install rails_best_practices',
        \    'unix': 'gem install rails_best_practices',
        \   }
        \ }
  NeoBundleLazy 'taichouchou2/unite-reek', {
        \ 'build' : {
        \    'mac': 'gem install reek',
        \    'unix': 'gem install reek',
        \ },
        \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] },
        \ 'depends' : 'Shougo/unite.vim' }
  NeoBundleLazy 'taichouchou2/alpaca_complete', {
        \ 'depends' : 'tpope/vim-rails',
        \ 'build' : {
        \    'mac':  'gem install alpaca_complete',
        \    'unix': 'gem install alpaca_complete',
        \   }
        \ }

  let s:bundle_rails = 'unite-rails unite-rails_best_practices unite-rake alpaca_complete'

  function! s:bundleLoadDepends(bundle_names)
    execute 'NeoBundleSource '.a:bundle_names
      au! RailsLazyPlugins
    endfunction"}}}
    aug RailsLazyPlugins
        au User Rails call <SID>bundleLoadDepends(s:bundle_rails)
      aug END

  NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'taka84u9/vim-ref-ri', {
        \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
        \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'skwp/vim-rspec', {
        \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'ruby-matchit', {
      \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }

  
