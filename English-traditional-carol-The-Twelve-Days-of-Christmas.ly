\version "2.24.4"

\header {
  title = "The Twelve Days of Christmas"
  subtitle = "On the first day of Christmas"
  composer = "English traditional carol"
  tagline = ""
}
#(set-global-staff-size 22)
\paper {
  systems-per-page = #4
  %annotate-spacing = ##t
  markup-system-spacing = #'((basic-distance . 4)
                             (minimum-distance . 1)
                             (padding . 1)
                             (stretchability . 3))
}

myNum =
#(define-music-function (text) (string?)
   #{
     -\markup {
       \box
       \override #'(font-name ."Arial Black") % <-- CHANGE YOUR FONT HERE
       \fontsize #+1                     % <-- CHANGE YOUR SIZE HERE
       %\medium                           % Forces it to not be bold
       #text
     }
   #})

global = {
  \time 4/4
  \key g \major
  \tempo 4=100
}

soprano = \relative c' {
  \global
  \repeat volta 4 {
    \partial 4 d8^\markup "Verse 1 - 4"  d8 | d4^\markup {
      \concat {
        "("
        \hspace #0.3
        \score {
          \new RhythmicStaff \with {
            \remove "Staff_symbol_engraver"
            \remove "Time_signature_engraver"
            \remove "Clef_engraver"
            fontSize = #-3
            \override Beam.positions = #'(1.75 . 1.75)
          }
          { c8[ c8] }
          \layout { 
            indent = 0
            ragged-right = ##t
          }
        }
        \hspace #0.3
        ")"
      }
    }
    g8 g8 g4 g8 g8 | a8 [b] c a b4. c8
    \time 3/4
    d4^\myNum "4" a8 b c4 d4^\myNum "3" a8 (b) c4 
    \time 4/4 
    d4^\myNum "2" a8 b c4 
    b8 c8 d4^\myNum "1" e8 (c) b g a4 g2.
  }
  \repeat volta 8 {
    \partial 4 d8^\markup "Verse 5 - 12" d8 | d4  g8 g8 g4 g8 g8 | a8 b c a b2
    \time 3/4
    d4^\myNum "12" a8^\markup {\italic "faster for v12"}   [b] c [a]
    \grace d8 d4^\myNum "11" a8 [b] c [a]^\markup {  "goto " \box \fontsize #-2 \override #'(font-name . "Arial Black") "5" } 
    d4^\myNum "10" a8 [b] c [a] 
    d4^\myNum "9" a8 [b] c [a] 
    d4^\myNum "8" a8 [b] c [a] 
    d4^\myNum "7" a8 [b] c [a] 
    d4^\myNum "6" a8 [b] c [a]
    \time 4/4
    d2^\myNum "5" e8 (cis4.) d1
    \time 3/4
    d8 [(c)] b a g4
    c4 e, g
    \time 4/4
    a8 [(g)] fis e d4 b'8 c d4 e8 [(c)] b g a4 g2. 
  }
}

alto = \relative c' {
  \global
  \repeat volta 4 {\partial 4 d8 d8 d4 d8 d8 d4 d8 e8 fis8 [g] a fis g4. g8
                   fis4 fis8 g a4
                   fis4 fis8 (g) a4
                   fis4 fis8 g a4 fis8 a8
                   g4 g g8 e8 fis4 g2.}
  \repeat volta 8 {
    \partial 4 d8 d8 d4 d8 d8 d4 d8 e8 fis8 g a fis g2
    fis4 fis8 [g] a [g]
    \grace fis8 fis4 fis8 [g] a [g]
    fis4 fis8 [g] a [g] fis4 fis8 [g] a [g] fis4 fis8 [g] a [g]
    fis4 fis8 [g] a [g] fis4 fis8 [g] a [g] 
    fis2 g fis1
    g4 8 8 4 e c d e cis8 8 d4 fis8 a g4 4 8 e fis4 g2.
  } 
}

tenor = \relative c' {
  \global
  \repeat volta 4 {
    \partial 4 a8 a8 b8 [b8] b8 c8 d4 c8 d8 a a d d d2
    d4-> r r d-> r r d-> r r 
    d8 d8 d4 d8 (e) d d c4 b2.}
  \repeat volta 8 {
    \partial 4 a8 a8 b4 b8 c8 d4 c8 d8 a a d d d2
    d4-> r r \grace d8 d4-> r r d-> r r d4-> r r d-> r r d-> r r d4-> r r 
    d2 cis8 (e4.) d1 d4 d8 d8 e4 c4 c b a8 [(b)] a g d4 d'8 d d4 d8 (e) d d c4 b2.
  }
}

bass = \relative c {
  \global
  \repeat volta 4 { 
    \partial 4 fis8 fis8 g4 g8 
    a b4 a8 g fis e d d g2
    d4-> r r d-> r r d-> r r 
    d'8 c b4 c4 d8 d8 d,4 g2.
  }
  \repeat volta 8 {
    \partial 4 fis8 fis8 g4 g8 a b4 a8 g fis e d d g2
    d4-> r r \grace d8 d4-> r r d-> r r d4-> r r d-> r r d-> r r d4-> r r 
    b'2 a d (cis) 
    a4 g8 [fis] e4
    a4 a, b
    cis a8 a d4
    d'8 c b4 c4 d8 d8 d,4 g2.
  }
}

verseOne =  {
  \set includeGraceNotes = ##t
  \set stanza = "1."
  \repeat volta 4 \lyricmode {On the first day of Christ -- mas my true love sent to me (a)
                              four call -- ing birds, three french hens, two tur -- tle doves, and a
                              par -- tridge in a pear tree
  }
  \repeat volta 8 \lyricmode { 
    On the fifth day of Christ -- mas my true love sent to me
    twelve drum -- mers drum -- ming,
    e -- lev'n pi -- pers pi --ping,
    ten lords a -- leap -- ing,
    nine la -- dies danc -- ing,
    eight maids a -- milk -- ing,
    sev'n  swans a -- swim -- ming,
    six geese a -- lay -- ing,
    five gold __ rings, __
    four call -- ing birds, three french hens, two tur -- tle doves, and a
    par -- tridge in a pear tree
  }
}

verseTwo = {
  \set includeGraceNotes = ##t
  \set stanza = "2."
  \repeat volta 4 \lyricmode { 
    On the se -- cond day of Christ -- mas 
    my true love sent to me
    four
    three
    two
    and a par -- tridge in a pear tree 
  }
  \repeat volta 8 {
    \lyricmode {On the "sixth..." (etc) }  
    \repeat unfold 9 {\skip 1}
    \lyricmode {
      twelve
      e -- lev'n
      ten
      nine
      eight
      seven
      six
      \set stanza = "V11 Only:"
      and "you   know    the" rest1
    }
  }
}


\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    } \lyricsto "soprano" \verseOne
    \new Lyrics = "tenor" \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      \consists "Merge_rests_engraver"
      instrumentName = \markup \center-column { T B }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
    \context Lyrics = "tenor" {
      \lyricsto "tenor" \verseTwo
    }
  >>

  \layout {
    \context {
      \Score
      \numericTimeSignature 
    }
    \context {
      \ChoirStaff % Or \PianoStaff, \ChoirStaff, GrandStaff, etc.
      \override StaffGrouper.staff-staff-spacing.basic-distance = #16
    }
    \context{
      \Staff
    }
  }
  \midi { }
}
