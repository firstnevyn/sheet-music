\version "2.24.3"

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
#(set-global-staff-size 22)

global = {
  \time 2/2
  \tempo 2 = 80
  \key d \major 
}
\include "predefined-guitar-fretboards.ly"

intromelody = { R1*3 }
introchords = \chordmode  {d1 g d }

lastlinemelody = {r2 b4 a g g fis g  e2. d4 d1 }
lastlinechords = \chordmode {g1 e:m a d1*2}
lastlinewords  = \lyricmode { Help us spread the good news of the Lord }

refrainchords = \chordmode { a1 d1 a b:m g  d b:m g a e:m a d b:m g e:m a d  }
refrainmelody = {
  r1 d1^\markup \italic "Chorus" e a4. g8 fis4 e d1 \break
  r2 a'4 (g) fis1  b4. a8 g4 fis  e1 \break
  g4 g a g fis e e
  e fis a a g fis1 \break
  \lastlinemelody \bar "||" \break
}

refrainlyrics = \lyricmode {
  Spi -- rit, come to us to -- day
  Spi -- rit, walk with us we pray
  Our Souls need your gui -- ding force
  To help us serve our God
  Help us spread the good news of the Lord
}

versechords = \chordmode { g1*3 fis1*2:m a c g fis:m c a1 }
versemelody = {
  r1 r4^\markup \italic "Verse" b' b b b a2 g4 a2.fis4 a1
  r4 a a a a a g fis4 g1 ~ g \break
  r4 g g fis d d fis g \set melismaBusyProperties = #'() \slurDashed a2. (fis4) a1 \break \unset melismaBusyProperties \slurSolid
  r4 g g g g2 fis4 g a1  \break
}

verseone = \lyricmode {
  Long have we wai -- ted for you to come
  to fill our hearts with strength and joy
  Lord send your po -- wer to your peo _ -- ple
  help us to work in your name
}
 
versetwo = \lyricmode { 
  Long have we pray -- ed for you spi -- rit
  to shape our voi -- ces to pro -- claim
  Lord send your po -- wer to your cho -- sen ones
  help us to speak in your name
}

\score {
   <<  
  \override Score.NonMusicalPaperColumn.padding = #1
  \new ChordNames \with { midiInstrument = "drawbar organ"} {
    \global \introchords \repeat volta 3 {
      \refrainchords \alternative { 
        \volta 1,2 {\versechords} 
        \volta 3 { \lastlinechords }
      }
    }
  }
  \new Voice = "melody" \with { midiInstrument = "oboe (orch)" } {
    \relative c' {  \global \intromelody \repeat volta 3 { 
      \refrainmelody \alternative {
        \volta 1,2 {
          \versemelody
        }  
        \volta 3 \volta #'() {
            %\section \sectionLabel "Coda" {}
            \relative c'' {   \lastlinemelody ~ d1 \fine \bar "|."  }     
          }
        }
      }        
    }
  }    
  \new Lyrics \lyricsto "melody" {
     << {
      \refrainlyrics \set stanza = "v1"  \verseone
      }
      \new Lyrics {
        \set associatedVoice = "melody"
        \skip 1*36 \set stanza = "v2" \versetwo
      }
      \new Lyrics {
        \set associatedVoice = "melody"
        \skip 1*70 \lastlinewords
      }
    >>
  }
  >>
  \layout {
    indent = 0.0
  }
}
 
\score {
  <<
    \new ChordNames \with { midiInstrument = "drawbar organ"} {
    \global \introchords \unfoldRepeats {
      \repeat volta 3 {
        \refrainchords \alternative { 
          \volta 1,2 {\versechords} 
          \volta 3 { \lastlinechords }
        }
      }
    }
  }
  \new Voice = "melody" \with { midiInstrument = "oboe (orch)" } {
    \relative c'{ \unfoldRepeats { 
      \global \intromelody \repeat volta 3 { 
        \refrainmelody \alternative {
          \volta 1,2 {
            \versemelody
          }  
          \volta 3  {
              %\section \sectionLabel "Coda" {}
              \relative c'' {  \lastlinemelody ~ d1 \fine \bar "|."  }     
          }
            }
          }
        }
      }        
    }
  >>
  \midi {}
}