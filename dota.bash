# Convert MacOS keyboard to work for Dota 2, enable Fn keys + swap cmd/opt keys.

if [[ "${BASH_SOURCE[0]:-}" == "$0" ]]; then
  set -euo pipefail
fi

fn_state() {
  if [[ "${1}" -eq 1 ]]; then
    defaults write -g com.apple.keyboard.fnState -bool true
    printf "Function keys have been enabled\n"
  else
    printf "Media keys have been enabled\n"
    defaults write -g com.apple.keyboard.fnState -bool false
  fi
}

# refresh_caches() {
  # killall SystemUIServer >/dev/null 2>&1 || true
  # killall cfprefsd >/dev/null 2>&1 || true
# }

swap_cmd_opt_keys() {
  if [[ "$1" -eq 1 ]]; then
    hidutil property --set '{
      "UserKeyMapping": [
        {
          "HIDKeyboardModifierMappingSrc": 0x7000000E2,
          "HIDKeyboardModifierMappingDst": 0x7000000E3
        },
        {
          "HIDKeyboardModifierMappingSrc": 0x7000000E3,
          "HIDKeyboardModifierMappingDst": 0x7000000E2
        }
      ]
    }' >/dev/null 2>&1
    printf "CMD and OPT keys have been swapped\n"
  else
    hidutil property --set '{"UserKeyMapping":[]}' >/dev/null 2>&1
    printf "CMD and OPT keys have been reset\n"
  fi
}

main() {
  local enable=1

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -r|--reset) enable=0; shift ;;
      -h|--help) usage; exit 0 ;;
      *)
        printf "Unknown argument: %s\n" "$1" >&2
        usage >&2
        exit 2
        ;;
    esac
  done

  fn_state "$enable"
  swap_cmd_opt_keys "$enable"
  # refresh_caches
}



SCRIPT_PATH="${BASH_SOURCE[0]:-}"

dota() {
  command bash "$SCRIPT_PATH"
}

undota() {
  command bash "$SCRIPT_PATH" --reset
}



if [[ "${BASH_SOURCE[0]:-}" == "$0" ]]; then
  main "$@"
fi