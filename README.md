# Gif Search using Flutter

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Build](https://github.com/jaredsburrows/flutter-gif-search/actions/workflows/build.yml/badge.svg)](https://github.com/jaredsburrows/flutter-gif-search/actions/workflows/build.yml)
[![Twitter Follow](https://img.shields.io/twitter/follow/jaredsburrows.svg?style=social)](https://twitter.com/jaredsburrows)

Gif List Grid Example using [Flutter](https://flutter.dev/)!

<a href="https://i.imgur.com/zErC6JV.png" target="_blank"><img src="https://i.imgur.com/zErC6JV.png" width="250px" /></a>

### Updates

**Flutter**

```shell
rm -f ios/Podfile.lock
rm -f pubspec.lock
flutter upgrade
flutter pub get
flutter pub upgrade
```

**Build All**

```shell
flutter build apk --debug
flutter build ios --debug --no-codesign
flutter build web
```

## Build the App

**Android**

```shell
flutter build apk
```

**iOS**

```shell
flutter build ios
```

## Install the App

```shell
flutter install
```

## Run the App

```shell
flutter run
```

## Testing

```shell
flutter test
```

## Local Debug Run

```shell
rm -f pubspec.lock && \
flutter clean && \
flutter upgrade && \
flutter pub get && \
flutter pub upgrade --major-versions && \

dart run build_runner build --delete-conflicting-outputs && \

osv-scanner -r . && \

dart format . && \
dart fix --dry-run && \
dart fix --apply && \

flutter analyze && \

flutter test --platform=chrome --test-randomize-ordering-seed=random && \

flutter build web && \
flutter build ios --debug --no-codesign && \
flutter build apk --debug
```

## License

```
Copyright (C) 2019 Jared Burrows

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
