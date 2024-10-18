; Program 7.2
; SCAS - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
src BYTE "I DON'T KNOW WHAT WE'RE YELLING ABOUT!",0
lenSrc EQU ($ - src)
asciiLowerBound DWORD 65
asciiUpperBound DWORD 90
newString BYTE 38 DUP(?)

.code
_main PROC

; load in each of the strings for the rep
lea rsi, src     
lea rdi, newString 

mov rcx, lenSrc
rep movsb ; copy src over to newString

mov rsi, OFFSET newString

iterateLoop:
mov al, byte ptr [rsi]
test al, al
jz done
    
; check if the current char is between 65 and 90 meaning it is a letter
movzx eax, al ;movzx to convert al to 32 bits
mov ebx, asciiLowerBound
cmp eax, ebx
jl notLetter

mov ebx, asciiUpperBound 
cmp eax, ebx 
jg notLetter

add al, 32 ; converrt to lowercase

notLetter:
mov byte ptr [rsi], al ; modify the string
inc rsi          
jmp iterateLoop

done:
xor rcx, rcx
call ExitProcess
_main ENDP

END