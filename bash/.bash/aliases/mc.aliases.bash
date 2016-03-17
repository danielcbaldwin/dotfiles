pt() {
  rvm 1.9.3 do papertrail "$@" | perl -pe 's/^(.{15})(.)([\S]+)(.)([\S]+)/\e[0;36m\1\e[0;33m\2\3\e[0;35m\4\5\e[39m/g'
}
