{
  description = "hbjydev's personal nix flakes";

  outputs = { self }: {
    templates = {
      python = {
        path = ./python;
        description = "A basic Python nix flake with linters configured.";
      };
    };
  };
}
