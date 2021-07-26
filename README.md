# Scala Runners

Replaces the Scala distribution's runners: `scala`, `scalac`, `scaladoc`, and `scalap`.

These runners add highly convenient options, most notably:

* easily run any Scala version (e.g. `scalac -212`)
* easily add dependencies (e.g. `scala -Ccom.lihaoyi::fastparse:2.2.2`)

See `scala-runner -help` for the usage text (using `scala -help` will give you Scala's help usage text).

The runners are implemented as thin shell scripts around Coursier's `cs launch`.

## Install/Upgrade

### Homebrew

Install with `brew install --HEAD dwijnand/formulas/scala-runners`.

Upgrade with `brew upgrade --fetch-HEAD dwijnand/formulas/scala-runners`.

***Fix after master->main branch rename:***

```bash
brew update
brew uninstall scala-runners
rm -fr ~/Library/Caches/Homebrew/scala-runners--git/
brew install --HEAD scala-runners
```

### Fallback

You may also use this oneliner to get the scala-runners in your current directory:

```bash
curl -sSLO https://github.com/dwijnand/scala-runners/archive/refs/heads/main.zip && unzip main.zip scala-runners-main/scala* && mv scala-runners-main/scala* . && rm -r scala-runners-main main.zip
```

Then you can run them as `./scala ...` or move them into your `PATH`.

## Example Usages

### Open a Scala REPL

```bash
$ scala
Welcome to Scala 2.13.0 (OpenJDK GraalVM CE 19.0.0, Java 1.8.0_212).
Type in expressions for evaluation. Or try :help.

scala>
```

### Run any basic Scala command-line tool

```bash
$ scala -version
Scala code runner version 2.13.2 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.

$ scalac -version
Scala compiler version 2.13.2 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.

$ scaladoc -version
Scaladoc version 2.13.2 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.

$ scalap -version
Scala classfile decoder version 2.0.1 -- (c) 2002-2020 LAMP/EPFL
```

If no version is specified, the latest stable release is retrieved, cached, and used.

### Specify the Scala version, using short-hand or the full version string

```bash
$ scalac -212 -version
Scala compiler version 2.12.11 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.

$ scalac -210 -version
Scala compiler version 2.10.7 -- Copyright 2002-2017, LAMP/EPFL

$ scalac --scala-version 2.10.4 -version
Scala compiler version 2.10.4 -- Copyright 2002-2013, LAMP/EPFL

$ scalac -2.12.2 -version
Scala compiler version 2.12.2 -- Copyright 2002-2017, LAMP/EPFL and Lightbend, Inc.
```

### Add a dependency in the REPL

```bash
$ scala -Ccom.lihaoyi::fastparse:2.2.2
Welcome to Scala 2.13.2 (Java HotSpot(TM) 64-Bit GraalVM EE 19.2.1, Java 1.8.0_231).
Type in expressions for evaluation. Or try :help.

scala> import fastparse._, NoWhitespace._
import fastparse._
import NoWhitespace._
```

For Scala-based dependencies, using `::` appends the Scala binary version automatically. Use `:` for Java-based dependencies.

### Pass runner specific options

```bash
$ scalac --scala-version 2.10.4 -X
Usage: scalac <options> <source files>

[...]
  -Xprint:<phases>               Print out program after <phases>
  -Xprint-icode[:phases]         Log internal icode to *.icode files after <phases> (default: icode)
  -Xprint-pos                    Print tree positions, as offsets.
  -Xprint-types                  Print tree types (debugging option).
[...]

$ scalac --scala-version 2.10.4 -Y
Usage: scalac <options> <source files>

[...]
  -Yshow:<phases>                     (Requires -Xshow-class or -Xshow-object) Show after <phases>
  -Yshow-symkinds                     Print abbreviated symbol kinds next to symbol names.
  -Yshow-syms                         Print the AST symbol hierarchy after each phase.
  -Yshow-trees                        (Requires -Xprint:) Print detailed ASTs in formatted form.
  -Yshow-trees-compact                (Requires -Xprint:) Print detailed ASTs in compact form.
  -Yshow-trees-stringified            (Requires -Xprint:) Print stringifications along with detailed ASTs.
[...]
```

### Test a Scala nightly

For the most recent nightly which has been validated by the [Scala community build](https://github.com/scala/community-build):

```bash
$ scala -2.13.next
Welcome to Scala 2.13.3-bin-560e1c9 (OpenJDK 64-Bit Server VM, Java 1.8.0_252).
[...]
```

Or for the most recent nightly (the HEAD of the 2.13.x branch):

```bash
$ scala -2.13.head
Welcome to Scala 2.13.3-bin-2145995 (OpenJDK 64-Bit Server VM, Java 1.8.0_252).
```

### Test a Scala pull request

```bash
$ scala --scala-pr 8960
Welcome to Scala 2.13.3-20200505-220514-82445f1 (OpenJDK 64-Bit Server VM, Java 1.8.0_252).
Type in expressions for evaluation. Or try :help.
[...]
```

In this example, 8960 is the number of a pull request in the [scala/scala repo](https://github.com/scala/scala/pulls) and  `82445f1` is the SHA of the last commit in the PR.

### Getting the resolved Scala version

```bash
$ scala --print-scala-version
2.13.3
$ scala -212 --print-scala-version
2.12.12
$ scala -2.12.head --print-scala-version
2.12.13-bin-c30130b
$ scala --scala-pr 8936 --print-scala-version
2.12.12-bin-2424146-SNAPSHOT
```
