\version "2.24.3"

\paper {
  
}

\header {
  title = "By Spirit, We Proclaim"
  composer = "Guy Lauricella"
  date = 1984
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}
global = {
  \numericTimeSignature
  \time 2/2
  \tempo 2 = 80
  \key d \major 
}
\include "predefined-guitar-fretboards.ly"


intromelody =  {R1*4}
introchords = \chordmode  {d1 g d a } 


refrainchords = \chordmode { \set noChordSymbol = "-"  d1  a b:m g  d b:m g a e:m a d b:m g e:m a d}
refrainmelody = { 
  d1 e a4. g8 fis4 e d1 
  r2 a'4 (g) fis1  b4. a8 g4 fis  e1  
  g4 g a g fis e e 
  e fis b a g fis1
  r2 b4 a g fis g fis e2. d4 d1 
}
refrainlyrics = \lyricmode { 
  Spi -- rit, come to us to -- day
  Spi -- rit, walk with us we pray
  Our Souls need your gui -- ding force
  To help us serve our God
  Help us spread the good news of the Lord
}

versechords = \chordmode { g1*3 fis1*2:m a c g fis:m c a1*2}
versemelody = {
  r1
  r4 b' b b b a2 g4 a2.fis4 a1
  r4 a a a a a g fis4 g1 ~ g
  r4 g g g d d fis g  \slurDotted a2. (fis4) a1
  r4 g g g g2 fis4 g a1 r
}

verseone = \lyricmode {
  Long have we wai -- ted for you to come 
  to fill our hearts with strength and joy
  Lord send your po -- wer to your peo -- ple
  help us to work in your name
}
 
versetwo = \lyricmode { 
  Long have we pray -- ed for you spi -- rit
  to shape our voi -- ces to pro -- claim
  Lord send your po -- wer to your chosen ones
  help us to speak in your name
}

\score {
   <<  
    \override Score.NonMusicalPaperColumn.padding = #1.75
    \new ChordNames \with { midiInstrument = "drawbar organ"} { \global \introchords \repeat volta 2 { \refrainchords \versechords} \refrainchords \chordmode {g1 e:m a d1*2 }}
    \new Voice = "melody" \with { midiInstrument = "oboe (orch)" } 
      {
      \relative c' {\global \intromelody  \repeat volta 2 { \refrainmelody \versemelody } \relative c' {\slurSolid \refrainmelody r2 b'4 a g fis g fis e2. d4 d1 ~ d \bar "|." } }
    }
     \new Lyrics \lyricsto "melody" {
       <<  {\refrainlyrics \set stanza = "v1"  \verseone}
           \new Lyrics {
             \set associatedVoice = "melody"
             \skip 1*36 \set stanza = "v2" \versetwo
           }
       >>
      \refrainlyrics \lyricmode { Help us spread the good news of the Lord }
     }
  >>

  \layout {
    indent = 0.0
    \context {
      \Score
      \omit BarNumber
    }
  }
  \midi {}
}
