#!/bin/sh
# Validate METADATA_CATEGORY declarations against metadata/categories.yml.
# POSIX sh + awk only: no python/yq/task required.
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
catfile="$root/metadata/categories.yml"

if [ ! -f "$catfile" ]; then
  echo "metadata/categories.yml: not found" >&2
  exit 1
fi

files=$(find "$root" -name '*.yml' \
  -not -path '*/.git/*' \
  -not -path '*/.commandcode/*' \
  -not -path "$catfile" | sort)

# The file list is space-free in this repo; word splitting is intentional.
# shellcheck disable=SC2086
awk -v catfile="$catfile" '
function trim(s) {
  sub(/^[ \t]+/, "", s)
  sub(/[ \t]+$/, "", s)
  return s
}

function flush_task() {
  if (task != "" && !has_meta) {
    printf "%s:%d: task %s: missing METADATA_CATEGORY\n", taskfile, taskline, task > "/dev/stderr"
    errors++
  }
  task = ""
  has_meta = 0
}

FNR == 1 {
  if (task != "") flush_task()
  in_tasks = 0
  next
}

FILENAME == catfile {
  if ($0 ~ /^  - name:/) {
    if (name != "" && !hasdesc) {
      printf "%s:%d: category %s: missing description\n", catfile, nameline, name > "/dev/stderr"
      errors++
    }
    name = trim(substr($0, index($0, ":") + 1))
    nameline = FNR
    hasdesc = 0
    if (name !~ /^[a-z0-9][a-z0-9-]*$/) {
      printf "%s:%d: category %s: name must be lowercase kebab-case\n", catfile, nameline, name > "/dev/stderr"
      errors++
    } else if (name in seen) {
      printf "%s:%d: category %s: duplicate name\n", catfile, nameline, name > "/dev/stderr"
      errors++
    } else {
      seen[name] = 1
      order[++norder] = name
    }
  } else if ($0 ~ /^    description:/) {
    d = trim(substr($0, index($0, ":") + 1))
    if (d != "") hasdesc = 1
  }
  next
}

$0 ~ /^tasks:[ \t]*$/ { in_tasks = 1; next }
$0 ~ /^[A-Za-z_][A-Za-z0-9_-]*:/ { if (task != "") flush_task(); in_tasks = 0; next }

in_tasks && /^  [A-Za-z0-9_.-]+:[ \t]*$/ {
  flush_task()
  task = $0
  sub(/^  /, "", task)
  sub(/:[ \t]*$/, "", task)
  taskline = FNR
  taskfile = FILENAME
  next
}

in_tasks && /METADATA_CATEGORY:/ {
  if ($0 !~ /^      METADATA_CATEGORY:/) {
    printf "%s:%d: METADATA_CATEGORY must be at 6 spaces, nested under a 4-space vars key\n", FILENAME, FNR > "/dev/stderr"
    errors++
    next
  }
  if (task == "") {
    printf "%s:%d: METADATA_CATEGORY outside a task\n", FILENAME, FNR > "/dev/stderr"
    errors++
    next
  }
  if (has_meta) {
    printf "%s:%d: task %s: duplicate METADATA_CATEGORY\n", FILENAME, FNR, task > "/dev/stderr"
    errors++
    next
  }
  has_meta = 1
  v = trim(substr($0, index($0, ":") + 1))
  if (v !~ /^\[.*\]$/) {
    printf "%s:%d: task %s: METADATA_CATEGORY must be an inline list like [cli, agent]\n", FILENAME, FNR, task > "/dev/stderr"
    errors++
    next
  }
  sub(/^\[/, "", v)
  sub(/\]$/, "", v)
  if (trim(v) == "") {
    printf "%s:%d: task %s: METADATA_CATEGORY must contain at least one category\n", FILENAME, FNR, task > "/dev/stderr"
    errors++
    next
  }
  n = split(v, parts, ",")
  for (i = 1; i <= n; i++) {
    c = trim(parts[i])
    key = taskfile SUBSEP task SUBSEP c
    if (c == "") {
      printf "%s:%d: task %s: empty category entry\n", FILENAME, FNR, task > "/dev/stderr"
      errors++
    } else if (!(c in seen)) {
      printf "%s:%d: task %s: unknown category %s (add it to metadata/categories.yml)\n", FILENAME, FNR, task, c > "/dev/stderr"
      errors++
    } else if (key in used_in_task) {
      printf "%s:%d: task %s: duplicate category %s\n", FILENAME, FNR, task, c > "/dev/stderr"
      errors++
    } else {
      used_in_task[key] = 1
      used[c] = 1
    }
  }
  next
}

END {
  if (name != "" && !hasdesc) {
    printf "%s:%d: category %s: missing description\n", catfile, nameline, name > "/dev/stderr"
    errors++
  }
  if (task != "") flush_task()
  for (i = 1; i <= norder; i++) {
    if (!(order[i] in used)) {
      printf "warning: category %s is not used by any task\n", order[i] > "/dev/stderr"
    }
  }
  if (errors > 0) exit 1
}
' "$catfile" $files
