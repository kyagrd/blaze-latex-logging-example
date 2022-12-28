# blaze-latex-logging-example
Simple code example to demonstrate logging with LaTeX output,
with minimal features (just wrtie on one file, no automatic log rotating, etc.)
and Haskell package dependencies (must use external log display server).

![screen-record](https://github.com/kyagrd/blaze-latex-logging-example/blob/main/screen-record.gif?raw=true)

See `app/Main.hs` and `src/Lib.hs` for details.

For logging only those simple formulae rederable by client side LaTeX renderer (KaTeX/MathJax),
vscode's internal markdown viewer assisted by AutoScroll vscode plugin is good enough.
However, adding additional lightwegit features rederable using clident side JS (e.g., tree/graph rendering)
requires full dive into developing vscode plugin, which may not be cost effective for small scale projects
or experimental prototyping stage.

Further developments, incluing support for such few additional featuers, to be continued at https://github.com/hnu-pl/blaze-latex-logger
