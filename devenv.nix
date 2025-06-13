{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  env.GREET = "devenv";

  packages = [
    pkgs.git
    pkgs.nodejs_23
    pkgs.jdk23
  ];

  android = {
    enable = true;
    platforms.version = [
      "34"
      "35"
    ];
    # systemImageTypes = [ "google_apis_playstore" ];
    # abis = [ "arm64-v8a" "x86_64" ];
    # cmake.version = [ "3.22.1" ];
    # cmdLineTools.version = "11.0";
    # tools.version = "26.1.1";
    # platformTools.version = "34.0.5";
    # platformTools.version = "35.0.2";
    # buildTools.version = [ "30.0.3" ];
    buildTools.version = [ "35.0.0" ];
    # emulator = {
    #   enable = true;
    #   version = "34.1.9";
    # };
    sources.enable = false;
    # systemImages.enable = true;
    ndk.enable = true;
    # googleAPIs.enable = true;
    # googleTVAddOns.enable = true;
    # extras = [ "extras;google;gcm" ];
    # extraLicenses = [
    #   "android-sdk-preview-license"
    #   "android-googletv-license"
    #   "android-sdk-arm-dbt-license"
    #   "google-gdk-license"
    #   "intel-android-extra-license"
    #   "intel-android-sysimage-license"
    #   "mips-android-sysimage-license"
    # ];
    # android-studio = {
    #   enable = true;
    #   package = pkgs.android-studio;
    # };
  };

  scripts = {
    hello.exec = ''
      ${pkgs.cowsay}/bin/cowsay Hello from $GREET
    '';
    barepack.exec = ''
      npx bare-pack --target ios --target android  --linked --out app/app.bundle.mjs backend/backend.mjs
    '';
    log.exec = ''
      adb logcat *:V | grep -i expo
    '';
  };

  enterShell = ''
    hello
    git --version
  '';
}
