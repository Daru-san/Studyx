{
  flutter,
  lib,
  pkg-config,
  gtk3,
}:
flutter.buildFlutterApplication {
  pname = "Studyx";

  version = "1.0.0-dev";

  src = ../.;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [ gtk3 ];

  autoPubspecLock = ../pubspec.lock;

  meta = {
    description = "Study app.";
    license = [ lib.licenses.mit ];
    maintainers = [ lib.maintainers.daru-san ];
    mainProgram = "studyx";
  };
}
