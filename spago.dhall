{ name = "which"
, license = "MIT"
, repository = "https://github.com/maxdeviant/purescript-which"
, dependencies =
  [ "arrays", "console", "effect", "nullable", "options", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
