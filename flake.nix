{
  description = "hbjydev's personal nix flakes";

  outputs = { self }: {
    templates = {
      python = {
        path = ./python;
        description = "A basic Python nix flake with linters configured.";
      };

      go = {
        path = ./go;
        description = "A basic Go nix flake with a linter provided.";
      };
    };
  };
}
