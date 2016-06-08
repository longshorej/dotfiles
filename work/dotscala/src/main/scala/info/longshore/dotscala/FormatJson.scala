package info.longshore.dotscala

import com.google.gson.stream.JsonReader
import com.google.gson.stream.JsonToken
import com.google.gson.stream.JsonWriter
import java.io._
import java.math.BigDecimal

import JsonToken._

/** Reads stdin as a stream parses by token and outputs to stdout, pretty-printed. Uses GSON for streaming. */
object FormatJson {
  def main(args: Array[String]): Unit = {
    val in = System.in
    val out = System.out
    val writer = new JsonWriter(new BufferedWriter(new OutputStreamWriter(out)))
    val reader = new JsonReader(new BufferedReader(new InputStreamReader(in)))

    writer.setIndent("    ")
    reader.setLenient(true)
    prettyPrint(reader, writer)

    writer.close()
    reader.close()
  }

  def prettyPrint(reader: JsonReader, writer: JsonWriter): Unit = {
    var done = false

    while (!done) {
      val token = reader.peek()

      token match {
        case BEGIN_ARRAY => 
          reader.beginArray()
          writer.beginArray()

        case END_ARRAY => 
          reader.endArray()
          writer.endArray()

        case BEGIN_OBJECT => 
          reader.beginObject()
          writer.beginObject()

        case END_OBJECT => 
          reader.endObject()
          writer.endObject()

        case NAME => 
          writer.name(reader.nextName())

        case STRING => 
          writer.value(reader.nextString())

        case NUMBER => 
          writer.value(new BigDecimal(reader.nextString()))

        case BOOLEAN => 
          writer.value(reader.nextBoolean())

        case NULL => 
          reader.nextNull()
          writer.nullValue()

        case END_DOCUMENT =>
          done = true
      }

      writer.flush()
    }
  }
}

