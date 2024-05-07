
\header {
  title = "By Spirit, We Proclaim"
  composer = "Guy L"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}
\include "predefined-guitar-fretboards.ly"

refrainchords = \chordmode { d1 a b:m g1. d2 b1:m g1 a }

refrain = \lyricmode { 
  Spi -- rit, come to us to -- day
  Spi -- rit, walk with us we pray
  Our Souls need your guiding force
  To help us serve our God
  Help us spread the good news of the Lord
}

refrainmelody = \relative c' { d1 e a4. g8 fis4. e8 d1 r2 g4 (fis) e1  b'4. a8 g4. fis8 e1  }
\score {
  <<
    \new voice = "chords" {
      \new ChordNames \refrainchords
    }
    \new Voice = "melody" {
      \key d \major \refrainmelody
    }
     \new Lyrics \lyricsto "melody" {
       \refrain
     }
  >>

  \layout {}
  \midi {}
}
