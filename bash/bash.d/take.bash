# create a directory and cd into it
function take {
  mkdir -vp "$@"
  cd "$@"
}
