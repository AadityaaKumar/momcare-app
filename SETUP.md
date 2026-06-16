# MomCare - Complete Setup Guide

## 🚀 Quick Start

This guide will help you get the MomCare Flutter app up and running in minutes.

## Prerequisites

### Required
- **Flutter SDK**: 3.0.0 or higher
- **Dart**: 3.0.0 or higher
- **Git**: For cloning the repository

### Platform-Specific Requirements

#### Android
- Android Studio 2022.1 or higher
- Android SDK 21 (API level 21) or higher
- NDK version 21.1.6352462 or higher

#### iOS
- Xcode 13 or higher
- iOS 12.0 or higher
- CocoaPods

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/AadityaaKumar/momcare-app.git
cd momcare-app
```

### 2. Install Flutter Dependencies

```bash
flutter pub get
```

### 3. Get Flutter

If you haven't installed Flutter yet:

```bash
# Download Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Run doctor to check installation
flutter doctor
```

### 4. Verify Installation

```bash
flutter doctor
```

Ensure all required components show checkmarks (✓).

## Running the App

### On Android Emulator

```bash
# Start Android emulator from Android Studio or
flutter emulators --launch <emulator_id>

# Run the app
flutter run
```

### On Android Device

```bash
# Enable USB debugging on your device
# Connect device via USB

# Verify device connection
flutter devices

# Run the app
flutter run
```

### On iOS Simulator

```bash
# Start iOS simulator
open -a Simulator

# Run the app
flutter run
```

### On iOS Device

```bash
# Connect device via USB
# Trust the computer on the device

# Verify device connection
flutter devices

# Run the app
flutter run
```

### On Web (Optional)

```bash
flutter run -d chrome
```

## Building for Release

### Android APK

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle

```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS

```bash
flutter build ios --release
# Output: build/ios/iphoneos/Runner.app
```

## Project Structure

```
momcare-app/
├── lib/
│   ├── main.dart              # App entry point
│   ├── config/                # Configuration files
│   │   └── theme/             # Theme and colors
│   ├── models/                # Data models
│   ├── services/              # Services (DB, notifications)
│   └── presentation/
│       └── screens/           # All UI screens
├── assets/                    # Images, fonts, icons
├── android/                   # Android native code
├── ios/                       # iOS native code
├── pubspec.yaml              # Dependencies
└── README.md                 # Documentation
```

## Dependencies

Key packages used in MomCare:

- **flutter_riverpod**: State management
- **sqflite**: Local database
- **fl_chart**: Charts and graphs
- **google_fonts**: Custom fonts
- **image_picker**: Photo selection
- **flutter_local_notifications**: Notifications
- **speech_to_text**: Voice input

## Configuration

### Android Configuration

File: `android/app/build.gradle`

```gradle
android {
    compileSdkVersion 34
    
    defaultConfig {
        applicationId "com.momcare.app"
        minSdkVersion 21
        targetSdkVersion 34
    }
}
```

### iOS Configuration

File: `ios/Podfile`

```ruby
platform :ios, '12.0'

target 'Runner' do
  flutter_root = File.expand_path(File.join(packages_path, '.symlinks', 'flutter'))
  load File.join(flutter_root, 'packages', 'flutter_tools', 'bin', 'podhelper')
  
  flutter_ios_podfile_setup
end
```

## Permissions

### Android Permissions

File: `android/app/src/main/AndroidManifest.xml`

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.CAMERA" />
```

### iOS Permissions

File: `ios/Runner/Info.plist`

```xml
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to your microphone for voice input.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs access to your photos.</string>
<key>NSCameraUsageDescription</key>
<string>This app needs camera access for photos.</string>
```

## Troubleshooting

### Common Issues

#### 1. "flutter: command not found"

```bash
# Add Flutter to your PATH
export PATH="$PATH:[path-to-flutter]/bin"
```

#### 2. Dependency resolution errors

```bash
flutter pub get
flutter pub upgrade
```

#### 3. Android build errors

```bash
flutter clean
cd android && ./gradlew clean && cd ..
flutter pub get
flutter run
```

#### 4. iOS build errors

```bash
flutter clean
cd ios && pod deintegrate && cd ..
flutter pub get
flutter run
```

#### 5. Database issues

```bash
# Clear app data and reinstall
flutter clean
flutter pub get
flutter run
```

## Development Tips

### Hot Reload

```bash
# Press 'r' in the terminal while the app is running
# For hot restart, press 'R'
```

### Debug Mode

```bash
flutter run -v  # Verbose output
```

### Device Logs

```bash
# Android
adb logcat

# iOS
log stream --predicate 'process == "Runner"'
```

## Database Migrations

The app uses SQLite with automatic schema creation. On first run, all tables are created automatically.

To reset the database:

1. Uninstall the app
2. Run `flutter clean`
3. Reinstall the app

## Code Quality

### Linting

```bash
flutter analyze
```

### Formatting

```bash
flutter format lib/
```

## Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## Deployment

### Google Play Store

1. Create a signed APK/AAB
2. Upload to Google Play Console
3. Fill in app details and screenshots
4. Submit for review

### Apple App Store

1. Create app in App Store Connect
2. Build and archive the app
3. Upload using Xcode or Transporter
4. Submit for review

## Performance Optimization

### Build Optimizations

```bash
# Split APKs by ABI for smaller downloads
flutter build apk --split-per-abi

# Enable shrinking for release
flutter build appbundle --release
```

## Security

- All local data is stored securely in SQLite
- Implement PIN protection in settings
- Use biometric authentication
- Encrypt sensitive data

## Support & Documentation

- **Flutter Docs**: https://flutter.dev/docs
- **Dart Docs**: https://dart.dev/guides
- **GitHub Issues**: Report bugs on GitHub

## Contributing

To contribute to MomCare:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Push to your fork
5. Create a pull request

## License

MIT License - See LICENSE file for details

## Support

For questions or issues, please open an issue on GitHub:
https://github.com/AadityaaKumar/momcare-app/issues

---

**Made with ❤️ by Aadityaa**
