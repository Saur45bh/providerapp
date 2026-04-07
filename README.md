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
  - Quick actions row and trip-id visibility in ride cards.

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

## How to update in Flutter

If you mean **updating Flutter + project dependencies**, use:

```bash
# 1) Upgrade Flutter SDK
flutter upgrade

# 2) Check outdated packages in this app
flutter pub outdated

# 3) Upgrade packages to latest allowed by pubspec constraints
flutter pub upgrade

# 4) (Optional) Upgrade to latest major versions and update pubspec
flutter pub upgrade --major-versions

# 5) Rebuild generated lock file/deps cleanly
flutter clean
flutter pub get
```

If you mean **updating app code UI instantly during development**:

```bash
flutter run
```

- Press `r` in terminal for **Hot Reload**.
- Press `R` in terminal for **Hot Restart**.

If imports or packages still look stale in IDE:
- Restart IDE analysis server (VS Code: *Dart: Restart Analysis Server*).
- Run `flutter pub get` again.

## How to update code in IDE

If you want your IDE project to reflect latest code changes:

```bash
# 1) Get latest code
git pull

# 2) Refresh dependencies
flutter pub get
```

Then in your IDE:

### VS Code
- Save files (`Ctrl+S`).
- Open Command Palette (`Ctrl+Shift+P`) and run:
  - `Dart: Restart Analysis Server`
  - `Developer: Reload Window` (if needed)

### Android Studio
- Click **File → Sync Project with Gradle Files**.
- Click **File → Invalidate Caches / Restart** (only if IDE is stale).

### While app is running
- Press `r` in terminal for Hot Reload.
- Press `R` in terminal for Hot Restart.

## Packaging zip

```bash
scripts/package_zip.sh
```

Output archive default:

```bash
/workspace/providerapp_full.zip
```
