# Captain Provider App (Flutter MVVM)

A polished provider-side ride hailing app inspired by captain workflows (online/offline, incoming ride requests, accept/decline, active ride completion, earnings tracking, surge multiplier, and auto-accept).

## What's improved

- Liquid-glass style UI (gradient background + reusable `GlassCard` blur component).
- Branded in-app logo header (`Captain Pro`).
- New driver features:
  - Active ride panel with **Complete Ride** flow.
  - Acceptance-rate and completed-trip stat tiles.
  - Surge multiplier slider impacting earnings.
  - Auto-accept mode for incoming requests.

## Architecture (MVVM)

- **Model**: `RideRequest`
- **ViewModel**: `HomeViewModel`
- **View**: `HomeScreen` + reusable widgets
- **Repository**: `RideRepository`
- **Service**: `FakeRideService`

## Run

```bash
flutter pub get
flutter run
```

## Packaging zip

```bash
scripts/package_zip.sh
```

Output archive default:

```bash
/workspace/providerapp_full.zip
```
