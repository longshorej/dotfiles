package info.longshore.dotscala

object HelloWorld {
  def main(args: Array[String]): Unit = lines(args).foreach(println)

  def lines(args: Array[String]): Vector[String] = "hello world!" +: args.toVector
}

