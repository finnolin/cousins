#!/bin/bash
# Use provided directory or default to current
pack_dir="${1:-.}"

# Check if mods folder exists
if [ ! -d "$pack_dir/mods" ]; then
  echo "Error: No mods folder found in $pack_dir"
  exit 1
fi

output="./MODLIST.md"
echo "# Modlist" > "$output"
echo "" >> "$output"
echo "| Icon | Mod | Link |" >> "$output"
echo "|:----:|-----|------|" >> "$output"

for f in "$pack_dir"/mods/*.pw.toml; do
  name=$(grep '^name' "$f" | cut -d'"' -f2)
  icon=""
  
  if grep -q '\[update\.modrinth\]' "$f"; then
    mod_id=$(grep 'mod-id' "$f" | cut -d'"' -f2)
    
    # Fetch icon from Modrinth API
    icon_url=$(curl -s "https://api.modrinth.com/v2/project/$mod_id" | grep -o '"icon_url":"[^"]*"' | cut -d'"' -f4)
    
    if [ -n "$icon_url" ] && [ "$icon_url" != "null" ]; then
      icon="<img src=\"$icon_url\" width=\"32\">"
    fi
    
    echo "| $icon | $name | [Modrinth](https://modrinth.com/mod/$mod_id) |" >> "$output"
  elif grep -q '\[update\.curseforge\]' "$f"; then
    project_id=$(grep 'project-id' "$f" | awk '{print $3}')
    echo "| | $name | [CurseForge](https://www.curseforge.com/projects/$project_id) |" >> "$output"
  else
    echo "| | $name | - |" >> "$output"
  fi
done

echo "Generated $output with $(grep -c '^\|' "$output") mods"