module Which
  ( WhichOptions(..)
  , whichSync
  , whichAllSync
  ) where

import Prelude
import Data.Array.NonEmpty (NonEmptyArray, fromArray)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)

newtype WhichOptions
  = WhichOptions
  { path :: Maybe String
  , pathExt :: Maybe String
  }

type WhichOptionsImpl
  = { path :: Nullable String
    , pathExt :: Nullable String
    }

fromOptions :: WhichOptions -> WhichOptionsImpl
fromOptions (WhichOptions { path, pathExt }) = { path: toNullable path, pathExt: toNullable pathExt }

foreign import whichSyncImpl :: EffectFn2 String (Nullable WhichOptionsImpl) (Nullable String)

whichSync :: Maybe WhichOptions -> String -> Effect (Maybe String)
whichSync options command = do
  let
    options' = toNullable $ map fromOptions $ options
  result <- runEffectFn2 whichSyncImpl command options'
  pure $ toMaybe result

foreign import whichAllSyncImpl :: EffectFn2 String (Nullable WhichOptionsImpl) (Nullable (Array String))

whichAllSync :: Maybe WhichOptions -> String -> Effect (Maybe (NonEmptyArray String))
whichAllSync options command = do
  let
    options' = toNullable $ map fromOptions $ options
  result <- runEffectFn2 whichAllSyncImpl command options'
  pure
    $ toMaybe result
    >>= fromArray
