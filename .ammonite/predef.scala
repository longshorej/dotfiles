load.ivy("com.lihaoyi" %% "ammonite-shell" % ammonite.Constants.version)
load.ivy("org.scalaz" %% "scalaz-core" % "7.2.0")
@
val shellSession = ammonite.shell.ShellSession()
import shellSession._
import ammonite.shell.PPrints._
import ammonite.ops._
import ammonite.shell._
ammonite.shell.Configure(repl, wd)
