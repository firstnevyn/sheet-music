\version "2.18.2"

\header {
  title = "Trisagion"
  composer = "Rosalie Bonighton"
  copyright = "Rosalie Bonighton July '97 Rev. Oct ‘98"
  % Do not display the default LilyPond footer for this book
  tagline = ##f

}

global = {
  \key g \major
  \time 3/4
}

sopranoVoice = \relative c'' {
  \global
  \dynamicUp
  \tempo \markup {"Reflectively"}4=56
  R2. R2. a8 a8 a2 |\tuplet 3/2 {a8 [a8 b8]} g8 g8 r4|
  e16 [e e fis] d8 [d] r8 c8 \tuplet 3/2 {d [d d]} d4 r4 
  R2. R2. a'8 a8 a2 |\tuplet 3/2 {a8 [a8 b8]} c8 a8 r4|
  a16 [a a b] g8 [e] r8 d8 \tuplet 3/2 {e [e e]} e4 r4 
  R2. R2. a8 a8 a2 |\tuplet 3/2 {a8 [a8 b8]} g8 g r4|
  e16 [e e fis] d8 [d] r8 c8 \tuplet 3/2 {d [d d]} d2 ||
 
  
}

verse = \lyricmode {
  Ho -- ly God, ho -- ly and migh -- ty ho -- ly and im -- or -- tal, have mer -- cy on us
  Ho -- ly God, ho -- ly and migh -- ty ho -- ly and im -- or -- tal, have mer -- cy on us
  Ho -- ly God, ho -- ly and migh -- ty ho -- ly and im -- or -- tal, have mer -- cy on us
}

right = {
  % Music follows here.
  \partcombine
  \relative c'' {\global 	 a4 a2 | a8 b g4 fis8 g a a a2 \tuplet 3/2 {a8 [a b]} 
             g [g] b, d e16 e e fis d8 [d] ~ d [c] d2 r4
             a'4 a2 a8 b c4 b8 g a a a2 \tuplet 3/2 {a8 [a b]} c [a] c, e
             a16 a a b g8 e4 d8  e2 r4 a4 a2 a8  b g4 fis8 g
             a8 a a2 \tuplet 3/2 {a8 [a b]} g [g] b, d e16 [ e e fis] d8 [d] ~ d c d2.
  }
  
  \relative c' {\global d4 c2 d4 b4 d d c2 d4 b b b b8 a g4  a2 r4 
                d4 c2 d4 c e d c2 d4 c c e8 d e b4 b8 \tuplet 3/2 {d8 [cis b]} cis4 r4
                e4 e2 d4 b d d c2 d4 b b b b8 a g4 a2.
  }
  
}

left =  {
  % Music follows here.
  \partcombine
  \relative c'
  {\global  fis,4 e2 fis4  d b' fis e2 fis4 d  g8  fis g4 fis e \tuplet 3/2 { g8 [fis e]} fis4 r4
   fis e2 fis4 e c' fis, e2 fis4 e a8 g a4 b8 g4 fis8 <e a>2 r4 cis'4 c2 fis,4 d b' fis e2 fis4
   d g8 fis g4 fis e \tuplet 3/2 {g8 [ fis e]} fis2|
  }
  
  \relative c' {\global d,2 a4 d4 g,4 g' d2 a4 d g, g'8 fis | e8 d c4 b8 a d,2 
                r4 d'2 a4 d a a' d,2 a4 d a a'8 g |f4 e e, a2 r4|
                a' g ~ <g a,> d g, g' d2 a4 d g, g'8 fis e d c4 b8 a d,2. 
                
  }
 
}

drummusic = \drummode { 
  \repeat unfold 3 { 
     <hh tomml>4 <hh bd toml>4 <hh bd tomh> 
     hh8 hh hh4 hh8 hh8 hh8 hh8 hh4 r4 \tuplet 3/2 {hh8 hh hh} hh8 hh8 r4
     hh16 hh hh hh hh8 hh8 r8 hh \tuplet 3/2 {hh8 hh hh} hh4 r4
   }}

sopranoVoicePart = \new Staff \with {
  instrumentName = "Voice"
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verse }

pianoPart = \new PianoStaff \with {
  instrumentName = "Piano"
} <<
  \new Staff = "right" \with {
    midiInstrument = "acoustic grand"
    \consists "Merge_rests_engraver"
  } \right
   \new Dynamics 
  { c2.\mp r  c\mf r r r c\mp r  c\mf r r r c\mp r  c\mf r r r  }
  \new Staff = "left" \with {
    midiInstrument = "acoustic grand"
  } { \set Staff.aDueText = ##f \clef bass \left }
 
>>
drumPart= \new DrumStaff \drummusic


\score {
  <<
    \sopranoVoicePart
    \pianoPart
  >>
  \layout { }
  \midi {
    \tempo 4=56
  }
}
