#!/usr/bin/env sh

link_path() {
  src="$1"
  dest="$2"

  if [ ! -e "$src" ]; then
    echo "Skip: source does not exist: $src"
    return 0
  fi

  rm -rf "$dest"

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"

  echo "Linked: $dest -> $src"
}

link_config() {
  name="$1"

  link_path \
    "$DOTFILES_DIR/home/.config/$name" \
    "$HOME/.config/$name"
}
