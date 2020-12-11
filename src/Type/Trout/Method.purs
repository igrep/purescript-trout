module Type.Trout.Method
       ( Options
       , Get
       , Head
       , Post
       , Put
       , Patch
       , Delete
       , Trace
       , Connect
       ) where

import Data.Void (Void)

import Type.Trout (Method)

type Options = Method "OPTIONS"

type Get = Method "GET" Void

type Head = Method "HEAD"

type Post = Method "POST"

type Put = Method "PUT"

type Patch = Method "PATCH"

type Delete = Method "DELETE" Void

type Trace = Method "TRACE" Void

type Connect = Method "CONNECT" Void
