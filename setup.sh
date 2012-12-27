#! /bin/bash

dir="$(cd "$(dirname "$0")" && pwd)"
parent_dir="$(dirname "$dir")"

ln -s "$dir/.vim" "$parent_dir/.vim"
ln -s "$dir/.vimrc" "$parent_dir/.vimrc"
