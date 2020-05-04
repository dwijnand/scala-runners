# Scala Runners

An alternative implementation of the Scala distribution's runners: `scala`, `scalac`, `scaladoc`, and `scalap`
(no `fsc`).  They are implemented as thin shell scripts around Coursier's `coursier launch` to add some Scala
runners-specific (power) options.

Install with `brew install --HEAD dwijnand/formulas/scala-runners`.

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
Scala code runner version 2.13.0 -- Copyright 2002-2019, LAMP/EPFL and Lightbend, Inc.

$ scalac -version
Scala compiler version 2.13.0 -- Copyright 2002-2019, LAMP/EPFL and Lightbend, Inc.

$ scaladoc -version
Scaladoc version 2.13.0 -- Copyright 2002-2019, LAMP/EPFL and Lightbend, Inc.

$ scalap -version
Scala classfile decoder version 2.0.1 -- (c) 2002-2019 LAMP/EPFL
```

### Specify the Scala version, using short-hand or the full version string

```bash
$ scalac -212 -version
Scala compiler version 2.12.8 -- Copyright 2002-2018, LAMP/EPFL and Lightbend, Inc.

$ scalac -210 -version
Scala compiler version 2.10.7 -- Copyright 2002-2017, LAMP/EPFL

$ scalac --scala-version 2.10.4 -version
Scala compiler version 2.10.4 -- Copyright 2002-2013, LAMP/EPFL
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
