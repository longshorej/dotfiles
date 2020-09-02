name := "dotscala"

maintainer := "Jason Longshore <longshorej@gmail.com>"

version := "1.0"

organization := "info.longshore"

enablePlugins(JavaAppPackaging)

scalaVersion := "2.12.1"

libraryDependencies ++= Vector(
  "com.google.code.gson"  % "gson"        % "2.6.2",
  "com.github.scopt"     %% "scopt"       % "3.5.0",
  "org.specs2"           %% "specs2-core" % "3.8.6" % "test"
)

scalacOptions ++= Vector(
  "-deprecation",
  "-encoding", "UTF-8",
  "-feature",
  "-language:existentials",
  "-language:higherKinds",
  "-language:implicitConversions",
  "-unchecked",
  "-Xfatal-warnings",
  "-Xlint",
  "-Yno-adapted-args",
  "-Yrangepos",
  "-Ywarn-dead-code",
  "-Ywarn-numeric-widen",
  "-Ywarn-value-discard",
  "-Xfuture",
  "-Ywarn-unused-import",
  "-Ywarn-unused"
)

scalacOptions in Test ++= Seq("-Yrangepos")

mainClass in Compile := Some("info.longshore.dotscala.Main")
