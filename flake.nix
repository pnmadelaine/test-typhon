{
  inputs = {
    typhon.url = "github:typhon-ci/typhon";
    nixpkgs.follows = "typhon/nixpkgs";
  };

  outputs = { self, typhon, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      actions = typhon.actions.${system};
    in {
      typhonProject = actions.mkProject {
        meta = {
          title = "Tests for Typhon";
          description = "Nix-based continuous integration";
          homepage = "https://typhon-ci.org";
        };
        actions = {
          jobsets =
            actions.gitJobsets "https://github.com/pnmadelaine/test-typhon";
        };
      };
      typhonJobs = { };
    };
}
