""" Setup
set nocompatible
syntax on
filetype plugin indent on
let mapleader=","

""" Load partial configs
runtime! conf.d/*.vim
runtime! localconf.d/*.vim
