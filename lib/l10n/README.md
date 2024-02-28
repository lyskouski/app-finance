# Localization

- `l10n.yaml` -- base registry (for auto-detection)
  - `macos/Runner/Info.plist`
  - `ios/Runner/Info.plist`
- `lib/l10n/app_*.arb` -- labels
- `lib/l10n/index.dart` -- registry, and mapping with design type
- `assets/l10n` -- descriptions


## Managing Labels

Export into CSV:
```console
# All labels
dart run grinder export-translations
# Specific languages
dart run grinder export-translations --filter="en|be"
# Single language
dart run grinder export-translations --filter=en
```

To import changes back into the project from CSV:
```console
dart run grinder import-translations --file=localization_{hash-code}.csv
```

**NOTE:** Do not change the filename. It'll be used to prepare a diff between your changes and the state, when you've 
exported them, since some of them might be changed already by other members.
