# ~/.config/zsh/functions.zsh

lsjunk() {
  local target="${1:-.}"

  if [[ "$target" == "/" ]]; then
    echo "Refusing to run on /"
    return 1
  fi

  find "$target" \
    \( \
      -name ".DS_Store" -o \
      -name "._*" -o \
      -name "Thumbs.db" -o \
      -name "ehthumbs.db" -o \
      -name "Desktop.ini" -o \
      -name "__MACOSX" \
    \) \
    -print
}

rmjunk() {
  local target="${1:-.}"

  if [[ "$target" == "/" ]]; then
    echo "Refusing to run on /"
    return 1
  fi

  find "$target" \
    \( \
      -name ".DS_Store" -o \
      -name "._*" -o \
      -name "Thumbs.db" -o \
      -name "ehthumbs.db" -o \
      -name "Desktop.ini" \
    \) \
    -type f \
    -exec rm -f {} +

  find "$target" \
    -name "__MACOSX" \
    -type d \
    -exec rm -rf {} +

  echo "Removed junk files from: $target"
}
