\version "2.22.0"
\header {
  title = "Christ the Lord is risen!"
  arranger = "Geoffrey Shaw"
}

\paper {
  check-consistency = ##t
  annotate-spacing = ##t
}
global = {
  \key bes \major
  \time 3/4
}
\layout {
  \context {
    \Staff 
      \override StaffGrouper.staff-staff-spacing.basic-distance = #500
  }
}

soprano = \relative c'' {
  \global
  bes2 bes4 bes (a) bes c2 (d4) bes2
  f4 bes2 bes4 bes (a) g f2 ees4 d2
  f4 bes2 bes4 bes(a) bes c2 d4 c2 
  d4 ees2 d4 c2 bes4 a2 bes4 c2
  d4 ees2 d4 c2 bes4 a (bes) g f2
  f4 bes (a) bes  c2 ees4  d (ees) c bes2.
}

alto = \relative c' {
  \global
  % Music follows here.
  f4 (ees) d ees 2 f4 g (bes a) f2
  f4 bes, (c) d ees (f) ees d2 c4 bes2
  f'4 f (ees) d ees2 f4 f2 a4 g (a)
  b c (bes) a g (a) g g(f) e f2 
  f4 ees (g) f ees2 d4  e (d) e f2 
  ees4 d (ees) f g (a) bes bes (g) a bes2.
}

tenor = \relative c' {
  \global
  % Music follows here.
  d4 (ees) f ees2 d4 c2(f4) d2
  c4 d (c) bes g (f) g a(g) a bes2
  f4 d'(ees) f ees2 d4 c (bes) a c2 
  f4 ees2 f4 ees2 d4 d2 bes4 bes(a) 
  f g(ees) f g (a) bes c2 bes4 a2 
  f4 f' (ees) d c2 bes4 f'2 ees4 d2. 
}

bass = \relative c {
  \global
  % Music follows here.
  bes'4 (c) d c2 bes4 ees,2 (f4) bes,2 
  a4 g (a) bes c (d) ees  f2 f4 bes,2
  f'4 bes (c) d c2 bes4 a (g) f e (f) 
  d c2 d4 ees (f) g d2 g4 f2
  d4 c2 d4 ees (f) g c2 c,4 f2
  f4 bes, (c) d ees (f) g f2 f4 <f bes,>2.
}

verseOne = \lyricmode {
  \set stanza = " 1."
  % Lyrics follow here.
  Christ the Lord is ri -- sen!
  Now is the hour of dark -- ness past;
  Christ hath as -- sumed his reign -- ing power.
  Be -- hold the great ac -- cu -- ser cast 
  Down from the skies to rise no more:
  Al -- le -- lu -- ya Al -- le -- lu -- ya 
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Lyrics follow here. 
  %{
  Christ the Lord is ri -- sen!
  'Twas by thy blood, im -- mor -- tal Lamb,
  Thine armies trod the tempter down;
  'Twas by thy word and power -- ful name
  They gained the bat -- tle and re -- nown:
  Al -- le -- lu -- ya Al -- le -- lu -- ya 
  %}
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Lyrics follow here.
  Christ the Lord is ri -- sen!
  Re -- joice, ye heavens! let ev -- ery star
  Shine with new glor -- ies round the sky!
  Saints, while ye sing the hea -- venly war,
  Raise your Re -- deem -- er's name on high!
  Al -- le -- lu -- ya Al -- le -- lu -- ya 
}

\score {
  \new ChoirStaff 
  <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Soprano" "Alto" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano  } %{
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
    } << %}
      \new Voice = "alto" { \voiceTwo \alto \bar "|." }  
    >> 
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseThree %}
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Tenor" "Bass" }
    } <<
      %\clef "treble_8"
      \clef bass
      \new Voice = "tenor"  { \voiceOne \tenor } %{
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseThree
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Bass" }
    } << %}
      \clef bass
      \new Voice = "bass" { \voiceTwo \bass } 
    >>
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
