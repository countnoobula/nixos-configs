{ pkgs, ... }:

{
  # Include Android Studio and Android Platform Tools in your Home Manager packages
  home.packages = with pkgs; [
    android-studio-full  # Provides Android Studio
  ];

  # Set up environment variables for Android development
  home.sessionVariables = {
    ANDROID_HOME = "${pkgs.androidsdk}";
    JAVA_HOME = "${pkgs.openjdk}";
    PATH = "${pkgs.androidsdk}/cmdline-tools/latest/bin:${pkgs.androidsdk}/platform-tools:${pkgs.android-studio}/bin:$PATH";
  };
}
