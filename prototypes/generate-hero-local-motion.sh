#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
input="$repo_root/assets/truly-hero-context-map.png"
output="$repo_root/assets/truly-hero-context-map-local-motion.mp4"

# Keep the base image still. The only motion is a subtle pulse on the green
# confirmation signal in the right-side summary panel.
filter_complex="
[0:v]scale=1280:852,format=rgba[base];
nullsrc=s=1280x852:d=8,format=rgba,
  geq=r='34':g='197':b='94':a='(52+78*sin(T*2.4)*sin(T*2.4))*exp(-(((X-1166)*(X-1166))+((Y-492)*(Y-492)))/1450)'[green_halo];
nullsrc=s=1280x852:d=8,format=rgba,
  geq=r='187':g='247':b='208':a='(24+50*sin(T*2.4)*sin(T*2.4))*exp(-(((X-1166)*(X-1166))+((Y-492)*(Y-492)))/230)'[green_core];
[base][green_halo]overlay=format=auto[s1];
[s1][green_core]overlay=format=auto,format=yuv420p
"

ffmpeg -y \
  -loop 1 \
  -t 8 \
  -i "$input" \
  -filter_complex "$filter_complex" \
  -an \
  -c:v libx264 \
  -preset slow \
  -crf 20 \
  -movflags +faststart \
  "$output"

ls -lh "$output"
