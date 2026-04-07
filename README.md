# cat-directory-app

Prueba técnica de Wilmer Molina para el puesto de desarrollador Flutter.

## Requisitos previos

- [Flutter](https://docs.flutter.dev/get-started/install) instalado y en el `PATH` (`flutter doctor`).
- **Android**: Android Studio (SDK), emulador o dispositivo físico con depuración USB habilitada.
- **iOS**: macOS, Xcode, simulador o iPhone con cable; para **TestFlight** / App Store: cuenta de [Apple Developer](https://developer.apple.com/) (programa de pago).

---

## Instalar paquetes

En la raíz del proyecto:

```bash
cd cat_directory_app
flutter pub get
```

- Tras editar `pubspec.yaml`, vuelve a ejecutar `flutter pub get`.
- Para actualizar dependencias dentro de los rangos del `pubspec`: `flutter pub upgrade`.

---

## Ejecutar la app en distintos modos (Android e iOS)

Todos los comandos asumen que estás en la carpeta del proyecto.

### Dispositivo Android o iOS

Lista emuladores y físicos:

```bash
flutter devices
```

Ejecuta en uno concreto (sustituye `<device_id>` por el ID que muestre la lista):

```bash
flutter run -d <device_id>
```

Si solo hay un dispositivo o emulador conectado, puedes usar solo `flutter run`.

**Android:** arranca un AVD desde Android Studio o `flutter emulators` / `flutter emulators --launch <emulator_id>`.

**iOS (solo en Mac):** abre el Simulador (`open -a Simulator`) o conecta un iPhone; acepta confiar en el equipo si es físico.

### Modo debug (por defecto)

Hot reload, símbolos de depuración, más lento:

```bash
flutter run
# explícito:
flutter run --debug
```

### Modo profile

Rendimiento cercano a release, útil para medir con DevTools (sin depurador pesado):

```bash
flutter run --profile
```

### Modo release

Optimizado; en dispositivo real comprueba el comportamiento final (animaciones, rendimiento):

```bash
flutter run --release
```

Los mismos modos aplican tanto si el objetivo es **Android** como **iOS**; cambia solo el dispositivo (`-d`) o el emulador/simulador activo.

---

## Generar el APK en release (Android)

Desde la raíz del proyecto:

```bash
flutter build apk --release
```

El APK queda en:

`build/app/outputs/flutter-apk/app-release.apk`

### Variante recomendada para Play Store (ABIs separados, menor tamaño)

```bash
flutter build appbundle --release
```

Genera un **AAB** en `build/app/outputs/bundle/release/app-release.aab` (formato que usa Google Play).

### Firma (publicación real)

Configura el keystore y `key.properties` según la [documentación oficial de Flutter para Android](https://docs.flutter.dev/deployment/android). Sin firma configurada, el build puede fallar o no ser aceptable para tiendas.

---

## Publicar en TestFlight (iOS)

TestFlight solo aplica a **iOS**. Necesitas un **IPA** firmado para distribución en App Store y subirlo a App Store Connect (el APK/AAB es solo para Android).

### 1. Preparar Xcode y firma

- Abre `ios/Runner.xcworkspace` en Xcode.
- En **Signing & Capabilities**, selecciona tu **Team** de Apple Developer y un **Bundle Identifier** único (ej. `com.tuempresa.cat_directory_app`).
- En [App Store Connect](https://appstoreconnect.apple.com/) crea la app con ese mismo bundle ID.

### 2. Compilar IPA con Flutter

```bash
flutter build ipa --release
```

Flutter indica la ruta del IPA (suele estar bajo `build/ios/ipa/`).

Opciones útiles:

```bash
flutter build ipa --release --export-method app-store
```

### 3. Subir a App Store Connect

- **Transporter** (Mac): arrastra el `.ipa` y envía.
- O **Xcode**: *Window → Organizer → Archives* → *Distribute App* → App Store Connect.
- O **CLI** con `xcrun altool` / `notarytool` según tu flujo (ver documentación actual de Apple).

### 4. TestFlight

1. En App Store Connect, entra a tu app → **TestFlight**.
2. Espera a que el build termine de procesarse (puede tardar varios minutos u horas).
3. Completa **Información de cumplimiento de exportación** si Apple lo pide.
4. Añade **grupos de prueba internos o externos** y envía la build a revisión de TestFlight si aplica.

### Notas

- La primera publicación suele requerir revisión de metadatos y a veces de la build para pruebas externas.
- El número de versión (`version` / build en `pubspec.yaml`) debe subir en cada upload aceptado por App Store Connect.

---

## Comprobación rápida del entorno (Android e iOS)

```bash
flutter doctor -v
```

Revisa que las secciones **Android toolchain** y **Xcode** (en Mac) estén en orden antes de compilar en release o subir builds a tiendas.

---

## Notas sobre el desarrollo del proyecto

- **Arquitectura:** el código se organizó (o se intentó organizar) siguiendo **clean architecture**, separando responsabilidades entre capas de presentación, dominio y datos.

- **Razas (breeds):** se definió un **modelo de datos**, una **entidad** y una función para **convertir los objetos de la lista de breeds a `Map`**, de modo que la app pueda trabajar con esos datos de forma consistente.

- **Hechos (facts):** no se creó un modelo de datos dedicado porque la API solo expone un valor necesario en la app, de tipo **`String`**, por lo que no se justificaba una capa extra de mapeo.

- **Tests:** no se añadieron pruebas automatizadas porque **no se cuenta con el conocimiento necesario** para implementarlas con criterio en este momento.

- **Navegación:** no se implementaron **animaciones al pasar de una vista a otra** por **falta de tiempo**.

- **Inyección de dependencias:** se hace **sin librerías de terceros**, inyectando dependencias **solo a través de los constructores** de las clases.

- **Bloc / estado:** los **`BlocProvider`** están **declarados por separado en cada pantalla** para poder **cargar los datos en el momento en que cada vista lo necesita**.
