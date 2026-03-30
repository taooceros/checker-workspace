{
  pkgs,
  lib,
  config,
  ...
}:
{
  # https://devenv.sh/languages/
  languages.java = {
    enable = true;
    jdk.package = pkgs.jdk21;
    gradle.enable = true;
  };

  env = {
    CHECKERFRAMEWORK = "${toString ./.}/checker-framework";
  };

  scripts.build-checker-framework = {
    description = "Build local Checker Framework using the sibling jdk checkout";
    exec = ''
      cd "${toString ./.}"
      if [ "$#" -eq 0 ]; then
        set -- assemble
      fi
      ./checker-framework/gradlew -p ./checker-framework "$@"
    '';
  };

  scripts.build-randoop = {
    description = "Build Randoop against the local Checker Framework checkout";
    exec = ''
      cd "${toString ./.}"
      if [ "$#" -eq 0 ]; then
        set -- assemble
      fi
      ./randoop/gradlew -p ./randoop -PcfVersion=local "$@"
    '';
  };

  enterShell = ''
    echo
    echo "Helper scripts available in this devenv:"
    echo "  build-checker-framework  Build local Checker Framework using sibling jdk/"
    echo "  build-randoop [task]     Default: assemble, with local checker-framework/ via -PcfVersion=local"
    echo
  '';

  # See full reference at https://devenv.sh/reference/options/
}
