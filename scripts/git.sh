#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"
GIT_USER_FILE="$DOTFILES_DIR/home/.config/git/user"
GIT_BRIDGE_FILE="$HOME/.gitconfig"

. "$DOTFILES_DIR/scripts/utils/prompt.sh"

cat >"$GIT_BRIDGE_FILE" <<'EOF'
[include]
  path = ~/.config/git/config
EOF

echo "Created: $GIT_BRIDGE_FILE"

if [ -f "$GIT_USER_FILE" ]; then
  echo "Git user config already exists"
  exit 0
fi

echo "==> Local Git setup"
echo

git_name="$(prompt_required "Git user name")"
git_email="$(prompt_required "Git user email")"

mkdir -p "$(dirname "$GIT_USER_FILE")"

cat >"$GIT_USER_FILE" <<EOF
[user]
  name = $git_name
  email = $git_email
EOF

echo
echo "Created: $GIT_USER_FILE"
