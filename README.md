# Login con Rive

## Android: el emulador ya está abierto

Copia y pega este bloque en Terminal:

```sh
cd /Users/diegoramirezmagana/Desktop/mobilee/login_river_animation
flutter pub get
flutter run -d emulator-5554
```

## Android: el emulador está cerrado

Copia y pega este bloque en Terminal. El emulador de esta Mac se llama `Flutter_Pixel_API_36`:

```sh
cd /Users/diegoramirezmagana/Desktop/mobilee/login_river_animation
flutter pub get
flutter emulators --launch Flutter_Pixel_API_36
/Users/diegoramirezmagana/Library/Android/sdk/platform-tools/adb wait-for-device
flutter run -d emulator-5554
```

Si `flutter run` indica que el dispositivo aún está iniciando, espera a que aparezca la pantalla de Android y vuelve a ejecutar `flutter run -d emulator-5554`.

## Ejecutar en Chrome

```sh
cd /Users/diegoramirezmagana/Desktop/mobilee/login_river_animation
flutter pub get
flutter run -d chrome
```

Para detener `flutter run`, pulsa `q` en la Terminal.
