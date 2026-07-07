\version "2.26.0"


\paper {
    print-all-headers = ##t
}

\score {
  \header {
    title = "Wibble"
    composer = "Composer"
  }
  \relative c' {
    c4 d e f g1 \bar "|."
  }
  \layout {}
  \midi {}
}
\score {
  \header {
       title = "foo"
  }
  \relative c' { b2 e f g \bar "|."}
  \layout {}
}