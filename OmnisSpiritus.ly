\version "2.24.4"
\header {
  title = "Omnis spiritus laudet Dominum"
  subtitle = "Faux Canon"
  composer = "F Debon"
}
\paper { 
  indent = 0\mm
  %line-width = 160\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  %line-width = #(- line-width (* mm  3.000000) (* mm 1))
  line-width = 200\mm - 2.0 * 10.16\mm
  %score-markup-spacing.minimum-distance = 15\mm
  markup-system-spacing.minimum-distance = 15\mm
  %annotate-spacing = ##t
}

\layout {
  \context {
    \Staff
    \override VerticalAxisGroup.remove-empty = ##t
    \override VerticalAxisGroup.remove-first = ##t
  }
}

global = {
  \key bes \major
  \time 4/4
}



sopranoVoice = \relative c'' {
  \global
  \dynamicUp
  % Music follows here.
  s1*12
  \repeat volta 2 {bes8 c bes d4 d4 c8 bes a bes4 d8 bes4 bes8 a bes4 a8 ~ a2 R1 
                   bes8 c bes d4 d c8 bes a bes4 d8 bes4 bes8 a4. a8 ~ a2 R1
  }
  bes8 c bes d4 d4. \fermata
}

verseSopranoVoice = \lyricmode {
  % Lyrics follow here.
  \repeat volta 2 {Lau -- da -- te e -- um in cym -- ba -- lis be -- ne so -- man -- ti -- bus
  Lau -- da -- te e -- um in cym -- ba -- lis iu -- bi -- la -- tio -- nis }
  Lau -- da -- te e -- um
}
altotheme = {f4. bes f4 ees4. ees8 ~ ees2 d4. ees d4 d4. d8 ~ d2}
altoVoice = \relative c' {
  \global
  \dynamicUp
  % Music follows here.
  s1*8
  \repeat volta 2 { \altotheme }
  \repeat volta 2 { \repeat unfold 2 { \altotheme }}
  f4. bes f4 \fermata 
}

verseAltoVoice = \lyricmode {
  % Lyrics follow here.
  \repeat volta 2 { Lau -- da -- te e -- us_ Lau -- da -- te e -- us_ }
  \repeat volta 2 { \repeat unfold 2 { Lau -- da -- te e -- us_ Lau -- da -- te e -- us_ } }
  Lau -- da -- te 
}
tenortheme = \relative c' { d8 d d4 d8 d4 d8 c c c c c c c4 c8 c c4 c8 c4 c8 bes bes bes bes bes bes bes4}
tenorVoice = \relative c' {
  \global
  \dynamicUp
  s1*4
  \tenortheme
  \repeat volta 2 { \tenortheme }
  \repeat volta 2 { \repeat unfold 2 { \tenortheme }}
  
  d8 d d2. \fermata 
  % Music follows here.
  
}

verseTenorVoice = \lyricmode {
  % Lyrics follow here.
  Lau -- da -- te e -- um in cym -- ba -- lis so -- nan -- ti -- bus Lau -- da -- te e -- um in cym -- ba -- lis so -- nan -- ti -- bus 
  \repeat volta 2 { Lau -- da -- te e -- um in cym -- ba -- lis so -- nan -- ti -- bus Lau -- da -- te e -- um in cym -- ba -- lis so -- nan -- ti -- bus }
  \repeat volta 2 { \repeat unfold 2 {Lau -- da -- te e -- um in cym -- ba -- lis so -- nan -- ti -- bus Lau -- da -- te e -- um in cym -- ba -- lis so -- nan -- ti -- bus }}
  Lau -- da -- te
}
basstheme = \relative c' { g4 d r8 g4 d8 g ees g4 g8 ees g4 fis d r8 fis4 d8 g a bes4 bes8 a g4 }
bassVoice = \relative c {
  \global
  \dynamicUp
  % Music follows here.
  \repeat unfold 2 {\basstheme}
  \repeat volta 2 { \basstheme } 
  \repeat volta 2 { \repeat unfold 2 { \basstheme }}
  g'4 d g2 \fermata \bar "|."
}

verseBassVoice = \lyricmode {
  % Lyrics follow here.
  \repeat unfold 2 {  Om -- nis spi -- ri -- tus lau -- det Do -- mi --num Om -- nis spi -- ri -- tus lau -- det Do -- mi --num }
  \repeat volta 2 { Om -- nis spi -- ri -- tus lau -- det Do -- mi --num Om -- nis spi -- ri -- tus lau -- det Do -- mi --num }
  \repeat volta 2 { \repeat unfold 2 { Om -- nis spi -- ri -- tus lau -- det Do -- mi --num  Om -- nis spi -- ri -- tus lau -- det Do -- mi --num}}
                                       
  Lau -- da --te
}

sopranoVoicePart = \new Staff \with {
  instrumentName = "Soprano"
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verseSopranoVoice }

altoVoicePart = \new Staff \with {
  instrumentName = "Alto"
  midiInstrument = "choir aahs"
} { \altoVoice }
\addlyrics { \verseAltoVoice }

tenorVoicePart = \new Staff \with {
  instrumentName = "Tenor"
  midiInstrument = "choir aahs"
} { \clef "treble_8" \tenorVoice }
\addlyrics { \verseTenorVoice }

bassVoicePart = \new Staff \with {
  instrumentName = "Bass"
  midiInstrument = "choir aahs"
} { \clef bass \bassVoice }
\addlyrics { \verseBassVoice }

\score {
  <<
    \sopranoVoicePart
    \altoVoicePart
    \tenorVoicePart
    \bassVoicePart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
