;
; ------------------------------------------------------------
;
;   PureBasic - Themida macros example file
;
;    (c) 2006 - Oreans Technologies
;
; ------------------------------------------------------------
;

XIncludeFile "ThemidaSDK.pbi"
 

!ENCODE_START 

MessageRequester("Encode Macro", "Hello, I'm an ENCODE macro!", 0)

!ENCODE_END 


!VM_START 

MessageRequester("VM Macro", "Hello, I'm a VM macro!", 0)

!VM_END  

!CODEREPLACE_START 

MessageRequester("CodeReplace Macro", "Hello, I'm a CODEREPLACE macro!", 0)

!CODEREPLACE_END  

; IDE Options = PureBasic v4.00 (Windows - x86) (Demo)
; CursorPosition = 11
; FirstLine = 6
; Folding = -
; Executable = C:\Documents and Settings\rahucha\Desktop\Example.exe