/*
    Titel:        DevIL
    Version:      1.0
    Datum:        2008-09-14
    Autor:        Alexander Knopf, Andreas Leipert
        
    TODO:         - ausgiebig testen...
                  - Menü des Tasksymbols
                  - CapsLock auf 1. und 2. Ebene einbauen:
                    Die Buchstaben reagieren richtig auf CapsLock, da hier "sendinput {blind}"
                    verwendet wird. Bei anderen Tasten muss CapsLock in der ersten und zweiten Ebene
                    explizit abgefragt werden.
                    (Lässt sich das elegant in eine Funktion auslagern?)
    Ideen:        - Symbol ändern
*/

; aus Noras script kopiert:
#usehook on
#singleinstance force
#LTrim 
  ; Quelltext kann eingerückt werden, 
  ; msgbox ist trotzdem linksbündig

SendMode Input
SetTitleMatchMode 2

;name    = DevIL
;enable  = Aktiviere %name%
;disable = Deaktiviere %name%


/*
   Variablen initialisieren
*/

Ebene = 1
PriorDeadKey := ""
setcapslockstate, off


/*
   ------------------------------------------------------
   Modifier
   ------------------------------------------------------
*/

; CapsLock durch Mod3+Mod3
*\::
*CapsLock::
   if GetKeyState("\","P") and GetKeyState("CapsLock","P")
   {
      if GetKeyState("CapsLock","T")
      {
         setcapslockstate, off
      }
      else
      {
         setcapslockstate, on
      }
   }
return

/*
   Ablauf bei toten Tasten:
   1. Ebene Aktualisieren
   2. Abh�ngig von der Variablen "Ebene" Zeichen ausgeben und die Variable "PriorDeadKey" setzen
   
   Ablauf bei "lebenden" (sagt man das?) Tasten:
   1. Ebene Aktualisieren
   2. Abhängig von den Variablen "Ebene" und "PriorDeadKey" Zeichen ausgeben
   3. "PriorDeadKey" mit leerem String überschreiben

   ------------------------------------------------------
   Reihe 1
   ------------------------------------------------------
*/

*SC029::
   EbeneAktualisieren()
   if Ebene = 1
   {
      SendUnicodeChar(0x02C6) ; circumflex, tot
      PriorDeadKey := "c1"
   }
   else if Ebene = 2
   {
      SendUnicodeChar(0x02C7)  ; caron, tot
      PriorDeadKey := "c2"
   }
   else if Ebene = 3
   {
      SendUnicodeChar(0x02D8)   ; brevis
      PriorDeadKey := "c3"
   }
return

*1::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex 1
         BSSendUnicodeChar(0x00B9)
      Else
         send {blind}1
   }
   else if Ebene = 2
   {
      send °
   }
   PriorDeadKey := ""
return

*2::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex 
         BSSendUnicodeChar(0x00B2)
      Else
         send {blind}2      
   }
   else if Ebene = 2
   {
      SendUnicodeChar(0x2116) ; numero
   }
   PriorDeadKey := ""
return

*3::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x00B3)
      Else
         send {blind}3
   }
   else if Ebene = 2
   {
      send §
   }
   PriorDeadKey := ""
return

*4::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x2074)
      Else
         send {blind}4
	}
   else if Ebene = 2
   {
      send »
   }
   else if Ebene = 3
   {
      send ›
   }
   PriorDeadKey := ""
return

*5::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x2075)
      Else
         send {blind}5
	}
   else if Ebene = 2
   {
      send «
   }
   else if Ebene = 3
   {
      send ‹
   }
   PriorDeadKey := ""
return

*6::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x2076)
      Else
         send {blind}6
	}
   else if Ebene = 2
   {
      send $
   }
   else if Ebene = 3
   {
      send £
   }
   PriorDeadKey := ""
return

*7::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x2077)
      Else
         send {blind}7
	}
   else if Ebene = 2
   {
      send €
   }
   else if Ebene = 3
   {
      send ¢
   }
   PriorDeadKey := ""
return

*8::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x2078)
      Else
         send {blind}8
	}
   else if Ebene = 2
   {
      send „
   }
   else if Ebene = 3
   {
      send ‚
   }
   PriorDeadKey := ""
return

*9::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x2079)
      Else
         send {blind}9
	}
   else if Ebene = 2
   {
      send “
   }
   else if Ebene = 3
   {
      send ‘
   }
   PriorDeadKey := ""
return

*0::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x2070)
      Else
         send {blind}0
	}
   else if Ebene = 2
   {
      send ”
   }
   else if Ebene = 3
   {
      send ’
   }
   PriorDeadKey := ""
return

*-::
   EbeneAktualisieren()
   if Ebene = 1
      send {blind}- ; Bind
   else if Ebene = 2
      SendUnicodeChar(0x2013) ; Ged
   else if Ebene = 3
      SendUnicodeChar(0x2014)
   PriorDeadKey := ""
return

*=::
   EbeneAktualisieren()
   if Ebene = 1
   {
      send {´}{space} ; akut, tot
      PriorDeadKey := "a1"
   }
   else if Ebene = 2
   {
      send ``{space}
      PriorDeadKey := "a2"
   }
   else if Ebene = 3
   {
      send ¸ ; cedilla
      PriorDeadKey := "a3"
   }
return


/*
   ------------------------------------------------------
   Reihe 2
   ------------------------------------------------------
*/

*q::
   EbeneAktualisieren()
   if Ebene = 1
      sendinput {blind}x
   else if Ebene = 2
      sendinput {blind}X
   else if Ebene = 3
      send @
   PriorDeadKey := ""
return


*w::
   EbeneAktualisieren()
   if Ebene = 1
         sendinput {blind}v
   else if Ebene = 2
      sendinput {blind}V
   else if Ebene = 3
      send _
   PriorDeadKey := ""
return



*e::
   EbeneAktualisieren()
   if Ebene = 1
   { 
      If (PriorDeadKey = "a1")       ; Schrägstrich
         BSSendUnicodeChar(0x013A)
      Else If (PriorDeadKey = "c2")     ; caron 
         BSSendUnicodeChar(0x013E)
      Else If (PriorDeadKey = "a3")    ; cedilla
         BSSendUnicodeChar(0x013C)
      Else 
         sendinput {blind}l
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "a1")           ; akut 
         BSSendUnicodeChar(0x0139)
      Else If (PriorDeadKey = "c2")     ; caron 
         BSSendUnicodeChar(0x013D)
      Else If (PriorDeadKey = "a3")    ; cedilla
         BSSendUnicodeChar(0x013B)
      Else 
         sendinput {blind}L
   }      
   else if Ebene = 3
   {
      send [
   }
   PriorDeadKey := ""
return


*r::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x0109)
      Else If (PriorDeadKey = "c2")     ; caron
         BSSendUnicodeChar(0x010D)
      Else If (PriorDeadKey = "a1")      ; akut
         BSSendUnicodeChar(0x0107)
      Else If (PriorDeadKey = "a3")    ; cedilla
         BSSendUnicodeChar(0x00E7)
      Else
         sendinput {blind}c
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")          ; circumflex 
         BSSendUnicodeChar(0x0108)
      Else If (PriorDeadKey = "c2")    ; caron 
         BSSendUnicodeChar(0x010C)
      Else If (PriorDeadKey = "a1")     ; akut 
         BSSendUnicodeChar(0x0106)
      Else If (PriorDeadKey = "a3")   ; cedilla 
         BSSendUnicodeChar(0x00E6)
      Else 
         sendinput {blind}C
   }
   else if Ebene = 3
   {
      send ]
   }
   PriorDeadKey := ""
return

*t::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x0175)
      Else
         sendinput {blind}w
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x0174)
      Else
         sendinput {blind}W
   }
   else if Ebene = 3
      send {^}{space} ; untot
   ;PriorDeadKey := ""
return

*y::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "a3")         ; cedilla
         BSSendUnicodeChar(0x0137)
      Else
         sendinput {blind}k
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "a3")         ; cedilla 
         BSSendUnicodeChar(0x0136)
      Else
         sendinput {blind}K
   }
   else if Ebene = 3
      sendraw !
   PriorDeadKey := ""
return

*u::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x0125)
      Else sendinput {blind}h
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x0124)
      Else sendinput {blind}H
   }
   else if Ebene = 3
         send {blind}<
   PriorDeadKey := ""
return

*i::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x011D)
      Else If (PriorDeadKey = "c3")   ; brevis
         BSSendUnicodeChar(0x011F)
      Else If (PriorDeadKey = "a3")   ; cedilla
         BSSendUnicodeChar(0x0123)
      Else sendinput {blind}g
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x011C)
      Else If (PriorDeadKey = "c3")    ; brevis 
         BSSendUnicodeChar(0x011E)
      Else If (PriorDeadKey = "a3")    ; cedilla 
         BSSendUnicodeChar(0x0122)
      Else sendinput {blind}G
   }
   else if Ebene = 3
         send >
   PriorDeadKey := ""
return

*o::
   EbeneAktualisieren()
   if Ebene = 1
      sendinput {blind}f
   else if Ebene = 2
      sendinput {blind}F
   else if Ebene = 3
   {
      If (PriorDeadKey = "c1")            ; circumflex 
         BSSendUnicodeChar(0x2259)   ; entspricht
      Else If (PriorDeadKey = "t1")       ; tilde 
         BSSendUnicodeChar(0x2245)   ; ungefähr gleich
      Else If (PriorDeadKey = "c2")      ; caron 
         BSSendUnicodeChar(0x225A)   ; EQUIANGULAR TO
      Else
         send `=
   }
   PriorDeadKey := ""
return

*p::
   EbeneAktualisieren()
   if Ebene = 1
      sendinput {blind}q
   else if Ebene = 2
      sendinput {blind}Q
   else if Ebene = 3
      send {&}
   PriorDeadKey := ""
return

*[::
   EbeneAktualisieren()
   if Ebene = 1
      if GetKeyState("CapsLock","T")
         SendUnicodeChar(0x1E9E) ; versal-ß
      else
         send ß
   else if Ebene = 2
      if GetKeyState("CapsLock","T")
         send ß
      else
         SendUnicodeChar(0x1E9E) ; versal-ß
   PriorDeadKey := ""
return


*]::
   EbeneAktualisieren()
   if Ebene = 1
   {
      SendUnicodeChar(0x02DC)    ; tilde, tot 
      PriorDeadKey := "t1"
   }
   else if Ebene = 2
   {
      SendUnicodeChar(0x00AF)  ; macron, tot
      PriorDeadKey := "t2"
   }
   else if Ebene = 3
   {
      SendUnicodeChar(0x00A8)   ; Diaerese
      PriorDeadKey := "t3"
   }
return


/*
   ------------------------------------------------------
   Reihe 3
   ------------------------------------------------------
*/

*a::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x00FB)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00FA)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00F9)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         Send, {bs}ü
      Else If (PriorDeadKey = "c3")    ; brevis
         BSSendUnicodeChar(0x016D)
      Else If (PriorDeadKey = "t2")     ; macron
         BSSendUnicodeChar(0x016B)
      Else If (PriorDeadKey = "t1")      ; tilde
         BSSendUnicodeChar(0x0169)
      Else If (PriorDeadKey = "c2")  ; caron
         BSSendUnicodeChar(0x01D4)
      Else
         sendinput {blind}u
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x00DB)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00DA)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00D9)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         Send, {bs}Ü
      Else If (PriorDeadKey = "c3")    ; brevis
         BSSendUnicodeChar(0x016C)
      Else If (PriorDeadKey = "c2")     ; caron 
         BSSendUnicodeChar(0x01D3)
      Else If (PriorDeadKey = "t2")     ; macron
         BSSendUnicodeChar(0x016A)
      Else If (PriorDeadKey = "t1")      ; tilde
         BSSendUnicodeChar(0x0168)
      Else
         sendinput {blind}U
   }
   else if Ebene = 3
      send \
   PriorDeadKey := ""
return

*s::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x00EE)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00ED)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00EC)
      Else If (PriorDeadKey = "t3")   ; Diaerese
         Send, {bs}ï
      Else If (PriorDeadKey = "t2")    ; macron
         BSSendUnicodeChar(0x012B)
      Else If (PriorDeadKey = "c3")   ; brevis
         BSSendUnicodeChar(0x012D)
      Else If (PriorDeadKey = "t1")     ; tilde
         BSSendUnicodeChar(0x0129)
      Else 
         sendinput {blind}i
   }
   else if Ebene = 2
   {   
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x00CE)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00CD)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00CC)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         Send, {bs}Ï
      Else If (PriorDeadKey = "t2")     ; macron
         BSSendUnicodeChar(0x012A)
      Else If (PriorDeadKey = "c3")    ; brevis 
         BSSendUnicodeChar(0x012C)
      Else If (PriorDeadKey = "t1")      ; tilde
         BSSendUnicodeChar(0x0128)
      Else 
         sendinput {blind}I
   }
   else if Ebene = 3
   {
      send `/
   }
      PriorDeadKey := ""
return

*d::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x00E2)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00E1)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00E0)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         send {bs}ä
      Else If (PriorDeadKey = "t1")      ; tilde
         BSSendUnicodeChar(0x00E3)
      Else If (PriorDeadKey = "t2")     ; macron
         BSSendUnicodeChar(0x0101)
      Else If (PriorDeadKey = "c3")    ; brevis
         BSSendUnicodeChar(0x0103)
      Else
         sendinput {blind}a
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")            ; circumflex
         BSSendUnicodeChar(0x00C2)
      Else If (PriorDeadKey = "a1")       ; akut 
         BSSendUnicodeChar(0x00C1)
      Else If (PriorDeadKey = "a2")      ; grave
         BSSendUnicodeChar(0x00C0)
      Else If (PriorDeadKey = "t3")     ; Diaerese
         send {bs}Ä
      Else If (PriorDeadKey = "t1")       ; tilde
         BSSendUnicodeChar(0x00C3)
      Else If (PriorDeadKey = "t2")      ; macron
         BSSendUnicodeChar(0x0100)
      Else If (PriorDeadKey = "c3")     ; brevis 
         BSSendUnicodeChar(0x0102)
      Else
         sendinput {blind}A
   }
   else if Ebene = 3
   {
      sendraw {
   }
   PriorDeadKey := ""
return

*f::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x00EA)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00E9)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00E8)
      Else If (PriorDeadKey = "t3")   ; Diaerese
         Send, {bs}ë
      Else If (PriorDeadKey = "t2")    ; macron
         BSSendUnicodeChar(0x0113)
      Else If (PriorDeadKey = "c3")   ; brevis
         BSSendUnicodeChar(0x0115)
      Else If (PriorDeadKey = "c2")    ; caron
         BSSendUnicodeChar(0x011B)
      Else
         sendinput {blind}e
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x00CA)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00C9)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00C8)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         Send, {bs}Ë
      Else If (PriorDeadKey = "c2")     ; caron
         BSSendUnicodeChar(0x011A)
      Else If (PriorDeadKey = "t2")     ; macron
         BSSendUnicodeChar(0x0112)
      Else If (PriorDeadKey = "c3")    ; brevis 
         BSSendUnicodeChar(0x0114)
      Else 
         sendinput {blind}E
   }
   else if Ebene = 3
      sendraw }
   PriorDeadKey := ""
return

*g::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x00F4)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00F3)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00F2)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         Send, {bs}ö
      Else If (PriorDeadKey = "t1")      ; tilde
         BSSendUnicodeChar(0x00F5)
      Else If (PriorDeadKey = "t2")     ; macron
         BSSendUnicodeChar(0x014D)
      Else If (PriorDeadKey = "c3")    ; brevis 
         BSSendUnicodeChar(0x014F)
      Else
         sendinput {blind}o
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x00D4)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00D3)
      Else If (PriorDeadKey = "a2")     ; grave
         BSSendUnicodeChar(0x00D2)
      Else If (PriorDeadKey = "t1")      ; tilde
         BSSendUnicodeChar(0x00D5)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         send {bs}Ö
      Else If (PriorDeadKey = "t2")     ; macron 
         BSSendUnicodeChar(0x014C)
      Else If (PriorDeadKey = "c3")    ; brevis 
         BSSendUnicodeChar(0x014E)
      Else
         sendinput {blind}O
   }
   else if Ebene = 3
      send *
   PriorDeadKey := ""
return

*h::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x015D)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x015B)
      Else If (PriorDeadKey = "c2")     ; caron
         BSSendUnicodeChar(0x0161)
      Else If (PriorDeadKey = "a3")    ; cedilla
         BSSendUnicodeChar(0x015F)
      Else   
         sendinput {blind}s
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x015C)
      Else If (PriorDeadKey = "c2")     ; caron
         BSSendUnicodeChar(0x0160)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x015A)
      Else If (PriorDeadKey = "a3")    ; cedilla 
         BSSendUnicodeChar(0x015E)
      Else
         sendinput {blind}S
   }
   else if Ebene = 3
      send ?
   PriorDeadKey := ""
return

*j::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "a1")          ; akut
         BSSendUnicodeChar(0x0144)
      Else If (PriorDeadKey = "t1")     ; tilde
         BSSendUnicodeChar(0x00F1)
      Else If (PriorDeadKey = "c2")    ; caron
         BSSendUnicodeChar(0x0148)
      Else If (PriorDeadKey = "a3")   ; cedilla
         BSSendUnicodeChar(0x0146)
      Else
         sendinput {blind}n
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c2")         ; caron
         BSSendUnicodeChar(0x0147)
      Else If (PriorDeadKey = "t1")     ; tilde
         BSSendUnicodeChar(0x00D1)
      Else If (PriorDeadKey = "a1")     ; akut 
         BSSendUnicodeChar(0x0143)
      Else If (PriorDeadKey = "a3")   ; cedilla 
         BSSendUnicodeChar(0x0145)
      Else
         sendinput {blind}N
   }
   else if Ebene = 3
      send (
   PriorDeadKey := ""
return

*k::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "a1")           ; akut 
         BSSendUnicodeChar(0x0155)
      Else If (PriorDeadKey = "c2")     ; caron
         BSSendUnicodeChar(0x0159)
      Else If (PriorDeadKey = "a3")    ; cedilla
         BSSendUnicodeChar(0x0157)
      Else 
         sendinput {blind}r
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c2")          ; caron
         BSSendUnicodeChar(0x0158)
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x0154)
      Else If (PriorDeadKey = "a3")    ; cedilla 
         BSSendUnicodeChar(0x0156)
      Else 
         sendinput {blind}R
   }
   else if Ebene = 3
      send )
   PriorDeadKey := ""
return

*l::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c2")          ; caron 
         BSSendUnicodeChar(0x0165)
      Else If (PriorDeadKey = "a3")    ; cedilla
         BSSendUnicodeChar(0x0163)
      Else 
         sendinput {blind}t
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c2")          ; caron
         BSSendUnicodeChar(0x0164)
      Else If (PriorDeadKey = "a3")    ; cedilla 
         BSSendUnicodeChar(0x0162)
      Else 
         sendinput {blind}T
   }
   else if Ebene = 3
      send {blind}- ; Bind
   PriorDeadKey := ""
return

*;::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c2")     ; caron
         BSSendUnicodeChar(0x010F)
      Else 
         sendinput {blind}d
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c2")     ; caron 
         BSSendUnicodeChar(0x010E)
      Else sendinput {blind}D
   }
   else if Ebene = 3
      send :
   PriorDeadKey := ""
return

*'::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "t3")       ; Diaerese
         Send {bs}ÿ
      Else If (PriorDeadKey = "a1")      ; akut 
         BSSendUnicodeChar(0x00FD)
      Else If (PriorDeadKey = "c1")    ; circumflex
         BSSendUnicodeChar(0x0177)
      Else
         sendinput {blind}y
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "a1")           ; akut 
         BSSendUnicodeChar(0x00DD)
      Else If (PriorDeadKey = "t3")    ; Diaerese
         Send {bs}Ÿ
      Else If (PriorDeadKey = "c1")      ; circumflex
         BSSendUnicodeChar(0x0176)
      Else
         sendinput {blind}Y
   }
   else if Ebene = 3
      send @
   PriorDeadKey := ""
return

;SC02B (#) wird zu Mod3


/*
   ------------------------------------------------------
   Reihe 4
   ------------------------------------------------------
*/



*<::
   EbeneAktualisieren()
   if Ebene = 1
      send ¡
   else if Ebene = 2
      send ¿
   PriorDeadKey := ""
return
      

*z::
   EbeneAktualisieren()
   if Ebene = 1
      sendinput {blind}{U+00fc}
   else if Ebene = 2
      sendinput {blind}{U+00dc}
   else if Ebene = 3
      send {blind}{#}
   PriorDeadKey := ""
return

*x::
   EbeneAktualisieren()
   if Ebene = 1
      sendinput {blind}{U+00f6}
   else if Ebene = 2
      sendinput {blind}{U+00d6}
   else if Ebene = 3
      send $
   PriorDeadKey := ""
return

*c::
   EbeneAktualisieren()
   if Ebene = 1
      Sendinput {blind}{U+00e4}
   else if Ebene = 2
      sendinput {blind}{U+00c4}
   else if Ebene = 3
      send |
   PriorDeadKey := ""
return

*v::
   EbeneAktualisieren()
   if Ebene = 1
         sendinput {blind}p
   else if Ebene = 2
         sendinput {blind}P
   else if Ebene = 3
   {
      If (PriorDeadKey = "t1")    ; tilde
         BSSendUnicodeChar(0x2248)
      Else
         sendraw ~
   }      
   PriorDeadKey := ""
return

*b::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c2")         ; caron
         BSSendUnicodeChar(0x017E)
      Else If (PriorDeadKey = "a1")     ; akut
         BSSendUnicodeChar(0x017A)
      Else 
         sendinput {blind}z
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c2")         ; caron  
         BSSendUnicodeChar(0x017D)
      Else If (PriorDeadKey = "a1")     ; akut 
         BSSendUnicodeChar(0x0179)
      Else
         sendinput {blind}Z
   }
   PriorDeadKey := ""
return

*n::
   EbeneAktualisieren()
   if Ebene = 1
         sendinput {blind}b
   else if Ebene = 2
         sendinput {blind}B
   else if Ebene = 3
      send {blind}{+}
   PriorDeadKey := ""
return

*m::
   EbeneAktualisieren()
   if Ebene = 1
         sendinput {blind}m
   else if Ebene = 2
         sendinput {blind}M
   else if Ebene = 3
      send `%
   PriorDeadKey := ""
return

*,::
   EbeneAktualisieren()
   if Ebene = 1
      send {blind},
   else if Ebene = 2
      send ``{space} ; untot
   else if Ebene = 3
      send "
   PriorDeadKey := ""
return

*.::
   EbeneAktualisieren()
   if Ebene = 1
      send {blind}.
   else if Ebene = 2
      SendUnicodeChar(0x2026)  ; ellipse
   else if Ebene = 3
      send '
   PriorDeadKey := ""
return


*/::
   EbeneAktualisieren()
   if Ebene = 1
   {
      If (PriorDeadKey = "c1")           ; circumflex
         BSSendUnicodeChar(0x0135)
      Else If (PriorDeadKey = "c2")      ; caron
         BSSendUnicodeChar(0x01F0)
      Else
         sendinput {blind}j
   }
   else if Ebene = 2
   {
      If (PriorDeadKey = "c1")            ; circumflex
         BSSendUnicodeChar(0x0134)
      Else
         sendinput {blind}J
   }
   else if Ebene = 3
      send `;
   PriorDeadKey := ""
return

/*
   ------------------------------------------------------
   Numpad
   ------------------------------------------------------

   folgende Tasten verhalten sich bei ein- und ausgeschaltetem
   NumLock gleich:
*/

*NumpadDiv::
   EbeneAktualisieren()
   if ( (Ebene = 1) or (Ebene = 2) )
      send {NumpadDiv}
   else if Ebene = 3
      send ÷
   PriorDeadKey := ""
return

*NumpadMult::
   EbeneAktualisieren()
   if ( (Ebene = 1) or (Ebene = 2) )
      send {NumpadMult}
   else if Ebene = 3
      send ×
   PriorDeadKey := ""
return

*NumpadSub::
   EbeneAktualisieren()
   if ( (Ebene = 1) or (Ebene = 2) )
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x207B)
      Else
         send {blind}{NumpadSub}
   }
   else if Ebene = 3
      SendUnicodeChar(0x2212) ; echtes minus
   PriorDeadKey := ""
return

*NumpadAdd::
   EbeneAktualisieren()
   if ( (Ebene = 1) or (Ebene = 2) )
   {
      If (PriorDeadKey = "c1")          ; circumflex
         BSSendUnicodeChar(0x207A)
      Else
         send {blind}{NumpadAdd}
   }
   else if Ebene = 3
      send ±
   PriorDeadKey := ""
return

*NumpadEnter::
   EbeneAktualisieren()
   if ( (Ebene = 1) or (Ebene = 2) )
      send {NumpadEnter}      
   else if Ebene = 3
      SendUnicodeChar(0x2260) ; neq
   PriorDeadKey := ""
return

/*
   folgende Tasten verhalten sich bei ein- und ausgeschaltetem NumLock
   unterschiedlich:

   bei NumLock ein
*/



*Numpad7::
   EbeneAktualisieren()
   if Ebene = 1
      send {blind}{Numpad7}
   else if Ebene = 2
      send {NumpadHome}
   PriorDeadKey := ""
return

*Numpad8::
   EbeneAktualisieren()
   if Ebene = 1
         send {blind}{Numpad8}
   else if Ebene = 2
      send {NumpadUp}
   else if Ebene = 3
      SendUnicodeChar(0x2191)     ; uparrow
   PriorDeadKey := ""
return

*Numpad9::
   EbeneAktualisieren()
   if Ebene = 1
      send {blind}{Numpad9}
   else if Ebene = 2
      send {NumpadPgUp}
   PriorDeadKey := ""
return



*Numpad4::
   EbeneAktualisieren()
   if Ebene = 1
         send {blind}{Numpad4}
   else if Ebene = 2
      send {NumpadLeft}
   else if Ebene = 3
      SendUnicodeChar(0x2190)     ; leftarrow
   PriorDeadKey := ""
return

*Numpad5::
   EbeneAktualisieren()
   if Ebene = 1
         send {blind}{Numpad5}
   else if Ebene = 2
      send {NumpadClear}
   else if Ebene = 3
      send †
   PriorDeadKey := ""
return

*Numpad6::
   EbeneAktualisieren()
   if Ebene = 1
         send {blind}{Numpad6}
   else if Ebene = 2
      send {NumpadRight}
   else if Ebene = 3
      SendUnicodeChar(0x2192)     ; rightarrow
   PriorDeadKey := ""
return

*Numpad1::
   EbeneAktualisieren()
   if Ebene = 1
      send {blind}{Numpad1}
   else if Ebene = 2
      send {NumpadEnd}
   else if Ebene = 3
      SendUnicodeChar(0x21CB) ; LEFTWARDS HARPOON OVER RIGHTWARDS HARPOON
   PriorDeadKey := ""
return

*Numpad2::
   EbeneAktualisieren()
   if Ebene = 1
         send {blind}{Numpad2}
   else if Ebene = 2
      send {NumpadDown}
   else if Ebene = 3
      SendUnicodeChar(0x2193)     ; downarrow
   PriorDeadKey := ""
return

*Numpad3::
   EbeneAktualisieren()
   if Ebene = 1
         send {blind}{Numpad3}
   else if Ebene = 2
      send {NumpadPgDn}
   else if Ebene = 3
      SendUnicodeChar(0x21CC) ; RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON
   PriorDeadKey := ""
return

*Numpad0::
   EbeneAktualisieren()
   if Ebene = 1
      send {blind}{Numpad0}
   else if Ebene = 2
      send {NumpadIns}
   else if Ebene = 3
      send `%
   PriorDeadKey := ""
return

*NumpadDot::
   EbeneAktualisieren()
   if Ebene = 1
      send .
   else if Ebene = 2
      send {NumpadDel}
   else if Ebene = 3
      send {blind},
   PriorDeadKey := ""
return

/*
   bei NumLock aus
*/

*NumpadHome::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadHome}
   else if Ebene = 2
      send {Numpad7}
   PriorDeadKey := ""
return

*NumpadUp::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadUp}
   else if Ebene = 2
         send {Numpad8}
   else if Ebene = 3
      SendUnicodeChar(0x2191)     ; uparrow
   PriorDeadKey := ""
return

*NumpadPgUp::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadPgUp}
   else if Ebene = 2
      send {Numpad9}
   PriorDeadKey := ""
return

*NumpadLeft::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadLeft}
   else if Ebene = 2
         send {Numpad4}
   else if Ebene = 3
      SendUnicodeChar(0x2190)     ; leftarrow
   PriorDeadKey := ""
return

*NumpadClear::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadClear}
   else if Ebene = 2
         send {Numpad5}
   else if Ebene = 3
      send †
   PriorDeadKey := ""
return

*NumpadRight::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadRight}
   else if Ebene = 2
         send {Numpad6}
   else if Ebene = 3
      SendUnicodeChar(0x2192)     ; rightarrow
   PriorDeadKey := ""
return

*NumpadEnd::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadEnd}
   else if Ebene = 2
      send {Numpad1}
   else if Ebene = 3
      SendUnicodeChar(0x21CB) ; LEFTWARDS HARPOON OVER RIGHTWARDS HARPOON
   PriorDeadKey := ""
return

*NumpadDown::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadDown}
   else if Ebene = 2
      send {Numpad2}
   else if Ebene = 3
      SendUnicodeChar(0x2193)     ; downarrow
   PriorDeadKey := ""
return

*NumpadPgDn::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadPgDn}
   else if Ebene = 2
      send {Numpad3}
   else if Ebene = 3
      SendUnicodeChar(0x21CC) ; RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON   
   PriorDeadKey := ""
return

*NumpadIns::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadIns}
   else if Ebene = 2
      send {Numpad0}
   else if Ebene = 3
      send `%
   PriorDeadKey := ""
return

*NumpadDel::
   EbeneAktualisieren()
   if Ebene = 1
      send {NumpadDel}
   else if Ebene = 2
      send {NumpadDot}
   else if Ebene = 3
      send .
   PriorDeadKey := ""
return


/*
   ------------------------------------------------------
   Sondertasten
   ------------------------------------------------------
*/

*Space::
   EbeneAktualisieren()
   if Ebene = 1
      Send {blind}{Space}
   if  Ebene  =  2
      Send  {blind}{Space}
   if Ebene = 3
      Send {blind}{Space}
   PriorDeadKey := ""
return

/*
   ------------------------------------------------------
   Funktionen
   ------------------------------------------------------
*/

EbeneAktualisieren()
{
   global
   Ebene = 1

   ; ist Shift down?
   if ( GetKeyState("Shift","P") )
   {
      Ebene = 2
   }
   ; ist Mod3 down?
   if ( GetKeyState("CapsLock","P") or GetKeyState("\","P") )
   {
      Ebene = 3
   }
}

SendUnicodeChar(charCode)
{
   VarSetCapacity(ki, 28 * 2, 0)

   EncodeInteger(&ki + 0, 1)
   EncodeInteger(&ki + 6, charCode)
   EncodeInteger(&ki + 8, 4)
   EncodeInteger(&ki +28, 1)
   EncodeInteger(&ki +34, charCode)
   EncodeInteger(&ki +36, 4|2)

   DllCall("SendInput", "UInt", 2, "UInt", &ki, "Int", 28)
}

BSSendUnicodeChar(charCode)
{
   send {bs}
   VarSetCapacity(ki, 28 * 2, 0)

   EncodeInteger(&ki + 0, 1)
   EncodeInteger(&ki + 6, charCode)
   EncodeInteger(&ki + 8, 4)
   EncodeInteger(&ki +28, 1)
   EncodeInteger(&ki +34, charCode)
   EncodeInteger(&ki +36, 4|2)

   DllCall("SendInput", "UInt", 2, "UInt", &ki, "Int", 28)
}

EncodeInteger(ref, val)
{
   DllCall("ntdll\RtlFillMemoryUlong", "Uint", ref, "Uint", 4, "Uint", val)
}


/*
   ------------------------------------------------------
   Shift+Pause "pausiert" das Script.
   ------------------------------------------------------
*/

+pause::suspend
