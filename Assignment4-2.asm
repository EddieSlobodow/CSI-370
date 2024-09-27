; Program 4.2
; Multiplication and Division - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc ; initialize exit process for later

.data ; allows us to declare variables
pointsScored dd ? ; declare a variable for the student's total points scored
totalPoints dd ? ; declare a variable for the total points available
finalGrade dd ? ; declare a variable for the final grade we are trying to calculate

.code ; marks the begining of my code section
_main PROC ; the entry point to my program


; addition
mov eax, 0  ; clearing the eax register for addition
add eax, 25 ; add the first assignment's points achieved
add eax, 89 ; add the second assignment's points achieved
add eax, 49 ; add the third assignment's points achieved
add eax, 80 ; add the fourth assignment's points achieved
mov pointsScored, eax ; move the sum into a variable for me to use later

mov eax, 0 ; clearing the eax register for addition
add eax, 30 ; add the first assignment's points achieved
add eax, 100 ; add the second assignment's points achieved
add eax, 50 ; add the third assignment's points achieved
add eax, 150 ; add the fourth assignment's points achieved
mov totalPoints, eax ; move the sum into a variable for me to use later

; multiplication
mov eax, pointsScored ; load in the total points achieved to be multiplied
mov ebx, 100 ; load in 100 to be a multiplier so I can get a percentage without the need of floating point numbers
mul ebx ; performs the multiplication and the product gets stored in eax

; division
mov edx, 0 ; clear the edx register
mov ecx, totalPoints ; move the divisor into the proper register
div ecx ; divide eax with ecx, eax already contains the dividend I want from earlier
mov finalGrade, eax ; move the final grade we've calculated into a variable
; it is worth noting that our final result is being rounded down because the remainder is being ignored

call ExitProcess ; calls the ExitProccess function so the OS will do the proper cleanup
_main ENDP ; marks the end point of my _main segment

END ; marks the end of the program