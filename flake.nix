{
  description = "hbjydev's personal nix flakes";

  outputs = { self }: {
    templates = {
      python = {
        path = ./python;
        description = "A basic Python nix flake with linters configured.";
      };

      django = {
        path = ./django;
        description = "A basic Python nix flake with Django installed.";
      };

      go = {
        path = ./go;
        description = "A basic Go nix flake with a linter provided.";
      };

      plain = {
        path = ./plain;
        description = "A basic nix flake with no language-specific configuration.";
      };
    };
  };
}
