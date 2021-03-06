﻿\version "2.13.45"
#(ly:set-option 'relative-includes #t)
% \include "italiano.ly"

\include "../filename.ily"
\bookOutputSuffix "s2"
sharedProperties = { \include "../global.ily" }
individualBreaks = { }

\include "midi.ily"
	
\score {
    \removeWithTag #'aCappella
    \removeWithTag #'solo
    \unfoldRepeats
		\sopranoIIClarinet
    \midi { }
  }

