\version "2.24.4"

% 20 is the default... change this to make everything a little bigger or smaller
%#(set-global-staff-size 18)

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
  indent = 0\mm
  left-margin = 18\mm
  right-margin = 18\mm
  top-margin = 12\mm
  %bottom-margin = 24\mm
  systems-per-page = 5
  tagline = ""
  ragged-last = ##t
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  %system-system-spacing = #'((basic-distance . 0.1)
  %                           (minimum-distance . 10)
  %                           (padding . 5)
  %                           (stretchability . 60))
  markup-system-spacing = #'((basic-distance . 0.1)
                             (minimum-distance . 5)
                             (padding . 3)
                             (stretchability . 60))
  %annotate-spacing = ##t
}

global = {
  \key d \major
  \time 4/4 \numericTimeSignature
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1,1
  \override SpacingSpanner.uniform-stretching = ##t
  \override BarLine.allow-span-bar = ##f
}

soprano =  {
  \MyTranspose {
    \global
    \relative c'' {
      a4 d a b | a4. g8 fis2 | a4 a g fis | e e d2 \barNumberCheck 5 \allowBreak
      a'4 d a b a4. g8 fis2 a4 a g  fis e e d2 | \barNumberCheck 9  \break
      e4 e fis8 gis  a4 a gis a2 b4. cis8  d4 d cis cis b2  \break
      fis4 fis b a a gis a2 b4 a g fis e e d2  \bar "||" \allowBreak
      d2 d2 \bar "|."
    }
  }
}

alto = {
  \MyTranspose {
    \global
    \relative c' {
      d4 d d d d cis d2 d4 d8 cis b cis d4d cis d2
      d4 d d d d cis d2 d4 d8 cis b cis d4d cis d2
      cis4 cis d cis fis e8 d cis2 e8 fis g4 fis fis fis fis8 e d2
      d4 d d cis d d cis2 d d8 cis b cis d4 cis d2 b a
    }
  }
}

tenor = {
  \MyTranspose {
    \global
    \relative c {
      fis4 fis8 g a4 g8 fis e d e4 d2 fis4 fis g a b a fis2
      fis4 fis8 g a4 g8 fis e d e4 d2 fis4 fis g a b a8 g fis2
      a4 a a a b b a2 g4. a8 b4 b b ais b2
      a4 a  g8 fis e4 d8 fis e d e2 g4 fis g a b a8 g fis2 g fis
    }
  }
}

bass = {
  \MyTranspose {
    \relative c {
      \global
      d4 b fis g a a d2 d4 d e fis g a d,2
      d4 b fis g a a d2 d4 d e fis g a d,2
      a4 a d fis8 e] d4 e a,2 e'4 e b8 cis d e fis4 fis b,2
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
  At the Lamb's high feast we sing Praise to our vic -- to -- rious King;
  Who hath washed us in the tide Flow -- ing from his pierc -- ed side:
  Praise we him, whose love di -- vine Gives his sa -- cred blood for wine;
  Gives his bod -- y  for the feast, Christ the vic -- tim Christ the priest;
}

versetwo = \lyricmode {
  \set stanza = "2. "
  Where the Pas -- chal blood is poured. Death's dark an -- gel sheathes his sword;
  Is -- rael's hosts tri -- umph -- ant go Thro' the wave that drowns the foe.
  Prase we Christ, whose blood was shed. Pas -- chal vic -- tim. Pas -- chal bread;
  With sin -- cer -- i  -- ty and love Eat we man -- na from a -- bove.
}

versethree = \lyricmode {
  \set stanza = "3. "
  Migh -- ty vic -- tim from the sky. Hell's fierce pow'rs  be -- neath thee lie;
  Thou hast con -- quered in the fight, Thou hast brought us life and light;
  Now no more can death ap -- pall. Now no more the grave en -- thrall;
  Thou hast o -- pened par -- a -- dise. And in thee thy saints shall rise.
}

versefour = \lyricmode {
  \set stanza = "4. "
  Eas -- ter tri -- umph, Eas -- ter joy. Sin a -- lone can this de -- stroy;
  From sin's pow'r do thou set free Soul's new -- born,𝄓 O Lord. in thee.
  Hymns of glo -- ry songs of praise, Fa -- ther, un -- to thee we raise;
  Ris -- en Lord,𝄓 all praise to thee With the Spir -- it ev -- er be.
  \once \override Lyrics.LyricHyphen.minimum-distance = #4  A -- men
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      %instrumentName = \markup \right-column { "Soprano" "Alto" }
      instrumentName = \markup \center-column { "S" "A" }
      %shortInstrumentName = \markup \center-column { "S" "A" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
      \new NullVoice = "words" { \wordrhythms }
    >>
    \new Lyrics \lyricsto "words" \verseone
    %\new Lyrics \lyricsto "words" \versetwo
    %\new Lyrics \lyricsto "words" \versethree
    \new Lyrics \lyricsto "words" \versefour

    \new Staff \with {
      %instrumentName = \markup \right-column { "Tenor" "Bass" }
      instrumentName = \markup \center-column { "T" "B" }
      %shortInstrumentName = \markup \center-column { "T" "B" }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>

  \layout {
    \context {
      \ChoirStaff
      \override SystemStartBracket.transparent = ##t
    }
    \context {
      \Score
      \override SpacingSpanner.uniform-stretching = ##t
    }
    \context {
      \Lyrics
      \override VerticalAxisGroup.staff-affinity = #CENTER
      \override LyricSpace.minimum-distance = #.9
    }
  }
  \midi {
    \tempo 4=100
    \set midiInstrument = "choir aahs"
  }
}
