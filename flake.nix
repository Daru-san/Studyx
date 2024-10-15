{
  description = "Studyx nix flake with devshell for flutter compatibility.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/flake-utils";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        flutter-android-studio = pkgs.symlinkJoin {
          name = "flutterAndroidStudio";
          paths = with pkgs; [
            pkgs.android-studio
            pkgs.flutter.unwrapped
            # dart
            gnumake
            check
            pkg-config
            glibc
            android-tools
            jdk
            git
          ];

          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/flutter \
              --prefix ANDROID_JAVA_HOME=${pkgs.jdk.home}

            wrapProgram $out/bin/android-studio \
              --prefix FLUTTER_SDK=${pkgs.flutter.unwrapped} \
              --prefix ANDROID_JAVA_HOME=${pkgs.jdk.home}
          '';
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            flutter-android-studio
          ];
        };
      }
    );
}
