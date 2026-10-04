\version "2.24.4"

% 20 is the default... change this to make everything a little bigger or smaller
#(set-global-staff-size 17)

% This music functon "MyTranspose" controls the global transpose of all voices.
MyTranspose =
#(define-music-function (m)
  (ly:music?)
  #{ \transpose d e $m #})

MyTranspose = {}

\header {
  title = "My Beloved Spake"
  subtitle = "To Ursula and Martin Watson"
  poet = "Text" 
  meter = "Solomon II, 10-13"
  composer = "Patrick Hadley"
  arranger = "(1899-1973)"
}

\paper {
  % Add space for instrument names
  indent = 0\mm
  left-margin = 18\mm
  right-margin = 18\mm
  top-margin = 12\mm
  %bottom-margin = 24\mm
  systems-per-page = 3
  tagline = ""
  ragged-last = ##f
  %ragged-bottom = ##
  ragged-last-bottom = ##f
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
sloff = { \omit Slur }
slon = {\undo \omit Slur}

global = {
  \key bes \major
  \time 4/4 \numericTimeSignature
  \set Timing.beatStructure = 1,1,1,1
  \dynamicUp
  %\override SpacingSpanner.uniform-stretching = ##t
  %\override BarLine.allow-span-bar = ##f
}

soprano =  {
  \MyTranspose {
    \global
    \relative c'' {
      r2 r4 bes8. bes16 | bes bes8. ~ bes4 c4. c8 | \tuplet 3/2 {c bes c} des2 bes4 |
      f'2.. f,8 2. 4 d'4. (f8) bes,4. c8 g2. bes,4  f'1
      r2 r4 r8 f g4 r8 f \tuplet 3/2 {g4 f g} d r8 f g4. bes8 |
      d4 c2 g4 bes4. 8  ees4. d8 d2. c8 bes g4. a8 \tuplet 3/2 { bes4 c d } 
      f (d8 a f') d4 a8| g' (f d2) f,4 c'2 r8 f,4 8
      g2 ~ 8 f4 g8 d4 d2 f4 a f2 d4 | a' r8 d, a' a a b c bes bes (f) des4 des8 f| e4 d8 cis gis'4. cis8 |
      d4 (a2) d8 e f (c bes2  aes8 bes) des2. r8 8 aes'2.. aes,8 2. 4 des2. (aes'4) bes,2. 
      \omit Slur c8 (des) \undo \omit Slur | f2 ( bes,2 ~ bes ~ 8) r8 r4 r2 r4 r8 bes, f'1 ~ 1 |
      r2 r4 \fermata r8 \fermata bes,8 f'1 ~ 2 \fermata r2 \fermata \fine
    }
  }
}

sopranodynamics ={
   s2 s4 s8 \f s8 s1 s1 s16 \ff s16 s8 s4 s2 s1 s1 s1 \dim s1 \p s2. s8 \p s8 s1 s4 s8 \< s8 s4 s4  \!
   \> s2 s4 \! s4 s1 s4 s4 s8 \> s2 s8 \! \< s2 s8 \! s1 s4 s4 \> s2 s8\! s1 s1 s1 s1 s2 s8 \p %fuge entry
   s8 s4 s16 \cresc s1 s8
   s1 s1 s1 s2 s4 \fff
   s1 s1 s1 s1 s2  \override DynamicTextSpanner.style = #'none s2 \dim s1 s1 s1 \p s1 s1 s2 \ppp
  
}

alto = {
  \MyTranspose {
    \global
    \relative c'' {
      r2 r4 bes8. bes16 | bes bes8. ~ bes4 bes4. bes8 | \tuplet 3/2 {bes bes bes} bes2 bes4 |
      bes2.. f8 2. 4 bes4. (a8) aes4. g8 f4 (ees2) \sloff des8 (c) \slon bes1
      r2 r4 r8 c bes4 r8 d \tuplet 3/2 {bes4 d ees} | 
      \sloff c8 (bes) \slon r8 d ees4. f8 d2 ees4 
      \sloff f8 (ees) \slon d4  ees8 (f) g4. a8 c (bes4 g8) c,4 d f4. ees8 
      \tuplet 3/2 {d4 ees f}
      g4 (f8 d e f) a4 b8 c a8. (a,16) d8 (c4) bes8 a2 r8 c4 c8
      bes2 ~ 8 d4 ees8 c4 bes2 a4 bes2 c4 bes a2 ~ 8  r r aes f' f f g aes g  g  (cis,) 
      gis'4 \sloff fis8 e e4 dis8 cis a4 d8 (e) \slon f (e) d d des4. (c8 des ees f  bes ) a2. r8 a
      des2.. aes8 2. 4 bes2. (beses4) aes2. aes4 bes2 (f2 ~ 2 ~ 8)  r8 r4 r2 r4 r8 bes8 1 ~ 1 
      r2 r4 \fermata r8 \fermata bes8 bes1 ~ 2 \fermata r2 \fermata \fine
      
    }
  }
}
altodynamics = \sopranodynamics

tenor = {
  \MyTranspose {
    \global
    \relative c' {
      r2 r4 bes8. bes16 | bes bes8. ~ bes4 bes4. bes8 | \tuplet 3/2 {bes bes bes} bes2 bes4 |
      f'2.. f,8 2. 4 g'4 (f) ees d des2 f,4. (ees8) d1
      r2 r4 r8 ees d4 r8 d \tuplet 3/2 {d4 d f } | g4 r8 a8 bes4. g8a2 g4 bes |
      \sloff c8 (bes) \slon r4 r8 c f8. d16 ees2.  g,8 g d'4. 8 \tuplet 3/2 {c4 a aes} |
      g8 (a4 bes8 d4) e8 (f) | d4 c8 d a8. (d,16 f8 ) g16 (f) e2 r8 ees4 8 |
      d2 ~ 8 4 f8 g4 g2 c,4 d2  aes'4 \sloff g8 (f) e (f) r
      d a' a a b c bes bes (f) des4 des8 f| e4 d8 cis gis'4. cis8 |
      d4 (a2) d8 e f (c bes2  aes8 bes) des2. r8 
      des8 f2.. aes,8 \slon 2. 4 ges'2 (f) fes,2. fes4 
      des1 ~ 2 ~ 8 r r4  r2 r4 r8 bes8 d1 ~ 1 
      r2 r4 \fermata r8 \fermata bes8 d1 ~ 2 \fermata r2 \fermata \fine
      
      
    }
  }
}
tenordynamics = \sopranodynamics

bass = {
  \MyTranspose {
    \relative c' {
      \global
      r2 r4 bes8. 16 | 16 8. ~ 4 4. aes8 | \tuplet 3/2 {8 8 8} ges2 bes4 |
      d2.. f,8 2. 4 ees'4 (d) c bes f2 bes, f1
      r2 r4 r8 bes8 f4 r8 a \tuplet 3/2 {f4 a bes} d r8 d c4. d8 bes2 c4 ees | g 
      r8 a bes8. 16 4 a8 g g,4 a bes c4. c8 \tuplet 3/2  { g'4 d4 c} bes8 (d4 f8 a4 ) \sloff c8 (d) |
      a8. (a,16) \slon bes2 d4 | c2 r8 bes4 8 f2 ~8 a4 bes8 d4 d2 g,4 f2 bes4. c8 |d2 ~8 r r 
      aes f' f f g aes g  g  (cis,) 
      gis'4 \sloff fis8 e e4 dis8 cis a4 d8 (e) \slon f (e) d d des4. (c8 des ees f  bes ) a2. r8 8 |
      des2.. aes8 2. 4 ees'2 (bes) des2. c8 (bes) aes1 (g2 ~ 8) r8 r4 \break r2 r4 r8 bes,8 f1 ~ 1 |
      r2 r4 \fermata r8 \fermata bes8 f1 ~ 2 \fermata r2 \fermata \fine
    }
  }
}
bassdynamics = \sopranodynamics

openingcommonwords = \lyricmode {
  My Be -- lov -- ed spake, and said un -- to me, Rise up,
  my love, my fair  one, and come a -- way
  For, lo the win -- ter is past, the rain is o -- ver and | gone;
  \mp The flow'rs ap -- pear on the 
}
endingcommonwords = \lyricmode {
  and the voice of the tur -- tle is heard in our land; 
  The fig -- tree put -- teth forth her green  figs,
  and the vines with the ten -- der grape give a good __ smell
  A -- rise my love, my fair one, and come __ a -- way. __ A -- way __
}
sopranowords = { \openingcommonwords 
                 \lyricmode { earth;  the time of the sing -- ing of  birds __ is come, }
                 \endingcommonwords
}

altowords = { \openingcommonwords
              \lyricmode { earth; the time of the sing -- ing sing -- ing of __  birds __ is come, }
              \endingcommonwords
}

tenorwords = { \openingcommonwords
              \lyricmode { earth; the time of the sing -- ing sing -- ing of birds __ is come, }
              \endingcommonwords 
}

basswords = { \openingcommonwords
              \lyricmode { earth, on the earth; the time of the sing -- ing of  birds __ is come, }
              \endingcommonwords
}

%{
\score {
  \new ChoirStaff <<
    \new Staff \with {
      %instrumentName = \markup \right-column { "Soprano" "Alto" }
      instrumentName = \markup \center-column { "S" "A" }
      %shortInstrumentName = \markup \center-column { "S" "A" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \lyricsto "soprano" \sopranowords

    \new Staff \with {
      %instrumentName = \markup \right-column { "Tenor" "Bass" }1131857
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
      \override TupletNumber.self-alignment-X = #CENTER
      \override SpacingSpanner.uniform-stretching = ##t
    }
    \context {
      \Lyrics
      \override VerticalAxisGroup.staff-affinity = #CENTER
      \override LyricSpace.minimum-distance = #1
    }
  }
%}

%%{
\score {
   \new ChoirStaff <<
    \new Dynamics \sopranodynamics
    \new Staff \with {
      %instrumentName = \markup \right-column { "Soprano" "Alto" }
      instrumentName = \markup \center-column { "Soprano" }
      %shortInstrumentName = \markup \center-column { "S" "A" }
    } <<
      
      \new Voice = "soprano"  { \soprano } 

    >>
    \new Lyrics \lyricsto "soprano" \sopranowords
    \new Dynamics \altodynamics
    \new Staff \with {
      %instrumentName = \markup \right-column { "Soprano" "Alto" }
      instrumentName = \markup \center-column { "Alto" }
      %shortInstrumentName = \markup \center-column { "S" "A" }
    } <<
      \new Voice = "alto" { \alto }
    >>
    \new Lyrics \lyricsto "alto" \altowords
    
    \new Dynamics \tenordynamics
    \new Staff \with {
      %instrumentName = \markup \right-column { "Tenor" "Bass" }1131857
      instrumentName = \markup \center-column { "Tenor" }
      %shortInstrumentName = \markup \center-column { "T" "B" }
    } <<
      \clef "treble_8"
      \new Voice = "tenor" { \tenor }
    >>
    \new Lyrics \lyricsto "tenor" \tenorwords
    
    \new Dynamics \altodynamics
    \new Staff \with {
      %instrumentName = \markup \right-column { "Tenor" "Bass" }1131857
      instrumentName = \markup \center-column { "Bass" }
      %shortInstrumentName = \markup \center-column { "T" "B" }
    } <<
      \clef bass
      \new Voice = "bass" { \bass }
    >>
    \new Lyrics \lyricsto "bass" \basswords
  >>

  \layout {
    \context {
      \ChoirStaff
      \override SystemStartBracket.transparent = ##t
    }
    \context {
      \Score 
      %\override SpacingSpanner.uniform-stretching = ##t
    }
    \context {
      \Lyrics
      %\override VerticalAxisGroup.staff-affinity = #CENTER
      \override LyricSpace.minimum-distance = #1
    }
  }
  \midi {
    \tempo 4=100
    \set midiInstrument = "choir aahs"
    \context {
      \Voice
      \remove Dynamic_performer
    }
    \context {
      \Score
      \consists Dynamic_performer
    }
  }
}
