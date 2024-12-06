{ pkgs ? import <nixpkgs> { overlays = [ (import ../../default.nix) ]; } }:

let
  mkTestBuild = package: let
    emacsPackages = pkgs.emacsPackagesFor package;
    emacsWithPackages = emacsPackages.emacsWithPackages;
  in emacsWithPackages(epkgs: [ ]);

in {
  emacsUnstable = mkTestBuild pkgs.emacsUnstable;
  emacsGit = mkTestBuild pkgs.emacsGit;
  emacsPgtk = mkTestBuild pkgs.emacsPgtk;
  emacs-30 = mkTestBuild pkgs.emacs-30;
}
