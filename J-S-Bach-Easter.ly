\version "2.24.4"

% 20 is the default...
#(set-global-staff-size 21)

% This music functon "MyTranspose" controls the global transpose of all voices.
MyTranspose =
#(define-music-function (m)
  (ly:music?)
  #{ \transpose d e $m #})

%MyTranspose = {}

\header {
  title = "Easter"
  poet = "Robert Campbell"
  composer = "Jakob Hintze 1678"
  arranger = "J.S. Bach (1685-1750)"
  meter = "7.7.7.7 D"
  piece = "SALZBERG (ALLE MENSCHEN)"
}

\paper {
  % Add space for instrument names
  indent = 10\mm
  left-margin = 8\mm
  right-margin = 8\mm
  systems-per-page = 5
  tagline = ""
  ragged-last = ##t
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
}

soprano =  {
  \MyTranspose {
    \global
    \relative c'' {
      a4 d a b a4. g8 fis2 a4 a g fis e e d2
      a'4 d a b a4. g8 fis2 a4 a g  fis e e d2
      e4 e fis8 [gis]  a4 a gis a2 b4. cis8  d4 d cis cis b2
      fis4 fis b a a gis a2 b4 a g fis e e d2 \bar "||" d2 d2 \bar "|."
    }
  }
}

alto = {
  \MyTranspose {
    \global
    \relative c' {
      d4 d d d d cis d2 d4 d8 [cis] b [cis] d4d cis d2
      d4 d d d d cis d2 d4 d8 [cis] b [cis] d4d cis d2
      cis4 cis d cis fis e8 [d] cis2 e8 [fis] g4 fis fis fis fis8 [e] d2
      d4 d d cis d d cis2 d d8 [cis] b [cis] d4 cis d2 b a
    }
  }
}

tenor = {
  \MyTranspose {
    \global
    \relative c {
      fis4 fis8 [g] a4 g8 [fis] e [d] e4 d2 fis4 fis g a b a fis2
      fis4 fis8 [g] a4 g8 [fis] e [d] e4 d2 fis4 fis g a b a8 [g] fis2
      a4 a a a b b a2 g4. a8 b4 b b ais b2
      a4 a  g8 [fis] e4 d8 [fis] e [d] e2 g4 fis g a b a8 [g] fis2 g fis
    }
  }
}

bass = {
  \MyTranspose {
    \relative c {
      \global
      d4 b fis g a a d2 d4 d e fis g a d,2
      d4 b fis g a a d2 d4 d e fis g a d,2
      a4 a d fis8 [e] d4 e a,2 e'4 e b8 [cis] d [e] fis4 fis b,2
      d4 d g, a b b a2 g4 d' e fis g a d,2 g, d'
    }
  }
}

wordrhythms = {
  \repeat unfold 8 { d4 d d d d d d2 }
  d2 d2
}

verseone = \lyricmode {
  \set stanza = "1. "
  At the Lamb's high feast we sing Praise to our vic -- to -- rious King,
  Who hath washed us in the tide Flow -- ing from his pierc -- ed side:
  Prase we him, whose love di -- vine Gives his sa -- cred blood for wine
  Gives his bod -- y  for the feast, Christ the vic -- tim Christ the priest
}

versetwo = \lyricmode {
  \set stanza = "4. "
  Eas -- ter tri -- umph, Eas -- ter joy, Sin a -- lone can this de -- stroy,
  From sin's pow'r do thou set free Soul's new -- born,𝄓 O Lord. in thee.
  Hymns of glo -- ry songs of praise, Fa -- ther, un -- to thee we raise;
  Ris -- en Lord,𝄓 all praise to thee With the Spir -- it ev -- er be. A -- men
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Sop" "Alt" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
      \new NullVoice = "words" { \wordrhythms }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "words" \verseone
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "words" \versetwo

    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Ten" "Bas" }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
