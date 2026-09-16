#!/usr/bin/env bash
set -euo pipefail

GRADLE_VERSION="9.3.1"
GRADLE_USER_HOME="${GRADLE_USER_HOME:-$HOME/.gradle}"
DIST_DIR="$GRADLE_USER_HOME/fk-share-gradle/$GRADLE_VERSION"
GRADLE_HOME="$DIST_DIR/gradle-$GRADLE_VERSION"
GRADLE_BIN="$GRADLE_HOME/bin/gradle"
ZIP="$DIST_DIR/gradle-$GRADLE_VERSION-bin.zip"
URL="https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"

if [ ! -x "$GRADLE_BIN" ]; then
  mkdir -p "$DIST_DIR"
  if command -v gradle >/dev/null 2>&1; then
    exec gradle "$@"
  fi
  if ! command -v curl >/dev/null 2>&1; then
    echo "Gradle is not installed and curl is unavailable." >&2
    exit 1
  fi
  echo "Downloading Gradle $GRADLE_VERSION..."
  curl -fL --retry 3 --connect-timeout 15 -o "$ZIP" "$URL"
  rm -rf "$GRADLE_HOME"
  if command -v unzip >/dev/null 2>&1; then
    unzip -q "$ZIP" -d "$DIST_DIR"
  else
    echo "unzip is required only for the Gradle bootstrap download." >&2
    exit 1
  fi
fi

exec "$GRADLE_BIN" "$@"
