# mymoim

LOG of Development of MyMoim

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Compile Error Handling
### Missing file libarclite_iphoneos.a (Xcode 14.3)
- Go to System Preferences → Security & Privacy → Full Disk Access → Terminal, and do:
>```sudo mkdir arc```
> 
>```cd  arc```
> 
>```sudo git clone https://github.com/kamyarelyasi/Libarclite-Files.git```
> 
> ```sudo chmod +x *```

## Packages

### ```Riverpod``` for state management
### ```Freezed``` for code generation

## Localizations
- ```localization``` package with ```flutter_localizations``` for localization
- ```lib/i18n``` for localization files
- use ```'code_word'.i18n()``` to get localized string
- use ```'code_word'.i18n(['parameter_word'])``` to get localized string with parameter

## Phone Authentication
* (error)[firebase_auth/unknown] Please register custom URL scheme 'app-1-511933512074-ios-6f032a62854840a1a03073' in the app's Info.plist file.
* in XCode, Info.plist, add URL Types

