#!/bin/sh
bash tools/clean.sh
flutter build apk -t lib/config/env_app/qa_main.dart
rm -rf tools/apks
mkdir -p tools/apks/QaExport
cp build/app/outputs/flutter-apk/app-release.apk tools/apks/QaExport
mv tools/apks/QaExport/app-release.apk tools/apks/QaExport/app-release-qa.apk

zip -r tools/apks.zip tools/apks/

mv tools/apks.zip tools/apks/

