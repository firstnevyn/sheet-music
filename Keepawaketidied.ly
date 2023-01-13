\version "2.22.0"
\header {
  title = "Keep awake"
  composer = "Philipp Nicolai"
  arranger = "Johann Sebastian Bach"
  piece = "WACHET AUF"
}


music = \relative c' {
  \time 2/2
  \override BreathingSign.text =
  \markup { \musicglyph "scripts.tickmark" }
  \key c \major
  \tempo 2=84-92
  c2 e g g g g a1 g \breathe
  r2 g c g c4 (d) e2 d c b (a) g1
  r2 g c g a e f4 (e) d2 c1 \breathe
  c2 e g g g g a1 g \breathe
  r2 g c g c4 (d) e2 d c b (a) g1 \breathe
  r2 g c g a e f4 (e) d2 c1 \breathe
  r2 g' g2. f4 e2 d c1 \breathe 
  r2 g' g2. f4 e2 d c1 \breathe
  r2 d e f e1 \breathe
  r2 g a b c c4 (d) e2 d c \breathe
  g c g a e f4 (e) d2 c1 \bar "|."
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
}

\score {
  \new Staff <<
    \new Voice = "voice1" { \music }
    \new Lyrics \lyricsto "voice1" \verseOne
    \new Lyrics \lyricsto "voice1" \verseTwo
  >>
  \layout{
    indent = 0.0
    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration =
      #(ly:make-moment 1/8)
    }
  }
}

\paper {
  %annotate-spacing = ##t
  top-margin = 20
  system-system-spacing = #'((basic-distance . 8) 
                             (minimum-distance . 8)
                             (padding . 4)
                             (stretchability . 60))  
  markup-system-spacing = #'((basic-distance . 8)
                             (minimum-distance  . 4)
                             (padding . 4)
                             (stretchability . 50))
}