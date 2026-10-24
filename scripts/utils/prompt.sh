#!/usr/bin/env sh

prompt_required() {
  label="$1"
  value=""

  while [ -z "$value" ]; do
    printf "%s\n> " "$label" >&2
    IFS= read -r value
  done

  printf "%s" "$value"
}
