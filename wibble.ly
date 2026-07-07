\version "2.26.0"

\header {
  title = "Wibble"
  composer = "Composer"
}

\score {
  \relative c' {
    c4 d e f g1 \bar "|."
  }
  \layout {}
  \midi {}
}
\score {
  \relative c' { b2 e f g \bar "|."}
  \layout {}
}