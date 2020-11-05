TESTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH=$PATH:$TESTDIR

setup () {
  ln -fs "$TESTDIR/../scala-runner" "$TESTDIR/scala-runner"
}

teardown() {
  unlink "$TESTDIR/scala-runner"
}
