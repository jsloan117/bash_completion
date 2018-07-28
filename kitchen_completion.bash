#!/bin/bash
# This is beter than the first, but not perfect.. when indoubt 'kitchen help' || https://kitchen.ci
# Original -- https://github.com/MarkBorcherding/test-kitchen-bash-completion

_kitchen_instance_list () {
  # cache to .kitchen.list.yml
  if [[ .kitchen.yml -nt .kitchen.list.yml || .kitchen.local.yml -nt .kitchen.list.yml ]]; then
    # update list if config has updated
    kitchen list --bare > .kitchen.list.yml
  fi
  cat .kitchen.list.yml
}

_kitchen_update_cmds () {
  kitchen help | awk '{print $2}' | sed '/^$/d'
}

_kitchen_options () {
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  COMPREPLY=()

  case $prev in
    converge|create|destroy|diagnose|doctor|exec|list|login|package|setup|test|verify)
      COMPREPLY=($(compgen -W "$(_kitchen_instance_list)" -- "${cur}"))
      return 0
      ;;
    help)
      COMPREPLY=($(compgen -W "$(_kitchen_update_cmds)" -- "${cur}"))
      return 0
      ;;
    exec)
      COMPREPLY=($(compgen -W "${_kitchen_instance_list}" -- "${cur}"))
      return 0
      ;;
    *-*) # args to cmds -- not smartly filtered, so know which go to what cmds. (Was made for the above exec, but this is the only way I could get '-c' in atm)
      COMPREPLY=($(compgen -W "-c -p -l -D -t -a -P --create-gemfile --no-create-gemfile -b -j -d" -- "${cur}"))
      return 0
      ;;
    *)
      COMPREPLY=($(compgen -W "$(_kitchen_update_cmds)" -- "${cur}"))
      return 0
      ;;
  esac
}
complete -F _kitchen_options kitchen
