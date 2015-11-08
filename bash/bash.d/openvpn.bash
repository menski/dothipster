function vpn {

  STATUS=$(systemctl list-units | grep openvpn@)

  CMD=${1:-status}

  case "$CMD" in
      off)
          if [ -z "$STATUS" ]; then
              echo "No vpn active"
          else
              PROFILE="${STATUS%.*}"
              echo "Stopping $PROFILE profile"
              sudo systemctl stop $PROFILE
          fi
          ;;
      status)
          if [ -z "$STATUS" ]; then
              echo "Status: off"
          else
              echo "Status: $STATUS"
          fi
          ;;
      help)
          echo "Usage: $0 [help|status|on|off|PROFILE]"
          ;;
      on | *)
          PROFILE="$CMD"
          if [ "$PROFILE" = "on" ]; then
              PROFILE="de"
          fi

          if [ ! -f "/etc/openvpn/$PROFILE.conf" ]; then
            echo "Unknown vpn profile"
            return 1
          fi

          if [ -n "$STATUS" ]; then
              PROFILE_OLD="${STATUS%.*}"
              echo "Stopping $PROFILE_OLD profile"
              sudo systemctl stop $PROFILE_OLD
          fi
          echo "Try to start profile openvpn@$PROFILE"
          sudo systemctl start openvpn@$PROFILE
          ;;
  esac
}

function _vpn {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local vpns="$(/bin/ls /etc/openvpn | grep '.conf' | cut -d. -f1) on off status"
  COMPREPLY=($(compgen -W "$vpns" -- $cur))
  return 0
}

complete -F _vpn vpn
