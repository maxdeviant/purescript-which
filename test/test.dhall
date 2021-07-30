let conf = ../spago.dhall
in conf //
  { dependencies =
      conf.dependencies #
        [ "console" ]
  , sources =
      conf.sources #
        [ "test/**/*.purs"
        ]
  }
