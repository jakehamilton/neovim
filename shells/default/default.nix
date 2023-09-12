{
  mkShell,
  system,
  inputs,
  ...
}:
mkShell {
  inherit (inputs.self.checks.${system}.pre-commit-check) shellHook;
}
