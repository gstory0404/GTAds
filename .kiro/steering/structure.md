# Project Structure

## Monorepo Layout

```
/
├── gtads/                    # Core library (required)
├── gtads_csj/                # ByteDance Pangolin provider
├── gtads_ylh/                # Tencent GDT provider
├── gtads_sigmob/             # Sigmob provider
├── gtads_bqt/                # Baidu provider
├── gtads_ks/                 # Kuaishou provider
├── README.md                 # Main documentation (Chinese)
├── expand.md                 # Custom provider guide
└── error.md                  # FAQ/troubleshooting
```

## Package Structure (each plugin)

```
gtads_xxx/
├── lib/
│   ├── gtads_xxx.dart           # Main export, uses `part` directives
│   └── gtads_xxx_provider.dart  # Provider implementation (part of main)
├── android/
│   └── src/main/kotlin/         # Android native code (Kotlin)
├── ios/
│   └── Classes/                 # iOS native code (ObjC/Swift)
├── example/                     # Example Flutter app
│   └── lib/
│       ├── main.dart
│       ├── splash_page.dart
│       ├── banner_page.dart
│       └── native_page.dart
├── pubspec.yaml
└── test/
```

## Core Library Structure (gtads/lib/)

```
gtads/lib/
├── gtads.dart              # Main entry, exports all parts
├── gtads_provider.dart     # Abstract GTAdsProvider base class
├── gtads_manager.dart      # Singleton manager for providers
├── gtads_callback.dart     # Callback typedefs and GTAdsCallBack class
├── gtads_code.dart         # GTAdsCode model (ad placement config)
├── gtads_constant.dart     # Constants (GTAdsModel modes)
├── gtads_util.dart         # Utility functions
└── widget/
    ├── gtads_banner_widget.dart
    ├── gtads_native_widget.dart
    ├── gtads_splash_widget.dart
    ├── gtads_insert.dart       # Interstitial ad logic
    └── gtads_reward.dart       # Rewarded ad logic
```

## Key Patterns

- Uses Dart `part`/`part of` for file organization within each package
- Provider pattern: all ad networks implement `GTAdsProvider` abstract class
- Widget-based ads (banner, native, splash) vs method-based ads (interstitial, reward)
- Singleton `GTAdsManager` holds registered providers
- `GTAdsCode` links ad placements to providers via `alias` field
