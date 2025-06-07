#!/bin/bash

OUTPUT="DP-1"

# Get the current transform value
CURRENT=$(swaymsg -t get_outputs | jq -r ".[] | select(.name==\"$OUTPUT\") | .transform")

# Determine next rotation
case "$CURRENT" in
  "normal") NEXT="90" ;;
  "90") NEXT="180" ;;
  "180") NEXT="270" ;;
  "270") NEXT="normal" ;;
  *) NEXT="normal" ;;
esac

# Apply the new transform
swaymsg output "$OUTPUT" transform "$NEXT"
