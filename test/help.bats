#!/usr/bin/env bats

load test_helper

@test "shows usage" {

  result="$(cat <<EOM
Usage: \$script_name [options]

Where, "script_name" is scala, scalac, scaladoc, or scalap.

All options not specified below are passed through.

  -h | -help         print this message (only when script_name is scala-runner)
  -v                 verbose operation (this runner is chattier)

  # scala version (default: latest.stable, resolved by Couriser)
  -28                        use the latest 2.8.x release
  -29                        use the latest 2.9.x release
  -210                       use the latest 2.10.x release
  -211                       use the latest 2.11.x release
  -212                       use the latest 2.12.x release
  -213                       use the latest 2.13.x release
  -2.12.next                 use the next candidate 2.12.x release (from the community build)
  -2.13.next                 use the next candidate 2.13.x release
  -2.12.head                 use the latest build from the HEAD of the 2.12.x branch (latest "merge-ly")
  -2.13.head                 use the latest build from the HEAD of the 2.13.x branch
  -3                         use the latest 3.x release
  -3.head                    use the latest 3.x nightly release
  -<version>                 use the specified scala version, e.g. -2.13.6 or -3.0.1
  --scala-version <version>  use the specified scala version, e.g. --scala-version 3.1-my-test
  --scala-pr <PR number>     use the version of scala built from the specified PR

  # passing options to the jvm
  -Dkey=val         pass -Dkey=val directly to the jvm
  -J-X              pass option -X directly to the jvm

  # passing options to coursier
  -C-X              pass option -X directly to coursier (-C is stripped)

  --print-scala-version      prints the resolved scala version
EOM
)"

  run scala-runner -h
  [ "$status" -eq 0 ]
  [ "$output" = "$result" ]
}
