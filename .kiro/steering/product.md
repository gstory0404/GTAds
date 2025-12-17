# GTAds - Flutter Aggregated Advertising Plugin

GTAds is a Flutter plugin for aggregated ad management across Android, iOS, and HarmonyOS platforms. It provides a unified ad scheduling and management solution without bundling any specific ad SDK.

## Core Concept

- Abstraction layer over multiple ad networks using the Provider pattern
- Pluggable ad providers - each ad network is a separate package
- No ad SDK included directly - providers wrap underlying ad SDKs

## Supported Ad Types

| Type | Implementation | Chinese Name |
|------|----------------|--------------|
| Splash | Widget-based | 开屏广告 |
| Banner | Widget-based | 横幅广告 |
| Native/Feed | Widget-based | 信息流广告 |
| Interstitial | Method-based (StreamSubscription) | 插屏广告 |
| Rewarded Video | Method-based (StreamSubscription) | 激励广告 |

## Official Provider Plugins

| Plugin | Ad Network | Underlying SDK |
|--------|------------|----------------|
| gtads_csj | ByteDance Pangolin (穿山甲) | flutter_unionad |
| gtads_ylh | Tencent GDT (优量汇) | flutter_tencentad |
| gtads_sigmob | Sigmob | sigmobad |
| gtads_bqt | Baidu (百青藤) | baiduad |
| gtads_ks | Kuaishou (快手) | ksad |

## Ad Loading Modes

- `GTAdsModel.PRIORITY` - Higher probability value loads first
- `GTAdsModel.RANDOM` - Probability determines selection weight
