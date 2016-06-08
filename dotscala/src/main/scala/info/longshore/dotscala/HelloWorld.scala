package info.longshore.dotscala

object HelloWorld {
  def main(args: Array[String]): Unit = {
    println("hello world")

    args.foreach(println)
  }
}

