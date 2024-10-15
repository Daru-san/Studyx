{
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
          config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
          };
        };
        androidComposition = pkgs.androidenv.composeAndroidPackages {
          includeEmulator = false;
          includeSources = false;
          includeSystemImages = false;
          systemImageTypes = [ "google_apis_playstore" ];
          abiVersions = [
            "armeabi-v7a"
            "arm64-v8a"
          ];
          includeNDK = true;
          useGoogleAPIs = false;
          useGoogleTVAddOns = false;
          includeExtras = [
            "extras;google;gcm"
          ];
        };
        flutter-android-studio = pkgs.symlinkJoin {
          name = "flutterAndroidStudio";
          paths = with pkgs; [
            pkgs.android-studio
            pkgs.flutter.unwrapped
            dart
            gnumake
            check
            pkg-config
            glibc
            android-tools
            jdk
            git
          ];
        };
      in
      {
        devShells.default = pkgs.mkShell rec {
          ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
          ANDROID_NDK_ROOT = "${ANDROID_HOME}/ndk-bundle";
          ANDROID_JAVA_HOME = "${pkgs.jdk.home}";
          FLUTTER_SDK = "${pkgs.flutter.unwrapped}";
          buildInputs = [
            flutter-android-studio
            androidComposition.androidsdk
          ];
        };
      }
    );
}
