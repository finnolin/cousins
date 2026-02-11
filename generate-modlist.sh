#!/bin/bash

# Use provided directory or default to current
pack_dir="${1:-.}"

# Check if mods folder exists
if [ ! -d "$pack_dir/mods" ]; then
  echo "Error: No mods folder found in $pack_dir"
  exit 1
fi

output="$pack_dir/MODLIST.md"

echo "# Modlist" > "$output"
echo "" >> "$output"
echo "| Mod | Link |" >> "$output"
echo "|-----|------|" >> "$output"

for f in "$pack_dir"/mods/*.pw.toml; do
  name=$(grep '^name' "$f" | cut -d'"' -f2)
  
  if grep -q '\[update\.modrinth\]' "$f"; then
    mod_id=$(grep 'mod-id' "$f" | cut -d'"' -f2)
    echo "| $name | [Modrinth](https://modrinth.com/mod/$mod_id) |" >> "$output"
  elif grep -q '\[update\.curseforge\]' "$f"; then
    project_id=$(grep 'project-id' "$f" | awk '{print $3}')
    echo "| $name | [CurseForge](https://www.curseforge.com/projects/$project_id) |" >> "$output"
  else
    echo "| $name | - |" >> "$output"
  fi
done

echo "Generated $output with $(grep -c '^\|' "$output") mods"