_mediasvr_software_upgrader_completions()
{
  COMPREPLY=($(compgen -W "couchpotato nzbhydra sabnzbd sickbeard -a" "${COMP_WORDS[1]}"))
}

complete -F _mediasvr_software_upgrader_completions mediasvr_software_upgrader.sh
