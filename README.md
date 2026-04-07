# Captain Provider App (Flutter MVVM)

A sample provider-side ride hailing app inspired by captain workflows (online/offline, incoming ride requests, accept/decline, and earnings tracking).

## Architecture (MVVM)

- **Model**: `RideRequest`
- **ViewModel**: `HomeViewModel` (business/UI state)
- **View**: `HomeScreen`, `EarningsCard`, `RideRequestCard`
- **Repository**: `RideRepository`
- **Service**: `FakeRideService`

## Run

```bash
flutter pub get
flutter run
```

## Flutter setup + imports (for your question)

If you are asking **“how to download for flutter import”**, usually that means:
1) install Flutter SDK,  
2) open this project,  
3) download dependencies so `import` lines resolve.

### 1) Install Flutter SDK

Follow the official install guide for your OS:
- https://docs.flutter.dev/get-started/install

After install, verify:

```bash
flutter --version
dart --version
```

### 2) Open the project

```bash
git clone <your-repo-url>
cd providerapp
```

### 3) Download packages (this fixes unresolved imports)

```bash
flutter pub get
```

This reads `pubspec.yaml` and downloads dependencies like `provider`.

### 4) If imports still show errors in VS Code / Android Studio

- Run:
  ```bash
  flutter clean
  flutter pub get
  ```
- Restart IDE.
- In VS Code: `Ctrl+Shift+P` → **Dart: Restart Analysis Server**.
- Ensure project imports use package-style paths, for example:
  ```dart
  import 'package:captain_provider_app/viewmodels/home_view_model.dart';
  ```

### 5) Add a new package for future imports

```bash
flutter pub add http
```

Then import in Dart file:

```dart
import 'package:http/http.dart' as http;
```
