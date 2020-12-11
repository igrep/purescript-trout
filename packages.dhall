let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20201206/packages.dhall sha256:c9ffd7577fb8ee2197309591d7ccc0f506ee37b9078866f0ef159f5abbb1b32b

let overrides =
      { argonaut = upstream.argonaut // { version = "v7.0.0" }
      , argonaut-codecs = upstream.argonaut-codecs // { version = "v7.0.0" }
      , argonaut-traversals =
          upstream.argonaut-traversals // { version = "v8.0.0" }
      }

let additions = {=}

in  upstream // overrides // additions
