# Development LOG

## markdown preview
- ```ctrl + shift + v```
- Update the runtime to the one with JCEF in the following steps could solve this issue:
- Select Help > Find Action from the Android Studio menu.
- Enter "```Choose Boot Java Runtime for the IDE```" and select it from the suggestion list.
- Select the runtime that comes with JCEF support as shown in the image below:
- Click OK and restart the IDE.

## Code generation
- ```flutter pub run build_runner build --delete-conflicting-outputs```
- ```flutter pub run build_runner clean```
- ```dart run build_runner build --delete-conflicting-outputs```

### Localized app display name
- [ow to Change Display Name](https://www.fluttercampus.com/guide/149/how-to-change-display-name-ios-android-flutter-app/#:~:text=Change%20App%20Name%20of%20iOS%20App%20on%20Flutter%3A,your%20app%20for%20both%20Android%20and%20iOS%20platforms.)
- for android: ```android/app/src/main/AndroidManifest.xml```,
- ```value```, and ```value-ko```
- for iOS: ```ios/Runner/Info.plist```
- Update CFBundleDisplayName within ios\Runner\Info.plist file.
----
>```<key>CFBundleDisplayName</key>```
>
>```<string>${PRODUCT_NAME}</string>```
----

>- create a new directory within the Runner directory called Resources.
>- Within the Resources directory, create a new file called InfoPlist.strings. This file will contain the translations of your app name.
>- For each locale you want to support, create a new directory within the Resources directory with the name of the language (e.g., en.lproj for English).
>- Within each language directory, create a new file called InfoPlist.strings and add the following code:
>- "CFBundleDisplayName" = "Your translated app name";
>- Run the app and see how app name changes when device language changes.


## Launcher icons
- ```flutter_launcher_icons``` package
- ```flutter pub run flutter_launcher_icons -f <your config file name here>```
- ```flutter pub run flutter_launcher_icons```
- 