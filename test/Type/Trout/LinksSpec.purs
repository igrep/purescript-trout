module Type.Trout.LinksSpec (spec) where

import Prelude

import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Type.Trout.Links (linksTo)
import Type.Trout.TestSite (UserID(..), testSite)
import URI.HostPortPair as HostPortPair
import URI.URIRef as URIRef

spec :: Spec Unit
spec = do
  describe "Hyper.Routing.Links" $
    describe "linksTo" $
      case linksTo testSite of
        { home, users, wiki, about } -> do

          it "returns link for Lit" $
            printURI home `shouldEqual` "/"

          it "returns link for nested routes" $
            case users.user (UserID "owi") of
              { profile, friends } -> do
                  printURI profile `shouldEqual` "/users/owi/profile"
                  printURI friends `shouldEqual` "/users/owi/friends"

          it "returns link for CaptureAll" $
            printURI (wiki ["foo", "bar", "baz.txt"]) `shouldEqual` "/wiki/foo/bar/baz.txt"

          it "returns link for Raw" $
            printURI about `shouldEqual` "/about"
  where
    printURI = URIRef.print { printUserInfo: identity
      , printHosts: HostPortPair.print identity identity
      , printPath: identity
      , printHierPath: identity
      , printQuery: identity
      , printFragment: identity
      , printRelPath: identity
      }
