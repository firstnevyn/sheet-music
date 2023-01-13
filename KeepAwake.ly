\version "2.22.0"
\header {
  title = "Keep awake"
  composer = "Philipp Nicolai"
  arranger = "Johann Sebastian Bach"
  piece = "WACHET AUF"
}
global = {
  \key c \major
  \time 2/2
  \tempo 2=84-92
}

soprano = \relative c'' {
  \global
  c,2 e g g g g a1 g
  r2 g c g c4 (d) e2 d c b (a) g1
  r2 g c g a e f4 (e) d2 c1
  c2 e g g g g a1 g
  r2 g c g c4 (d) e2 d c b (a) g1
  r2 g c g a e f4 (e) d2 c1
  r2 g' g2. f4 e2 d c1
  r2 g' g2. f4 e2 d c1
  r2 d e f e1
  r2 g a b c c4 (d) e2 d c
  g c g a e f4 (e) d2 c1
}

alto = \relative c' {
  \global
  % Music follows here.

}

tenor = \relative c' {
  \global

}

bass = \relative c {
  \global
  % Music follows here.

}

verseOne = \lyricmode {
  \set stanza = "1."
  % Lyrics follow here.
  Keep aw -- ake, be al -- ways rea -- dy
  God's time app -- roa -- ches sure and stea -- dy
  God's strenth will keep your heart from blame.
  Clouds, the Spi -- rit's light con -- ceal -- ing,
  dis -- perse, God's pur -- est light re -- vea -- ling;
  cre -- a -- tion will its Sove -- rign name.
  Dry bran -- ches burst forth green,
  God's ad -- vent signs are seen: Hal -- le -- lu -- jah!
  Christ's Judge -- ment won, God's will be done;
  Gods's new do -- min -- ion thus be -- gun
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Lyrics follow here.

  Rise and shine for One is com -- ing
  whose love will quench all na -- tures's thir -- sting
  to be made whole for -- ev -- er more.
  On that day to end all weep -- ing
  death's swords trans -- formed to tools of reap --  ing,
  the God of might will mer -- cy pour
  In -- car -- nate God app -- ears
  em -- bra -- cing all our tears: Hal -- le -- lu -- jah!
  Gods' ma -- je -- sty et -- er -- na -- ly
  re -- vealed to set the cos -- mos free

  %}
}

\score {
  \new Staff <<
    \new Voice = "soprano" { \soprano }
    \new Lyrics \lyricsto "soprano" \verseOne
    \new Lyrics \lyricsto "soprano" \verseTwo
  >>
  \layout{
    indent = 0.0
    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration =
      #(ly:make-moment 1)
    }
  }
}


%{ \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Soprano" "Alto" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano } %{
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseThree
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Alto" }
    } << }
      \new Voice = "alto" { \voiceTwo {\alto \bar "|." }  }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseThree }
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Tenor" "Bass" }
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
%}