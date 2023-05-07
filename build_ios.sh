#!/bin/bash
flutter clean
rm -Rf ios/Pods
rm -Rf ios/.symlinks
rm -Rf ios/Flutter/Flutter.framework
rm -Rf ios/Flutter/Flutter.podspec
flutter pub get
flutter packages get
flutter packages pub run build_runner build --delete-conflicting-outputs
cd ios/
arch -x86_64 pod install
cd ../
flutter packages pub run flutter_launcher_icons:main
flutter pub pub run flutter_native_splash:create
flutter build ios --release