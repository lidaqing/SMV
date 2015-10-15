name := "smv"

organization := "org.tresamigos"

version := "1.5-SNAPSHOT"

scalaVersion := "2.10.4"

scalacOptions ++= Seq("-deprecation", "-feature")

val sparkVersion = "1.5.1"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-sql"  % sparkVersion % "provided",
  "org.scalatest" %% "scalatest" % "2.2.0" % "test",
  "com.google.guava" % "guava" % "14.0.1",
  "org.rogach" %% "scallop" % "0.9.5",
  "org.joda" % "joda-convert" % "1.7",
  "joda-time" % "joda-time" % "2.7",
  "com.rockymadden.stringmetric" %% "stringmetric-core" % "0.27.2",
  "com.github.mdr" %% "ascii-graphs" % "0.0.6"
)

parallelExecution in Test := false
