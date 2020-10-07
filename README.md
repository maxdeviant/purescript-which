# purescript-which

[![Pursuit](https://pursuit.purescript.org/packages/purescript-which/badge)](https://pursuit.purescript.org/packages/purescript-which)

PureScript bindings for [`which`](https://www.npmjs.com/package/which).

## Installation

```
spago install which
```

You will also need to have [`which`](https://www.npmjs.com/package/which) installed:

#### Yarn

```
yarn add which
```

#### npm

```
npm i which
```

## Usage

```purs
module Main where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Which (whichSync)

main :: Effect Unit
main = do
  let
    commandToFind = "neofetch"
  command <- whichSync Nothing commandToFind
  log
    $ case command of
        Just found -> "Found " <> commandToFind <> " at " <> found
        Nothing -> "Did not find " <> commandToFind
```

```purs
module Main where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Options ((:=))
import Effect (Effect)
import Effect.Console (log)
import Which (whichSync, path)

main :: Effect Unit
main = do
  let
    commandToFind = "neofetch"
  command <- whichSync (Just $ path := Just ".") commandToFind
  log
    $ case command of
        Just found -> "Found " <> commandToFind <> " at " <> found
        Nothing -> "Did not find " <> commandToFind
```
