#!/bin/sh
# flutter_webrtc eagerly creates WebRTC's AudioDeviceModule as soon as its plugin registers;
# with no reachable sink that aborts the whole process with a fatal ADM init error (e.g. headless
# AppImage screenshot/test pipelines that have no PulseAudio/ALSA device). Fall back to a dummy
# sink in that case so the app can still start.
HERE="$(dirname "$(readlink -f "$0")")"
if command -v pactl >/dev/null 2>&1 && [ -z "$(pactl list short sinks 2>/dev/null)" ]; then
  pulseaudio --start --exit-idle-time=-1 --disallow-exit >/dev/null 2>&1
  pactl load-module module-null-sink sink_name=DummyOutput >/dev/null 2>&1
fi
exec "$HERE/fingrom" "$@"
