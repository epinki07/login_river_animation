# Login con Rive

Proyecto Flutter que muestra la pantalla de login del commit [`822bd85`](https://github.com/Colcolat/login_rive_animation/commit/822bd8584a8b376fa31ca300c8b6cec71251dafb) de Colcolat. Incluye el oso animado, un campo de correo y un campo de contraseña con control de visibilidad. Es una interfaz de ejemplo: todavía no envía credenciales ni inicia sesión en un servidor.

## Ejecutar en Chrome desde la Mac

Abre Terminal y ejecuta:

```sh
cd ~/Desktop/mobilee/login_river_animation
flutter pub get
flutter run -d chrome
```

Flutter abrirá Chrome con la pantalla de login. Pulsa `q` en la terminal para detenerla.

## Ejecutar en el emulador Android desde Terminal

En esta Mac ya existe el emulador `Flutter_Pixel_API_36`. Abre una terminal y ejecuta:

```sh
cd ~/Desktop/mobilee/login_river_animation
flutter pub get
flutter emulators --launch Flutter_Pixel_API_36
flutter devices
flutter run -d emulator-5554
```

Espera a que el emulador termine de arrancar antes de ejecutar `flutter run`. Si `flutter devices` muestra otro identificador para el emulador, úsalo después de `-d` en lugar de `emulator-5554`. Para detener la app, pulsa `q` en la terminal donde se está ejecutando.

## Ejecutar en el emulador desde Android Studio

1. Abre **Android Studio** y selecciona **Open**. Elige la carpeta `~/Desktop/mobilee/login_river_animation` (la raíz del proyecto Flutter, no solo la carpeta `android`).
2. Si Android Studio lo solicita, instala o habilita los complementos **Flutter** y **Dart**, y espera a que termine la carga del proyecto.
3. Abre **Tools > Device Manager** y pulsa el botón de inicio del dispositivo virtual `Flutter_Pixel_API_36`. Espera a que aparezca la pantalla de Android.
4. En la barra superior de Android Studio, elige ese emulador como dispositivo de destino. Abre `lib/main.dart` y pulsa **Run** (▶). La app se compilará, instalará y abrirá en el emulador.
5. Si el emulador no aparece en la lista de destino, abre la terminal de Android Studio y ejecuta `flutter devices` para comprobar que Android terminó de iniciar.

## Ejecutar en un celular Android

1. En el celular, abre **Ajustes > Acerca del teléfono** y toca **Número de compilación** siete veces para habilitar las opciones de desarrollador. La ubicación exacta puede variar según la marca.
2. En **Opciones de desarrollador**, activa **Depuración por USB**.
3. Conecta el celular a la Mac con un cable USB que permita transferir datos. Desbloquéalo y acepta el mensaje **Permitir depuración por USB** cuando aparezca.
4. En la terminal, ejecuta:

   ```sh
   cd ~/Desktop/mobilee/login_river_animation
   flutter pub get
   flutter devices
   flutter run -d <ID_DEL_CELULAR>
   ```

   Reemplaza `<ID_DEL_CELULAR>` por el identificador Android que muestre `flutter devices`, sin escribir los signos `<` y `>`. Flutter compila, instala y abre la app en el celular.

Si el celular no aparece, revisa que siga desbloqueado, que aceptaste la autorización de depuración y que el cable transfiera datos. Ejecuta `flutter doctor` para detectar problemas con el SDK de Android.
