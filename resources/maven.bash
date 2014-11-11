##
# Maven
##

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

function m() {
  /opt/local/bin/mvn "$@" \
  | ack --flush --passthru --color --color-match=red     "^.*\[ERROR\].*$" \
  | ack --flush --passthru --color --color-match=magenta "^.*\[WARNING\].*$" \
  | ack --flush --passthru --color --color-match=cyan    "^.*\[INFO\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[DEBUG\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[TRACE\].*$"
}

function mci() {
  /opt/local/bin/mvn clean install -DskipTests "$@" \
  | ack --flush --passthru --color --color-match=red     "^.*\[ERROR\].*$" \
  | ack --flush --passthru --color --color-match=magenta "^.*\[WARNING\].*$" \
  | ack --flush --passthru --color --color-match=cyan    "^.*\[INFO\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[DEBUG\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[TRACE\].*$"
}

function m() {
  /opt/local/bin/mvn "$@" \
  | ack --flush --passthru --color --color-match=red     "^.*\[ERROR\].*$" \
  | ack --flush --passthru --color --color-match=magenta "^.*\[WARNING\].*$" \
  | ack --flush --passthru --color --color-match=cyan    "^.*\[INFO\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[DEBUG\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[TRACE\].*$"
}

function mci() {
  /opt/local/bin/mvn clean install -DskipTests "$@" \
  | ack --flush --passthru --color --color-match=red     "^.*\[ERROR\].*$" \
  | ack --flush --passthru --color --color-match=magenta "^.*\[WARNING\].*$" \
  | ack --flush --passthru --color --color-match=cyan    "^.*\[INFO\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[DEBUG\].*$" \
  | ack --flush --passthru --color --color-match=white   "^.*\[TRACE\].*$"
}

