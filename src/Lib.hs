{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( katexStarterHead
    ) where

import Text.Blaze.Html5 hiding (head)
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes

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