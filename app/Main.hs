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

-- https://katex.org/docs/browser.html#starter-template accessed 2022-12-26
katexStarterHead :: Html
katexStarterHead = H.head $ do
        link
            ! rel "stylesheet"
            ! href "https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.css"
            ! integrity "sha384-vKruj+a13U8yHIkAyGgK1J3ArTLzrFGBbBc0tDp4ad/EyewESeXE/Iv67Aj8gKZ0"
            ! crossorigin "anonymous"
        -- The loading of KaTeX is deferred to speed up page rendering
        script
            ! defer "defer"
            ! src "https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.js"
            ! integrity "sha384-PwRUT/YqbnEjkZO0zZxNqcxACrXe+j766U2amXcgMg5457rve2Y7I6ZJSm2A0mS4"
            ! crossorigin "anonymous"
            $ ""
        -- To automatically render math in text elements, include the auto-render extension
        script
            ! defer "defer"
            ! src "https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/contrib/auto-render.min.js"
            ! integrity "sha384-+VBxd3r6XgURycqtZ117nYw44OOcIax56Z4dCRWbxyPt0Koah1uHoK0o4+/RRE05"
            ! crossorigin "anonymous"
            ! onload "renderMathInElement(document.body);"
            $ ""

-- attributes not predefined in blaze-html
integrity :: AttributeValue -> Attribute
integrity = customAttribute "integrity"
crossorigin :: AttributeValue -> Attribute
crossorigin = customAttribute "crossorigin"

main :: IO ()
main = do
    someFunc
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
        printHtml $ H.span "\\[\\frac{x}{y}\\]"
        s1 <- getline
        printHtml $ H.p ! A.id "s1" $ toMarkup("1st hello world, " <> s1 <> "?")
        s2 <- getline
        printHtml $ H.p ! A.id "s1" $ toMarkup("2nd hello world, " <> s2 <> "?")
        printHtml $ H.span "\\[\\frac{y}{z}\\]"
        println "</body>"
        println "</html>"


