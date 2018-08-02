_mediasvr_monosoftware_upgrader_completions()
{
  COMPREPLY=($(compgen -W "jackett radarr sonarr -a" "${COMP_WORDS[1]}"))
}

complete -F _mediasvr_monosoftware_upgrader_completions mediasvr_monosoftware_upgrader.sh
