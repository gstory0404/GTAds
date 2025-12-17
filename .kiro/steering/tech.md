# Technology Stack

## Framework

- Flutter (cross-platform mobile framework)
- Dart SDK: >=2.12.0 <4.0.0
- Flutter: >=1.20.0

## Project Type

Monorepo containing multiple Flutter plugin packages:
- Core library: `gtads`
- Provider plugins: `gtads_csj`, `gtads_ylh`, `gtads_sigmob`, `gtads_bqt`, `gtads_ks`

## Platform Support

- Android (Kotlin)
- iOS (Objective-C/Swift)
- HarmonyOS (OHOS) - partial support

## Key Dependencies

Core package (`gtads`):
- `plugin_platform_interface: ^2.0.2`

Provider packages depend on their respective ad SDK wrappers:
- `gtads_csj` → `flutter_unionad` (ByteDance)
- `gtads_ylh` → `flutter_tencentad` (Tencent)
- `gtads_ks` → `ksad` (Kuaishou)

## Common Commands

```bash
# Get dependencies for a package
cd gtads && flutter pub get

# Run example app
cd gtads/example && flutter run

# Analyze code
flutter analyze

# Run tests
flutter test
```

## Version Compatibility

Base library version and provider plugin versions should match in the first two digits (e.g., gtads 1.5.x with gtads_csj 1.5.x).
