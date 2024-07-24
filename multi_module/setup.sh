#!/bin/bash

# Find all pubspec.yaml files in the lib/modules directory
modules=$(find . -name "pubspec.yaml" -exec dirname {} \;)

# Loop through each module and run `flutter pub get`
for module in $modules
do
  echo "Running setup for $module"
  (cd "$module" && flutter clean && flutter pub get)
done

echo "flutter pub get completed for all modules"
