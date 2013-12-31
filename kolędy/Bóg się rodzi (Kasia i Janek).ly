\version "2.19.0"
#(ly:set-option 'strokeadjust #t)

\header {
  title = "Bóg się rodzi"
  poet = "słowa: Franciszek Karpiński (1741-1825)"
  composer = "opracowanie: Kasia Szymanek, Janek Warchoł"
}
%--------------------------------MELODIA
metrumitp = {
  \key d \major
  \time 3/4
  \set Timing.beamExceptions = #'()
  \tempo ""
}
melodiaSopranu =
\relative f' {
  \metrumitp
  a2 cis4 |
  d4 cis2 |
  a2 e'4 |
  fis4 e2 |
  a,2 cis4 |
  d4 cis2 |
  a2 e4 |
  fis4 e2 |
  cis'2. |
  d2 d4 |
  cis2. |
  d4 d2 |
  cis2. |
  d2 a4 |
  <<
    {
      b4. b8 b b |
      fis'8. e16 e4 d |
    }
    \new Voice = sopranPierwszy {
      \voiceOne
      \set fontSize = #-2
      b2 b'4 |
      a8 a e e d d |
    }
    \new Lyrics \with { alignAboveContext = sopran }
    \lyricsto sopranPierwszy \lyricmode {
      \set fontSize = #-2
      za -- mie -- szka -- ło mię -- dzy na -- mi.
    }
  >>
  \bar "|."
}

melodiaAltu =
\relative f' {
  \metrumitp
  \repeat unfold 2 {
    d8 e fis e e d |
    d8 e fis e e d |
    d8 e fis e e d |
    d4 cis2 |
  }
  \repeat unfold 3 {
    e8( fis g) g fis e |
    fis8( g a) a fis a |
  }
  e8( fis g) g fis e |
  fis8. e16 cis4 d |
  \bar "|."
}

melodiaTenorow =
\relative f {
  \metrumitp
  \repeat unfold 2 {
    d8. d'16 d4( cis8) b |
    b8. b16 b4( a8) g |
    fis8. a16 d8 a g fis |
    fis4 e2 |
  }
  \repeat unfold 3 {
    g4. e8 fis g |
    a8 a fis( a) a4 |
  }
  g4. e8 fis g |
  a8. cis,16 e4 d |
  \bar "|."
}

melodiaBasow =
\relative f {
  \metrumitp
  \repeat unfold 2 {
    d8. d16 d4( cis8) b |
    b8. fis'16 fis4 fis |
    fis4 fis b, |
    d4 a2 |
  }
  g'4. e8 cis a |
  d8 d d4 fis |
  g4. e8 cis a |
  a8 a a4 d |
  g4. e8 cis a |
  d8 d d4 fis |
  e4. e8 e e |
  a,8. a16 cis4 d |
  \bar "|."
}
akordy = \chordmode {
}

%--------------------------------SŁOWA

wzgardzony = \lyricmode {
  Wzgar -- dzo -- ny o -- kry -- ty chwa -- łą,
  śmier -- tel -- ny Król nad wie -- ka -- mi!
  A Sło -- wo Cia -- łem się sta -- ło
  i mie -- szka -- ło mię -- dzy na -- mi.
  i mie -- szka -- ło mię -- dzy na -- mi.
}

tekstSopranu = \lyricmode {
  \set stanza = "1. "
  Bóg się ro -- dzi, moc  tru -- chle -- je!
  O -- gień krze -- pnie, blask cie -- mnie -- je!
  Wzgar -- dzo -- ny o -- kry -- ty
  A Sło -- wo
  za -- mie -- szka -- ło mię -- dzy na -- mi.
}
tekstAltu = \lyricmode {
  \set stanza = "1. "
  Bóg się ro -- dzi, ro -- dzi, wszel -- ka moc  tru -- chle -- je,
  Pan nie -- bio -- sów ob -- na -- żo -- ny!
  O -- gień krze -- pnie,  krze -- pnie, jas -- ny blask cie -- mnie -- je,
  ma gra -- ni -- ce Nie -- skoń -- czo -- ny!
  \wzgardzony
}
tekstTenorow = \lyricmode {
  \set stanza = "1. "
  Bóg się ro -- dzi, moc  tru -- chle -- je,
  Pan nie -- bio -- sów ob -- na -- żo -- ny!
  O -- gień krze -- pnie, blask cie -- mnie -- je,
  ma gra -- ni -- ce Nie -- skoń -- czo -- ny!
  \wzgardzony
}
tekstBasow = \lyricmode {
  \set stanza = "1. "
  Bóg się ro -- dzi, moc  tru -- chle -- je,
  Pan ob -- na -- żo -- ny!
  O -- gień krze -- pnie, blask cie -- mnie -- je,
  ma Nie -- skoń -- czo -- ny!
  \wzgardzony
}

zwrotkaII = \markup {
}
zwrotkaIII = \markup {
}
zwrotkaIV = \markup {
}
zwrotkaV = \markup {
}

%--------------------------------USTAWIENIA

#(set-global-staff-size 17)

\paper {
  indent = 12 \mm
  short-indent = 2 \mm
  %left-margin = 15 \mm
  %right-margin = 15 \mm
  %top-markup-spacing #'basic-distance = 8
  %markup-system-spacing #'basic-distance = 18
  %system-system-spacing #'basic-distance = 18
  system-system-spacing #'padding = 1
  %score-markup-spacing #'basic-distance = 15
  ragged-last-bottom = ##f
}

#(define powiekszenie-zwrotek '(1.2 . 1.2))
#(define interlinia '(baseline-skip . 3)) % 3 is Lily default
odstepMiedzyZwrotkami = \markup \vspace #2
odstepOdNumeruDoZwrotki = \markup \hspace #1

\layout {
  \override LyricText #'stencil =
  #(lambda (grob)
     (ly:stencil-scale (lyric-text::print grob) 0.9 1))
}

%--------------------------------STRUKTURA

\score {
  \new ChoirStaff <<
    \new ChordNames {
      \germanChords
      \set chordNameLowercaseMinor = ##t
      \akordy
    }
    \new Staff = sopran {
      \clef treble
      \set Staff.instrumentName = "Sopran "
      \set Staff.shortInstrumentName = "S "
      \new Voice = sopran
      \with { \consists "Ambitus_engraver" } {
        \set Staff.midiInstrument = "clarinet"
        \dynamicUp
        \tupletUp
        \melodiaSopranu
      }
    }
    \new Lyrics \lyricsto sopran \tekstSopranu

    \new Staff = alt
    \with { \consists "Ambitus_engraver" } {
      \clef treble
      \set Staff.instrumentName = "Alt "
      \set Staff.shortInstrumentName = "A "
      \new Voice = alt {
        \set Staff.midiInstrument = "clarinet"
        \dynamicUp
        \tupletUp
        \melodiaAltu
      }
    }
    \new Lyrics \lyricsto alt \tekstAltu

    \new Staff = tenor
    \with { \consists "Ambitus_engraver" } {
      \clef "treble_8"
      \set Staff.instrumentName = "Tenor "
      \set Staff.shortInstrumentName = "T "
      \new Voice = tenor {
        \set Staff.midiInstrument = "clarinet"
        \dynamicUp
        \tupletUp
        \melodiaTenorow
      }
    }
    \new Lyrics \lyricsto tenor \tekstTenorow

    \new Staff = bas
    \with { \consists "Ambitus_engraver" } {
      \clef bass
      \set Staff.instrumentName = "Bas "
      \set Staff.shortInstrumentName = "B "
      \new Voice = bas {
        \set Staff.midiInstrument = "clarinet"
        \dynamicUp
        \tupletUp
        \melodiaBasow
      }
    }
    \new Lyrics \lyricsto bas \tekstBasow
  >>
  \layout {
  }
  \midi {
    \tempo 4=85
  }
}

%--------------------------------STOPKA

\paper {
  tagline = \markup {
    \pad-to-box #'(0 . 0) #'(0 . 1.6)
    \center-column {
      \with-url
      #"http://lilypond.org/"
      \scale #'(0.75 . 0.75)
      #(format #f "LilyPond v~a"
         (lilypond-version)
         )
    }
  }

  oddFooterMarkup = \markup {
    \override #'(baseline-skip . 1)
    \column {
      \fill-line {
        %% Copyright header field only on first page in each bookpart.
        \on-the-fly #part-first-page {
          \override #'(baseline-skip . 2)
          \center-column {
            \scale #'(1 . 1)
            \fromproperty #'header:copyright
            \scale #'(0.85 . 0.85)
            "skład nut: Jan Warchoł (jan.warchol@gmail.com, 509 078 203)"
          }
        }
      }
      \fill-line {
        %% Tagline header field only on last page in the book.
        \on-the-fly #last-page \fromproperty #'header:tagline
      }
    }
  }
}
