#!/bin/bash
# Forge requires a configured set of both JVM and program arguments.
# Add custom JVM arguments to the user_jvm_args.txt
# Add custom program arguments {such as nogui} to this file in the next line before the "$@" or
#  pass them to this script directly
filepath="$1"
shift
jvm_args="$(sed -E '/^[[:blank:]]*(#|$)/d; s/#.*//' user_jvm_args.txt)"

java $jvm_args -jar $filepath "$@"