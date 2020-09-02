package info.longshore.dotscala

import org.specs2._

object HelloWorldSpec extends mutable.Specification {
  "empty" >> (HelloWorld.lines(Array()) mustEqual Vector("hello world!"))
  "one arg" >> (HelloWorld.lines(Array("hi there")) mustEqual Vector("hello world!", "hi there"))
  "two args" >> (HelloWorld.lines(Array("hi there", "wut")) mustEqual Vector("hello world!", "hi there", "wut"))
}
