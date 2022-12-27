{-# LANGUAGE CPP #-}
#define __LOC__ ( __FILE__ <> ":" <> show( __LINE__ :: Int ) )
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
module Main (main) where

import Lib

import Text.Blaze
import Text.Blaze.Html5 hiding (main, head, span)
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes hiding (id)
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Pretty
import System.IO

main :: IO ()
main = do
    -- with VSCode extension Live Server
    -- http://localhost:5500/output.html
    -- (or, with any similar util web srv displaying fresh content on file update)
    withFile "output.html" WriteMode $ \h -> do
        let println = hPutStrLn h
        let printHtml = println . renderHtml
        let flush = hFlush h
        let getline = flush >> getLine
        println "<!DOCTYPE html>"
        println "<html>"
        printHtml katexStarterHead
        println "<body>"
        printHtml $ p $ toMarkup( __LOC__ <> "\\( \\displaystyle ~ \\frac{x}{y} \\)" )
        s1 <- getline
        printHtml $ p ! A.id "s1" $ toMarkup( "1st hello world, " <> s1 <> "?" )
        s2 <- getline
        printHtml $ p ! A.id "s2" $ toMarkup( "2nd hello world, " <> s2 <> "?" )
        printHtml $ p $ toMarkup( __LOC__ <> "\\( \\displaystyle ~ \\frac{y}{z} \\)" )
        println "</body>"
        println "</html>"


