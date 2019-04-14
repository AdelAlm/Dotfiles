set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Non compatible avec Vi
set nocompatible

" Syntaxe et thème
syntax on
colorscheme torte
set t_Co=256

" Num ligne et colonne, et commande
set number
set ruler
set showcmd

" Auto-indentation à 2 espaces
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation en fonction du ficher
filetype plugin indent on

" Permet de donner paramatrés sur fichier pour vim
set modelines=5

" Meilleur completion cli
set wildmenu
set wildmode=longest,full

" Aide en cas d'erreurs
set visualbell

" Encodage
set encoding=utf-8

" Nombre de ligne entre curseur et bord
set scrolloff=5

" Pour indentation
set backspace=indent,eol,start

" Permet de switcher entre fichiers sans sauvegarder
set hidden

" Montre le mode
set showmode

" Toujours afficher barre d'etat
set laststatus=2

" Ignorer casse sauf quand majuscule
set ignorecase
set smartcase
set showmatch

" Utiliser presse papier + souris
set clipboard=unnamed
set mouse=a

" Recherche incrémentale
set hlsearch
set incsearch

