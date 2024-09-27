; Program 3.4
; I decided to do problem 3.4 because I couldn't figure out how to get gas or nasm to run on my machine so I am using masm
; I'm also somewhat confused on what "The values for your data (A, B, C, D)" must be stored in registers, not variables"
; To me this means I should just enter them in as literals but I feel like I may be missing something

extrn ExitProcess : proc ; initialize exit process for later

.data ; allows us to declare variables
answer dd ? ; declare a blank variable for me to put the answer in later
answerString db "The answer is: ", 0 ; Declaring an answer message I could output later, 
; I use 0 to mark the end of the array, db is used because a char is 8 bits


.code ; marks the begining of my code section
_main2 PROC ; the entry point to my program

; The variables I decided to use for this problem:  A=15 B=20 C=7 D=14
mov eax, 0 ; clear the eax register for addition
add eax, 7 ; add my C variable to the register
add eax, 14 ; add my D variable to the register with C
mov edx, eax ; put (C + D) in some other register of the same bit size to be used later
mov eax, 0 ; clear the eax register for addition
add eax, 15 ; add my A variable to the register
add eax, 20 ; add my B variable to the register with A
sub eax, edx ; take the (A+B) I have in eax and subtract it with (C + D) I put in edx earlier
mov answer, eax ; take my final result and put it in memory with my answer variable I declared earlier

xor ecx, ecx ; clear ecx register so that exit code is 0
call ExitProcess ; calls the ExitProccess function so the OS will do the proper cleanup
_main2 ENDP ; marks the end point of my _main segment

END ; marks the end of the program