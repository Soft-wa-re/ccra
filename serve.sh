#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler is required. Install it with: gem install bundler" >&2
  exit 1
fi

if ! bundle check >/dev/null 2>&1; then
  echo "Installing missing Ruby dependencies..."
  bundle install
fi

url="http://127.0.0.1:4000"
bundle exec jekyll serve --livereload --host 127.0.0.1 "$@" &
jekyll_pid=$!

cleanup() {
  if kill -0 "$jekyll_pid" 2>/dev/null; then
    echo "Stopping Jekyll..."
    kill "$jekyll_pid"
    wait "$jekyll_pid" 2>/dev/null || true
  fi
}

trap cleanup EXIT INT TERM

for ((attempt = 0; attempt < 150; attempt++)); do
  if ! kill -0 "$jekyll_pid" 2>/dev/null; then
    wait "$jekyll_pid" || status=$?
    exit "${status:-1}"
  fi

  if curl --silent --fail --output /dev/null "$url"; then
    echo "Site ready at $url"

    if [[ "${NO_BROWSER:-0}" != "1" ]]; then
      if command -v open >/dev/null 2>&1; then
        open "$url"
      elif command -v xdg-open >/dev/null 2>&1; then
        xdg-open "$url"
      fi
    fi

    wait "$jekyll_pid"
    exit $?
  fi

  sleep 0.2
done

echo "Jekyll did not become ready at $url within 30 seconds." >&2
exit 1
