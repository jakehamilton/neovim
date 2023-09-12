{lib, ...}: {
  vim = rec {
    mkKeyBind' = binding: action: desc: options: {
      "${binding}" =
        options
        // {
          inherit action desc;
        };
    };

    mkKeyBind = binding: action: desc:
      mkKeyBind' binding action desc {};

    mkKeyBinds = bindings:
      lib.snowfall.attrs.merge-shallow
      (builtins.map (
          binding:
            builtins.foldl' (f: x: f x) mkKeyBind binding
        )
        bindings);

    mkSilentKeyBind' = binding: action: desc: options:
      mkKeyBind' binding action desc (options
        // {
          silent = true;
        });

    mkSilentKeyBind = binding: action: desc:
      mkSilentKeyBind' binding action desc {};

    mkSilentKeyBinds = bindings:
      lib.snowfall.attrs.merge-shallow
      (builtins.map (
          binding:
            builtins.foldl' (f: x: f x) mkSilentKeyBind binding
        )
        bindings);
  };
}
