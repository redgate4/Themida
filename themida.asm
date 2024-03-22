; **************************************************************************** 
; Module: Example.asm
; Description: Example program that shows the use of the SecureEngine macros
;              in assembly language
;
; Author/s: Rafael Ahucha 
; (c) 2004 Oreans Technologies
; **************************************************************************** 

.586
.model flat,stdcall
option casemap:none


; **************************************************************************** 
;                   Libraries used in this module
; **************************************************************************** 

include ..\..\..\Include\Assembly\ThemidaSDK_masm.inc
include ..\..\..\Include\Assembly\SecureEngineCustomVMs_masm32.inc

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib


; **************************************************************************** 
;                               Macros definition 
; **************************************************************************** 

literal MACRO quoted_text:VARARG

    LOCAL local_text

    .data
      local_text db quoted_text,0

    .code
    EXITM <local_text>

ENDM

SADD MACRO quoted_text:VARARG

    EXITM <ADDR literal(quoted_text)>

ENDM    


; **************************************************************************** 
;                                 Constants 
; **************************************************************************** 

.const


; **************************************************************************** 
;                                Global data
; **************************************************************************** 

.data


; **************************************************************************** 
;                                Code section
; **************************************************************************** 

.code

Start:

    invoke  MessageBox, NULL, SADD("The following example will show the use of the", 10, 13, "different SecureEngine Macros")\
                      , SADD("Themida SDK example"), MB_OK
  

    ; show a MessageBox inside an ENCODE macro
    
    ENCODE_START

    invoke  MessageBox, NULL, SADD("We are showing this message inside an ENCODE macro"), SADD("Themida SDK example"), MB_OK

    ENCODE_END

    invoke  MessageBox, NULL, SADD("ENCODE macro executed OK!"), SADD("Themida SDK example"), MB_OK

    ; show a MessageBox inside a CLEAR macro

    CLEAR_START 

    invoke  MessageBox, NULL, SADD("We are showing this message inside a CLEAR macro"), SADD("Themida SDK example"), MB_OK

    CLEAR_END 

    invoke  MessageBox, NULL, SADD("CLEAR macro executed OK!"), SADD("Themida SDK example"), MB_OK

    ; The following CODEREPLACE macro will be executed 10 times inside a loop

    mov     ecx, 10

    .while ecx

        VM_TIGER_WHITE_START 

        mov     eax, ebx
        xor     eax, ecx
        add     eax, edx
        push    eax
        pop     ebx
        xchg    eax, esi

        VM_TIGER_WHITE_END

        dec     ecx

    .endw    

    invoke  MessageBox, NULL, SADD("A CodeReplace macro was successfully executed 10 times"), SADD("Themida SDK example"), MB_OK

    invoke  ExitProcess, 0
    
end Start
