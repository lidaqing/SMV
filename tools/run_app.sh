#!/bin/bash
#
# Run one or more SMV modules / stages / app.
# USAGE: run_app.sh [-h] spark_args smv_app_args
#
# user can specify spark args (such as --master, --class or --jar to override the fat jar selection)
# the rest of the arguments are the standard SmvApp arguments.

set -e
if [ "$1" = "-h" ]; then
  echo "USAGE: `basename $0` [-h] [spark_args] <smv_app_args>"
  echo "spark_args:"
  echo "    [--master master]"
  echo "    [--class class]"
  echo "    [--jar fat_jar]"
  echo "smv_app_args:"
  echo "    [--purge-old-output]"
  echo "    [--data-dir dir] ..."
  echo "    <-m mod1 [mod2 ...] | -s stage1 [stage2 ...] | --run-app> ..."
  exit 0
fi

SMV_TOOLS="$(cd "`dirname "$0"`"; pwd)"
source $SMV_TOOLS/_env.sh

echo "START RUN =============================="

date
# TODO: use executer-mem config instead!
export SPARK_MEM=6G
export SPARK_PRINT_LAUNCH_COMMAND=1
spark-submit --master ${MASTER} --class ${SMV_APP_CLASS} "$APP_JAR" ${ARGS[@]}
date

