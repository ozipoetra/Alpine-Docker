#!/bin/sh -e
if [ -z "${SECRET_KEY}" ]; then
  echo "SECRET_KEY environment variable missing, using CLI argument";
  SECRET_KEY="$1"

  if [ -z "${SECRET_KEY}" ]; then
    echo "secret key (first argument) is missing";
    exit 1;
  fi
fi

playit -s --secret "${SECRET_KEY}" --platform_docker start
