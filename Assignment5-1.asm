; Program 5.1
; Conditional Jump - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc ; initialize exit process for later

.data ; allows us to declare variables
temp1 QWORD 0 ; defines a variable to keep track of the previous fibonacci number for addition purpose
temp2 QWORD 1 ; defines a variable to keep track of the current fibonacci number for addition purpose
tempTotal QWORD 1 ; defines a variable to keep track of the current fibonacci number for general use
sum QWORD 0 ; defines a variable to keep track of the total sum and sets it to 0

.code ; marks the begining of my code section
_main3 PROC ; the entry point to my program

fib: ; marks the start of the loop to calculate each fibonacci number
mov rax, tempTotal ; move the current fibonacci number we are looking at into rax
and rax, 1 ; use the and operator to figure out if the number is even

cmp al, 1 ; check if the flag has been set to 1 meaning the number is odd
jne evenNumber ; if it isn't odd, skip the 3 lines of code that add our number to the sum

mov rax, sum ; move our current sum to rax so we can perform addition on it
add rax, tempTotal ; add the current fibonacci number to the sum 
mov sum, rax ; store the result in the sum variable

evenNumber: ; marks where to continue if the number was even

mov rax, tempTotal ; moves the current fibonacci number into rax to perform addition
add rax, temp1 ; add the previous fibonacci to the current one to get the next fibonacci number
mov rdx, temp2 ; take the variable storing our current fibonacci number and move it to rdx
mov temp1, rdx ; from rdx we can move it to temp1 so the old current number becomes the previous number for later addition
mov temp2, rax ; store away our new current number in temp 2
mov tempTotal, rax ; keep track of what our current fibonacci number is in the tempTotal variable

cmp rax, 1000000 ; check if the current fibonacci number is above 1000000
jg done ; if it is than jump to out of the loop

jmp fib ; if not then jump to the top of the loop and repeat

done: ; marks where to jump out of the loop
xor rcx, rcx ; clears the rcx register in order to return 0
call ExitProcess ; calls the ExitProccess function so the OS will do the proper cleanup
_main3 ENDP ; marks the end point of my _main segment

END ; marks the end of the program