    ;===============================================;
    ;       Project TIC TAC TOE                    |;
    ;   This program is an electronic version to   |;
    ;   the well known game TIC TAC TOE.           |;
    ;   Develop And Programmed by Moshe ****.      |;          
    ;   Version 1.6 2.6.2019                       |;
    ;===============================================;
data segment
gameLogo db 26 dup(' '),"WELCOME TO TIC TAC TOE!!!!",10,13,13
         db 26 dup(' ')," x     x        /  oooooo ",10,13,13
         db 26 dup(' '),"  x   x        /  o      o",10,13,13
         db 26 dup(' '),"   x x        /   o      o",10,13,13
         db 26 dup(' '),"    x        /    o      o",10,13,13
         db 26 dup(' '),"   x x      /     o      o",10,13,13
         db 26 dup(' '),"  x   x    /      o      o",10,13,13
         db 26 dup(' ')," x     x  /        oooooo ",'$'


gameExplain         db ,10,10,13,"Instructions:  ",10,13
                    db "1) In each Turn, the player will input a number between 1 to 9 by the keyboard,",10,13,13
                    db "To choose his cell on the grid.",10,13
                    db "2) If the player type incorrect character or cell that already",10,13
                    db "has been chose, the game will ask the player to type again.",10,13,13
                    db "3) The player plays vs each other. Or vs the Computer.",10,13,13
                    db "4) The X simbol will get first Turn.",10,13,13
                    db "5) If each player complete his symbol in a row, horizontal",10,13
                    db "vertical, or diagonal, he wins. if no one did it, it's a draw.",10,13,13
                    db "6) At the ende of the game, the players will be asks, if they ",10,13,13
                    db "want to play again or exit the game.",'$',10,13,13

keyPress db ,10,10,13,13,4 dup(' '),"Press 0 to play 2 Players, And press 1 for playing vs the computer: ",'$'

Turn  db 1     ; 1 = XPlayer = x
               ; 2 = OPlayer = o
               
TurnNum db 0

Table   db 0,0,0       ; 0 = Empty
        db 0,0,0       ; 1 = XPlayer = x
        db 0,0,0       ; 2 = OPlayer = o;
            
Win   db 0     ;0 = still playing
               ;1 = X wins
               ;2 = O wins


gameChart   db 10,10,10,10,13,13
            db 12 dup(' '),"   1 |  222|33333",10,13,13
            db 12 dup(' '),"  11 | 2  2|    3",10,13,13
            db 12 dup(' ')," 1 1 |   2 | 3333",10,13,13
            db 12 dup(' '),"   1 |  2  |    3",10,13,13
            db 12 dup(' '),"   1 | 2222|33333",10,13,13
            db 12 dup(' '),"-----+-----+-----",10,13,13
            db 12 dup(' '),"4   4|55555|66666",10,13,13
            db 12 dup(' '),"4   4|5    |6    ",10,13,13
            db 12 dup(' '),"44444|55555|66666",10,13,13
            db 12 dup(' '),"    4|    5|6   6",10,13,13
            db 12 dup(' '),"    4|55555|66666",10,13,13
            db 12 dup(' '),"-----+-----+-----",10,13,13
            db 12 dup(' '),"77777|88888|99999",10,13,13
            db 12 dup(' '),"   7 |8   8|9   9",10,13,13
            db 12 dup(' '),"  7  |88888|99999",10,13,13
            db 12 dup(' ')," 7   |8   8|    9",10,13,13
            db 12 dup(' '),"7    |88888|    9",'$'


xSimbol db 'X   X','$'
        db ' X X ','$'
        db '  X  ','$'
        db ' X X ','$'
        db 'X   X','$'

oSimbol db " OOO ",'$'
        db "O   O",'$'
        db "O   O",'$'
        db "O   O",'$'
        db " OOO ",'$'


xTurn db "This is X Turn.$"

chooseKey db "Choose any number between 1 - 9.$"

oTurn db "This is O Turn.$"

ChooseN db "You choose the number: ",'$'

wrongInput db "Please choose valied number.$"

cellFull db "Please choose another cell.$"

XWin db 10,10,13,13
     db 22 dup(' '),"X   X    W           W III N    N  SSSS ",10,13,13
     db 22 dup(' ')," X X      W         W   I  NN   N S     ",10,13,13
     db 22 dup(' '),"  X        W   W   W    I  N N  N  SSS  ",10,13,13
     db 22 dup(' ')," X X        W W W W     I  N  N N     S ",10,13,13
     db 22 dup(' '),"X   X        W   W     III N   NN SSSS  ",'$'
     
OWin db 10,10,13,13
     db 22 dup(' ')," OOOO    W           W III N    N  SSSS ",10,13,13
     db 22 dup(' '),"O    O    W         W   I  NN   N S     ",10,13,13
     db 22 dup(' '),"O    O     W   W   W    I  N N  N  SSS  ",10,13,13
     db 22 dup(' '),"O    O      W W W W     I  N  N N     S ",10,13,13
     db 22 dup(' ')," OOOO        W   W     III N   NN SSSS  ",'$' 
     
Draw db 10,10,13,13    
     db 22 dup(' '),"DDDD   RRRR       A   W           W ",10,13,13
     db 22 dup(' '),"D   D  R   R     A A   W         W  ",10,13,13
     db 22 dup(' '),"D   D  RRRR     A   A   W   W   W   ",10,13,13
     db 22 dup(' '),"D   D  R   R   AAAAAAA   W W W W    ",10,13,13
     db 22 dup(' '),"DDDD   R    R A       A   W   W     ",'$'
              
InputNumber dw 0

ReapetOrExit    db 10,10,10,13,13
                db 22 dup(' '),"Type R to restart, Or type E to exit.",'$'; 

chartRow db 12
chartCol db 4 

MachineChoise db -1  




P1Color db 0ch

P2Color db 0bh


isRobot db 0  

ends


stack segment
dw   128  dup(0)
ends



code segment
start:
        mov ax, data
        mov ds, ax
        mov es, ax

        mov al, 0               ; amount of rows (0=clear all screen)
        mov bh, 0Fh             ; black background (0) font color white (F)
        mov ch, 0               ; ch-row (up,left)
        mov cl, 0               ; cl-col (up,left)
        mov dh, 24              ; dh-row (down,right)
        mov dl, 79              ; dl-col (down,right)
        mov ah, 6
        int 10h                 ; paint screen.
        
        push OFFSET GameLogo
        
        push OFFSET GameExplain
        
        push OFFSET keyPress
        
        call StartScreen
ChooseRo:        
        mov ah, 7
        int 21h                 ;Wait for Choose.
        sub al,30h  
        
        
        cmp al,0
        jne Con
        mov isRobot,al
        jmp Clean
Con:     
        cmp al,1
        jne ChooseRo
        mov isRobot,al

Clean:   
        xor ax,ax        
        xor bx,bx               ; Clean Registers.
        mov cx, 9
LoopTable:
        mov Table[bx], 0        ; reset Table[bx]
        inc bx

        loop LoopTable

        mov Win, 0
        mov Turn, 1
        mov TurnNum,0           ; reset all variables.
        
        call CleanScreen
        
        push OFFSET gameChart
        
        call GameScreen
        
        push OFFSET isRobot       
        
        push OFFSET Turn          
        
        push OFFSET P1Color       
                       
        push OFFSET P2Color               
                       
        push OFFSET XTurn         
        
        push OFFSET ChooseKey     
        
        push OFFSET OTurn        
                              
        call DrawTurn
ChooseAgain:
        cmp Win, 0
    
        jne Finish 
        
        push OFFSET TurnNum       
        
        push OFFSET MachineChoise 
        
        push OFFSET cellFull   
        
        push OFFSET ChooseN    
        
        push OFFSET wrongInput 
        
        push OFFSET Turn        
        
        push OFFSET isRobot     
        
        push OFFSET Table       
        
        push OFFSET P2Color            
        
        push OFFSET InputNumber 
        
        call GetInput
        
        push OFFSET InputNumber
        
        push OFFSET Turn
        
        push OFFSET TurnNum
        
        push OFFSET P2Color
        
        push OFFSET oSimbol
        
        push OFFSET P1Color
        
        push OFFSET xSimbol
        
        call DrawGame

        push OFFSET isRobot       
        
        push OFFSET Turn          
        
        push OFFSET P1Color       
                       
        push OFFSET P2Color               
                       
        push OFFSET XTurn         
        
        push OFFSET ChooseKey     
        
        push OFFSET OTurn        
        
        call DrawTurn
        
        cmp TurnNum, 9
        je Check                ; In a case Of Draw.
        
        cmp TurnNum, 5
        jl ChooseAgain          ; Is able to Win.
        
        
        push OFFSET Table       
        
        push OFFSET Turn        
        
        push OFFSET Win         
        
        call CheckWin
        
         
        cmp Win,0
        je ChooseAgain          ; Is Someone had Win.
Check:
        call CheckWin        

Finish:  

        call CleanScreen  
                
        push OFFSET Win             ;10
        
        push OFFSET Draw            ;8
        
        push OFFSET XWin            ;6
        
        push OFFSET OWin            ;4
        
        push OFFSET ReapetOrExit    ;2
        
        call FinishGame
        
repeat: 
        mov ah,7
        int 21h
        
        
        cmp al,'r'
        je Clean
        cmp al,'R'                ;Restart the game.
        je Clean

        cmp al,'E'
        je GoodBye
        cmp al,'e'                ;Exit The Game.
        jne repeat
        
GoodBye:        
        mov ax, 4c00h             ; exit to operating system.
        int 21h




;"The Ends to All Things Is Death.";
ends ;------------------------------------------------------------------------------------------;

    ;==========================================
    ;   This procedure gets the title of the game
    ;   and its instruction by the stack. 
    ;   The procedure prints the start screen
    ;==========================================


StartScreen PROC NEAR 
    mov bp,sp
        push ax                 ; Store registers.
        push bx
        push cx
        push dx
        

        mov dx, WORD PTR [bp] + 6
        mov ah, 9 
        int 21h                 ; Prints game logo.

        mov dx, WORD PTR [bp] + 4
        mov ah, 9
        int 21h                 ; Prints game Instructions.

        mov dx, WORD PTR [bp] + 2
        mov ah, 9
        int 21h                 ; Prints game choose.

        pop dx
        pop cx
        pop bx
        pop ax                  ; Restore registers.
        
        ret 6
        StartScreen ENDP

    
    
    ;===============================================
    ;   This procedure don't get any parameters                
    ;   The procedure reseting the screen
    ;=============================================== 

CleanScreen PROC NEAR
        push ax                 ; store registers
        push bx
        push cx
        push dx


        mov al, 0               ; amount of rows (0=clear all screen)
        mov bh, 00h             ; black background (0) font color black (0)
        mov ch, 0               ; ch-row (up,left)
        mov cl, 0               ; cl-col (up,left)
        mov dh, 24              ; dh-row (down,right)
        mov dl, 79              ; dl-col (down,right)
        mov ah, 6
        int 10h                 ; clear the screen

        mov bh, 0               ; page number
        mov dh, 0               ; row
        mov dl, 0               ; col
        mov ah, 2
        int 10h                 ; Moving the cursor to (Row,Col)

        pop dx                  ; restore registers
        pop cx
        pop bx
        pop ax

        ret
        CleanScreen ENDP
    
    
    
    ;==========================================
    ;   This procedure get the chart of the game
    ;   by the stack.
    ;   The procedure prints the game screen.
    ;==========================================

GameScreen Proc NEAR
    mov bp, sp
        push ax                 ; store registers
        push bx
        push cx
        push dx

        mov al, 17              ; amount of rows
        mov bh, 0Ah             ; black background (0) font color light green (A)
        mov ch, 4               ; ch-row (upper,left)
        mov cl, 10              ; cl-col (upper,left)
        mov dh, 20              ; dh-row (bottom,right)
        mov dl, 28              ; dl-col (bottom,right)
        mov ah, 6
        int 10h                 ; clean the screen

        mov dx, WORD PTR [bp] + 2
        mov ah, 9
        int 21h


        mov ch, 6
        mov cl, 7
        mov ah, 1
        int 10h

        pop dx                   ; restore registers
        pop cx
        pop bx
        pop ax

        ret 2
        GameScreen ENDP


    ;==========================================
    ;   This procedure gets the chose of the player,
    ;   by keyboard. 
    ;   And uses the followin vars:
    ;   1. Table.
    ;   2. Turn.
    ;   3. isRobot.
    ;   4. P1Color AND P2Color.
    ;   5. Wrong Massage.
    ;   6. Input number.
    ;   7. ChooeN
    ;   8. TurnNums 
    ;   9. MachineChoise
    ;   The procedure store the choise of the player.
    ;==========================================

GetInput Proc NEAR       
    mov bp,sp
        pusha
        
        
        mov si,[bp + 10]         ; Turn of the game.
        

        
        cmp [si],2
        jne Again
        
        mov bx,[bp + 8]          ; Do you play vs AI or Second player.
        cmp [bx],1
        je OsetAI
        
        
Again:
        mov ah, 7
        int 21h

        cmp al, '1'             ; check: if the number<1 go to wrong
        jl  wrong
        
        cmp al, '9'             ; check: if the number>9 go to wrong
        jg  wrong

        xor bh, bh              ; clean bh

        mov bl, al              ; the number --> bl

        and bl, 0Fh             ; transforming the number from '?' to ?

        dec bl                  ; the number-1 because array (Table) is from 0 to 8
        
        
        mov di,[bp + 6]          ; The table of the game.       
        
        cmp [di][bx], 0        ; check: if the cell is clear go to yes
        jne wrongCell

AllFine:
        cmp [si], 1            ; Which player should play now.
        jne OSet

        mov [di][bx], 1        ; Sets the place as full.
        jmp SaveNum
OSet:   
        push si 
        mov si,[bp + 8]
        cmp [si],0
        pop si
        je OSet2
OsetAI: 

        call Ai                 ; Call AI algorithm.
        xor bx,bx
        mov di,[bp + 18]  
        mov bl,[di]
        
OSet2:  
        mov di,[bp+6]
        mov [di][bx],2
        jmp SaveNum        
        
wrong:

        mov al, 3               ; amount of rows (0=clear all screen)
        push si
        mov si,[bp+4]           ; Get the value from the stack
        mov bh, [si]             ; black background (0) font color black (0)
        pop si
        mov ch, 6               ; ch-row (up,left)
        mov cl, 34               ; cl-col (up,left)
        mov dh, 9              ; dh-row (down,right)
        mov dl, 79              ; dl-col (down,right)
        mov ah, 6
        int 10h                 ; clear the screen


        mov bh, 0                ; page number
        mov dh, 8                ; row
        mov dl, 35               ; col
        mov ah, 2
        int 10h                  ; Moving the cursor to (Row,Col)
        
        mov dx, [bp+12]
        mov ah, 9
        int 21h                  ; Print wrong MachineChoisessage.
        
        jmp Again

wrongCell:
        mov al, 3               ; amount of rows (0=clear all screen)
        push si
        mov si,[bp+4]
        mov bh, [si]            ; Color of the player.
        pop si
        mov ch, 6               ; ch-row (up,left)
        mov cl, 34              ; cl-col (up,left)
        mov dh, 9               ; dh-row (down,right)
        mov dl, 79              ; dl-col (down,right)
        mov ah, 6
        int 10h                 ; clear the screen


        mov bh, 0               ; page number
        mov dh, 8               ; row
        mov dl, 35              ; col
        mov ah, 2
        int 10h                 ; Moving the cursor to (Row,Col)

        mov dx, [bp + 16]
        mov ah, 9
        int 21h                 ; Print wrong MachineChoisessage.
        
        jmp Again
         
SaveNum: 
        mov al, 3               ; amount of rows (0=clear all screen)
        mov si,[bp+4]
        mov bh, [si]            ; Color of the player.
        mov ch, 6               ; ch-row (up,left)
        mov cl, 34              ; cl-col (up,left)
        mov dh, 9               ; dh-row (down,right)
        mov dl, 79              ; dl-col (down,right)
        mov ah, 6
        int 10h                 ; clear the screen
        
        
        mov bh, 0               ; page number
        mov dh, 8               ; row
        mov dl, 35              ; col
        mov ah, 2
        int 10h                 ; Moving the cursor to (Row,Col)

        mov dx, [bp + 14]       ; your number.
        mov ah, 9
        int 21h                 ; Print your number.
        
        mov dl,bl
        add dl,'0' 
        inc dl
        mov ah,2
        int 21h
                
        mov si,[bp+2]           ; Choise var.
        
        mov [si], bx            ; Transfer number to variable
        
        popa

        ret 20
        GetInput ENDP
        

    ;==========================================
    ;   This procedure uses the folowing 
    ;   variables:
    ;       1. Turn
    ;       2. P1Color AND P2Color
    ;       3. Xturn AND Oturn
    ;       4. IsRobot
    ;   The procedure prints Turn of each player
    ;==========================================



DrawTurn PROC NEAR
    mov bp,sp
        pusha
        
        mov si,[bp+12]

        
        
        cmp [si], 2
        je comColor
        
        mov di,[bp+10]
        mov bh, [di]
        jmp drawColor
comColor:
        mov di,[bp+8]
        mov bh, [di]

drawColor:
        mov al, 3               ; amount of rows (0=clear all screen)
        mov ch, 3               ; ch-row (up,left)
        mov cl, 34              ; cl-col (up,left)
        mov dh, 6               ; dh-row (down,right)
        mov dl, 75              ; dl-col (down,right)
        mov ah, 6
        int 10h                 ; clear the screen

        cmp [si], 2
        je OPlayerTurn


XPlayerTurn:
        mov bh, 0                ; page number
        mov dh, 4                ; row
        mov dl, 35               ; col
        mov ah, 2
        int 10h                  ; Moving the cursor to (Row,Col)

        mov dx,[bp + 6]
        mov ah, 9
        int 21h
        
        mov bh, 0                ; page number
        mov dh, 5                ; row
        mov dl, 35               ; col
        mov ah, 2
        int 10h                  ; Moving the cursor to (Row,Col)
        
        jmp exit

OPlayerTurn:
        mov bh, 0                ; page number
        mov dh, 4                ; row
        mov dl, 35               ; col
        mov ah, 2
        int 10h                  ; Moving the cursor to (Row,Col)

        mov dx,[bp + 2]
        mov ah, 9
        int 21h
        
        mov bh, 0                ; page number
        mov dh, 5                ; row
        mov dl, 35               ; col
        mov ah, 2
        int 10h                  ; Moving the cursor to (Row,Col)



exit:   
        mov di,[bp + 14]
        cmp [di],1
        jne n
        cmp [si],2
        je ex                   ;Check if the ai is playing, so dont print the "choose number" text.
n:
        mov dx,[bp + 4]
        mov ah, 9
        int 21h
ex:     
        popa

        ret 14
        DrawTurn ENDP        
        
        
        
        

    ;==========================================
    ;   This procedure uses the folowing 
    ;   variables by the stack:
    ;       1. InputNumber
    ;       2. Turn
    ;       3. P1Color AND P2Color
    ;       4. Xsimbol AND Osimbol
    ;       5. TurnNum
    ;   The procedure prints player choise and
    ;   update the Turns.
    ;==========================================



DrawGame Proc NEAR
      mov bp,sp
        pusha
        
        mov di,[bp + 14]
        mov si,[bp + 12]
        
        xor ax,ax               ; clean ax
        cmp [di], 2             ;\
        jle row1                ; \
        cmp [di],5              ;  Checking which row the number is.
        jle row2                ; /
        jge row3                ;/

row1:
        mov al, 6               ;\
        mul [di]                ; \
        add al,12               ;  \
                                ;   \
        mov cl, al              ;    \
                                ;     \
        mov dl , al             ;      \
        add dl, 4               ;       \
                                ;        \
        mov ch, 4               ;         \
        mov dh, 8               ;          \
        jmp col                 ;           \
row2:                           ;            \
        mov al, 6               ;             \
        sub [di],3              ;              \
        mul [di]                ;               \
        add al,12               ;                \
                                ;                 \
        mov cl, al              ;                  \
                                ;                   \
        mov dl , al             ;                    \
        add dl, 4               ;                    /Transform the number into x,y postion.
                                ;                   /
        mov ch, 10              ;                  /
        mov dh, 14              ;                 /
                                ;                /
                                ;               /
        jmp col                 ;              /
row3:                           ;             /
        mov al, 6               ;            /
        sub [di],6              ;           /
        mul [di]                ;          /
        add al,12               ;         /
                                ;        /
        mov cl, al              ;       /
                                ;      /
        mov dl , al             ;     /
        add dl, 4               ;    /
                                ;   /
        mov ch, 16              ;  /
        mov dh, 20              ; /
        jmp col                 ;/
col:
        cmp [si],1
        je paintX

paintO:   
        push si
        mov si,[bp + 8]
        mov bh, [si]           ; black background (0) font color Blue
        pop si
        dec Turn
        mov si,[bp + 6]
        jmp paint                       

paintX:         
        push si
        mov si,[bp+4]
        mov bh, [si]            ; black background (0) font color Red
        pop si
        inc [si]
        mov  si, [bp + 2]

paint:  
        mov al, 5               ; amount of rows
        mov ah, 6
        int 10h                 ; paint the Table blue

        xor di,di
print:        
        mov bh, 0               ; page number
        mov dh, ch              ; row
        mov dl, cl              ; col
        mov ah, 2
        int 10h                 ; Moving the cursor to (Row,Col)
        
        inc ch                  ; next line
        inc di                  ; count the line

        mov dx, si              ; si (OFFSET X/O) --> dx
        mov ah, 9
        int 21h                 ; print line X/O

        add si, 6               ; next line

        cmp di, 5               ; check: if don't finish printing the simbol.
        jl print
        
        mov di,[bp + 10]
        
        inc [di]                 ; Update number of Turns.
        
        popa

        ret 14
        DrawGame ENDP

;--------------------------------------------
; This Proc calculates the move of the computer.
; Gets the follwing vars by the stack.
; 1. Table
; 2. TurnNum
; 3. MachineNumber
;--------------------------------------------
   
Ai PROC NEAR 
    pusha                          
                                
    mov si,[bp+6]            ; Table
    
    mov di,[bp+18]             ; MachineCoise

    
        
    
    mov [di],-1
    
     mov al,2                    ; Start with checking is the computer can win.
    
    
    
StartCheck:    
    
    mov ah,[si][0]              ; Check first Horizontally option for winning.
    cmp ah,[si][1]                
    jne LineFirst1                 
    cmp ah,al                     
    jne LineFirst1                
    cmp [si][2],0                 
    jne LineFirst1                 
    mov [di],2                    
                                  
LineFirst1:                     ; Check Horizontally option for winning.           
    mov ah,[si][0]                
    cmp ah,[si][2]                
    jne LineFirst2                      
    cmp ah,al                     
    jne LineFirst2                  
    cmp [si][1],0                 
    jne LineFirst2                 
    mov [di],1                
                                   
LineFirst2:                    ; Check Horizontally option for winning.   
    mov ah,[si][1]                 
    cmp ah,[si][2]                 
    jne LineFirst3                 
    cmp ah,al                      
    jne LineFirst3                 
    cmp [si][0],0                  
    jne LineFirst3                       
    mov [di],0                
                                  
LineFirst3:                              
    cmp [di],-1                ; Check if there is a win(so the var would change).
    jne ed                        
                                  
                                  
                                   
                                  
                                  
                                  
    mov ah,[si][3]               
    cmp ah,[si][4]             ; Check second Horizontally option for winning.   
    jne LineSecond1                        
    cmp ah,al                    
    jne LineSecond1                  
    cmp [si][5],0                 
    jne LineSecond1                       
    mov [di],5            
                                   
LineSecond1:                               
    mov ah,[si][3]             ; Check second Horizontally option for winning.    
    cmp ah,[si][5]                 
    jne LineSecond2                        
    cmp ah,al                      
    jne LineSecond2                        
    cmp [si][4],0                  
    jne LineSecond2                       
    mov [di],4              
                                   
LineSecond2:                                 
    mov ah,[si][4]            ; Check second Horizontally option for winning.         
    cmp ah,[si][5]             
    jne LineSecond3                     
    cmp ah,al                    
    jne LineSecond3                                                                      
    cmp [si][3],0               
    jne LineSecond3                                                                    
    mov [di],3                                                                
                                                                             
LineSecond3:                                                                        
    cmp [di],-1               ; Check if there is a win(so the var would change).
    jne ed                                                               
                                                                         
                                                                        
                                                                       
                                                                      
                                                                     
    mov ah,[si][6]                                                  
    cmp ah,[si][7]                                                 
    jne LineThird1             ; Check third Horizontally option for winning.                                             
    cmp ah,al                                                    
    jne LineThird1                                                      
    cmp [si][8],0                                              
    jne LineThird1                                                    
    mov [di],8               
                                   
LineThird1:                               
    mov ah,[si][6]           ; Check third Horizontally option for winning.     
    cmp ah,[si][8]                
    jne LineThird2                        
    cmp ah,al                     
    jne LineThird2                                      
    cmp [si][7],0                                  
    jne LineThird2                                       
    mov [di],7           
                                                
LineThird2:                                           
    mov ah,[si][7]                            
    cmp ah,[si][8]          ; Check third Horizontally option for winning.                 
    jne LineThird3                                 
    cmp ah,al                             
    jne LineThird3                                 
    cmp [si][6],0                         
    jne LineThird3                              
    mov [di],6          
                                    
LineThird3:                             
    cmp [di],-1             ; Check if there is a win(so the var would change).     
    jne ed                                                          
                                   

    
    
    mov ah,[si][0]
    cmp ah,[si][3]
    jne ColumnFirst1 
    cmp ah,al                 ; Check first Verticlly option for winning.
    jne ColumnFirst1 
    cmp [si][6],0
    jne ColumnFirst1
    mov [di],6
 
ColumnFirst1: 
    mov ah,[si][3]
    cmp ah,[si][6]            ; Check first Verticlly option for winning.
    jne ColumnFirst2 
    cmp ah,al
    jne ColumnFirst2
    cmp [si][0],0
    jne ColumnFirst2
    mov [di],0
    
ColumnFirst2:
    mov ah,[si][0]
    cmp ah,[si][6]
    jne ColumnFirst3        ; Check first Verticlly option for winning.
    cmp ah,al
    jne ColumnFirst3
    cmp [si][3],0
    jne ColumnFirst3    
    mov [di],3

ColumnFirst3:
    cmp [di],-1             ; Check if there is a win(so the var would change).
    jne ed    

     
     
     
     
     
    mov ah,[si][1]
    cmp ah,[si][4]
    jne ColumnSecond1 
    cmp ah,al                  ; Check second Verticlly option for winning.
    jne ColumnSecond1 
    cmp [si][7],0
    jne ColumnSecond1
    mov [di],7
 
ColumnSecond1: 
    mov ah,[si][1]
    cmp ah,[si][7]
    jne ColumnSecond2 
    cmp ah,al
    jne ColumnSecond2         ; Check second Verticlly option for winning.
    cmp [si][4],0
    jne ColumnSecond2
    mov [di],4
    
ColumnSecond2:
    mov ah,[si][4]
    cmp ah,[si][7]
    jne ColumnSecond3 
    cmp ah,al
    jne ColumnSecond3
    cmp [si][1],0             ; Check second Verticlly option for winning.
    jne ColumnSecond3
    mov [di],1

ColumnSecond3:
    cmp [di],-1               ; Check if there is a win(so the var would change).
    jne ed       
    
  
  
  
    
    mov ah,[si][2]
    cmp ah,[si][5]            ; Check third Verticlly option for winning.
    jne ColumnThird1 
    cmp ah,al
    jne ColumnThird1
    cmp [si][8],0
    jne ColumnThird1
    mov [di],8
 
ColumnThird1: 
    mov ah,[si][2]
    cmp ah,[si][8]
    jne ColumnThird2 
    cmp ah,al                  ; Check third Verticlly option for winning.
    jne ColumnThird2
    cmp [si][5],0
    jne ColumnThird2
    mov [di],5
    
ColumnThird2:
    mov ah,[si][5]
    cmp ah,[si][8]
    jne ColumnThird3 
    cmp ah,al                 ; Check third Verticlly option for winning.
    jne ColumnThird3
    cmp [si][2],0
    jne ColumnThird3
    mov [di],2

ColumnThird3:                  ; Check if there is a win(so the var would change).
    cmp [di],-1
    jne ed       
        
    

    mov ah,[si][0]
    cmp ah,[si][4]
    jne DiagonalFirst1           ; Check first Diagonal option for winning.
    cmp ah,al
    jne DiagonalFirst1 
    cmp [si][8],0
    jne DiagonalFirst1
    mov [di],8
 
DiagonalFirst1: 
    mov ah,[si][0]
    cmp ah,[si][8]               ; Check first Diagonal option for winning.
    jne DiagonalFirst2 
    cmp ah,al
    jne DiagonalFirst2
    cmp [si][4],0
    jne DiagonalFirst2
    mov [di],4
    
DiagonalFirst2:
    mov ah,[si][4]
    cmp ah,[si][8]               ; Check first Diagonal option for winning.
    jne DiagonalFirst3 
    cmp ah,al
    jne DiagonalFirst3
    cmp [si][0],0
    jne DiagonalFirst3    
    mov [di],0

DiagonalFirst3:                  ; Check if there is a win(so the var would change).
    cmp [di],-1
    jne ed    

     

    mov ah,[si][2]
    cmp ah,[si][4]
    jne DiagonalLast1             ; Check last Diagonal option for winning.
    cmp ah,al
    jne DiagonalLast1 
    cmp [si][6],0
    jne DiagonalLast1
    mov [di],6
 
DiagonalLast1: 
    mov ah,[si][2]
    cmp ah,[si][6]
    jne DiagonalLast2              ; Check last Diagonal option for winning.
    cmp ah,al
    jne DiagonalLast2
    cmp [si][4],0
    jne DiagonalLast2
    mov [di],4
    
DiagonalLast2:
    mov ah,[si][4]
    cmp ah,[si][6]
    jne DiagonalLast3               ; Check last Diagonal option for winning.
    cmp ah,al
    jne DiagonalLast3
    cmp [si][2],0
    jne DiagonalLast3
    mov [di],2

DiagonalLast3:
    cmp [di],-1                    ; Check if there is a win(so the var would change).
    jne ed       



    dec al                         ; Change value to enemy token.
    cmp al,1                       ; Is this the first time.                             
    je StartCheck
      

	
	
    push si                        ; So we can do the trick that needed.
    mov si,[bp + 20]
    cmp [si],1
    pop si
    jne TrickTwo                   
    cmp [si][4],0                  ; Always the middle. 
    je  TrickOne
    jmp TrickTwo
       
TrickOne:    
    mov bl,4
    jmp SetAndFinish           


    
TrickTwo:
    push si
    mov si,[bp + 20]               ; TurnNum
    cmp [si],3                     ; So we can do the trick that needed.
    pop si
    jne StartLoopCheck             
    mov cx,1                       ; Priority for sides.                                                                                                   
       
    cmp [si][4],1                  ; Is there someone in the middle.
    je ConCheck                
    mov cx,0                       ; Priority for edges.
    
       

                                   
    
    cmp [si][0],1
    je TrickTwo_1 
    cmp [si][2],1
    je TrickTwo_2                  ; Need to do the move according to enemy move.
    cmp [si][6],1
    je TrickTwo_3
    cmp [si][8],1
    je TrickTwo_4
    jmp ConCheck
    
TrickTwo_1:
    cmp [si][5],1
    je StartLoopCheck
    cmp [si][7],1
    jne StartLoopCheck
    mov bl,6
    jmp SetAndFinish
    
TrickTwo_2:
    cmp [si][3],1
    je StartLoopCheck
    cmp [si][7],1
    jne StartLoopCheck
    mov bl,5
    jmp SetAndFinish           

TrickTwo_3:
    cmp [si][1],1
    je StartLoopCheck
    cmp [si][5],1
    jne StartLoopCheck
    mov bl,7
    jmp SetAndFinish
    
TrickTwo_4: 
    mov bl,2   
    cmp [si][1],1
    je StartLoopCheck
    cmp [si][3],1
    je StartLoopCheck 
    jmp ConCheck
    
    

ConCheck:    
    mov bx,cx                           ; If the tricks above dont work, you have priority set before.
    cmp [si][bx],0
    je SetAndFinish  
    add bx,2
    cmp [si][bx],0
    je SetAndFinish  
    add bx,2
    cmp [si][bx],0
    je SetAndFinish 
    add bx,2
    cmp [si][bx],0
    je SetAndFinish
    jmp StartLoopCheck


    StartLoopCheck:                         ; If dont need tricks, pick randomly.
    mov bx,0 
    
LoopCheck:
    cmp [si][bx],0
    je SetAndFinish
    inc bx
    cmp bx,8
    jle LoopCheck
    jmp ed    

SetAndFinish:                           ; Save the value to the var.
    mov [di],bl
ed:    
    popa
    ret 
    Ai ENDP     
     




    ;==========================================
    ;   This procedure uses the folowing 
    ;   variables:
    ;       1. Turn
    ;       2. Table  
    ;       3. Win
    ;   The procedure checks if there is Win.
    ;==========================================


CheckWin PROC NEAR
    mov bp,sp
        pusha
        
        mov si, [bp + 6]                ; OFFSET Table --> si

        xor bx, bx                      ; clean bx

AnotherRow:
        cmp [si][bx], 0                 ;\
        je NextRow                      ; \
                                        ;  \
        mov al, [si][bx]                ; check: if there is not a horizontal Win
                                        ;        go to NextRow
        cmp al, [si][bx] + 1            ;
        jne NextRow                     ;  /
        cmp al, [si][bx] + 2            ; /
        jne NextRow                     ;/

        jmp ThereIsWin                  ; there is a horizontal Win. go to ThereIsWin

NextRow:
        cmp bx, 6                       ; check: if all rows checked go
        je  CheckCol                    ;        to CheckCol
        add bx, 3                       ;\
                                        ; bx+3 = the place of a new row
        jmp AnotherRow                  ;/

CheckCol:
        xor bx, bx                      ; clean bx
AnotherCol:
        cmp [si][bx], 0                 ;\
        je NextCol                      ; \
                                        ;  \
        mov al, [si][bx]                ; check: if there is not a vertical Win
                                        ;        go to NextRow
        cmp al, [si][bx] + 3            ;
        jne NextCol                     ;  /
        cmp al, [si][bx] + 6            ; /
        jne NextCol                     ;/

        jmp ThereIsWin                  ; there is a vertical Win. go to ThereIsWin

NextCol:
        cmp bx, 2                       ; check: if all colums checked go
        je  CheckDiagonal1              ;        to CheckDiagonal1
        inc bx                          ;\
                                        ; bx+1 = the place of a new colum
        jmp AnotherCol                  ;/

CheckDiagonal1:
        cmp [si][0], 0                  ;\
        je  CheckDiagonal2              ; \
                                        ;  \
        mov al, [si][0]                 ; check: if there is not a diognal1 Win
                                        ;        go to CheckDiagonal2
        cmp al, [si][4]                 ;
        jne CheckDiagonal2              ;  /
        cmp al, [si][8]                 ; /
        jne CheckDiagonal2              ;/

        jmp ThereIsWin                  ; there is a diognl1 Win. go to ThereIsWin

CheckDiagonal2:
        cmp [si][2], 0                  ;\
        je  NoOneWin                    ; \
                                        ;  \
        mov al, [si][2]                 ; check: if there is not a diognol2 Win
                                        ;        go to NoOneWin
        cmp al, [si][4]                 ;
        jne NoOneWin                    ;  /
        cmp al, [si][6]                 ; /
        jne NoOneWin                    ;/

ThereIsWin:
        
        mov di,[bp + 4]                 ; Which turn is it.
        
        mov si,[bp + 2]                 ; Win var.
        
        
        cmp [di], 1                     ; check: if the last Turn was 1, it means
        jne WinO                        ;        O Win, go to WinO

        mov [si], 1                      ; 1 --> Win (X won)

        jmp NoOneWin
WinO:
        mov [si], 2                      ; 2 --> Win (O won)


NoOneWin:
        popa

        ret 6
        CheckWin ENDP
    
    
    
    
    ;==========================================
    ;   This procedure uses the folowing 
    ;   variables:
    ;       1. Win
    ;       2. Owin
    ;       3. Xwin
    ;       4. Draw
    ;       5. ReapetOrExit
    ;   The procedure prints finish Massage.
    ;==========================================



FinishGame PROC NEAR
    mov bp,sp
        pusha
        
        mov si,[bp + 10]
        
        mov al, 0               ; amount of rows (0=clear all screen)
        mov bh, 03h             ; black background (0) font color black (0)
        mov ch, 0               ; ch-row (up,left)
        mov cl, 0               ; cl-col (up,left)
        mov dh, 24              ; dh-row (down,right)
        mov dl, 79              ; dl-col (down,right)
        mov ah, 6
        int 10h                 ; clear the screen
    
        cmp [si],0
        je NoOne
        cmp [si],1               ;Checking who is the winner.
        je OPlayerWin
        jmp XPlayerWin
    
NoOne:
        mov dx, [bp + 8]
        mov ah, 9
        int 21h
        jmp PrintReapet
    
XPlayerWin:
        mov dx, [bp + 6]
        mov ah, 9
        int 21h
        jmp PrintReapet
        
OPlayerWin:
        mov dx, [bp + 4]
        mov ah, 9
        int 21h
       
PrintReapet:
        mov dx, [bp + 2]
        mov ah, 9 
        int 21h
        
        popa
    
        ret 10
        FinishGame ENDP


end start ; set entry point and stop the assembler.