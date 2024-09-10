INCLUDE Irvine32.INC

.DATA
    ; USER DATA
    USER1 DB "STUDENT1", 0
    PASS1 DB "PASSWORD1", 0

    ; BOOK DATA
    TOTALBOOK DD 6
    BORROWEDBOOKS DD 0
    RESERVEDBOOKS DD 0
    AVAILABLEBOOKS DD 0

    ; MENU OPTIONS
    Line1 DB " =================================================", 0
    Line2 DB " =                                               =", 0
    Line3 DB " =       Welcome To Heaven Library System        =", 0
    Line4 DB " =                                               =", 0
    Menu1 DB "| 1. View Available Books                        |", 0
    Menu2 DB "| 2. Reserve a Book                              |", 0
    Menu3 DB "| 3. Return a Book                               |", 0
    Menu4 DB "| 4. Exit                                        |", 0
    Line5 DB " ------------------------------------------------", 0
    Prompt DB " Select an option (1-4): ", 0
    InvalidOption DB "Invalid option. Please try again.", 0

    ;BOOK MENU OPTIONS
    ;CALL Line1
    ;CALL Line2
    VBHEADER DB " =             View Book Panel                  =", 0
    BOOK1 DB "| 1. Journey To The West                         |" ,0
    BOOK2 DB "| 2. The Witcher                                 |" ,0
    BOOK3 DB "| 3. Rich DaD and Poor Dad                       |" ,0
    BOOK4 DB "| 4. Self Development                            |" ,0
    BOOK5 DB "| 5. The Politic                                 |" ,0
    BOOK6 DB "| 6. Switching and Routing                       |" ,0
    ;CALL Line5
    TTLBOOKMSG DB "  Total Book: ",0
    AVBOOKMSG  DB "  Available Book: ",0
    PROMPTBOOK DB "  Type any key back to Main Menu: ",0
    ;CALL InvalidOption


.CODE
MAIN PROC
    ;------------------------------------------  MENU  -------------------------------------------->
   
    MenuLoop:
        ; Clear the screen
        CALL Clrscr

        ; Display the decorated welcome message
        MOV EDX, OFFSET Line1   ; Load the address of Line1 into EDX
        CALL WriteString        ; Print Line1
        CALL Crlf               ; Move to the next line

        MOV EDX, OFFSET Line2   ; Load the address of Line2 into EDX
        CALL WriteString        ; Print Line2
        CALL Crlf               ; Move to the next line

        MOV EDX, OFFSET Line3   ; Load the address of Line3 into EDX
        CALL WriteString        ; Print Line3
        CALL Crlf               ; Move to the next line

        MOV EDX, OFFSET Line4   ; Load the address of Line4 into EDX
        CALL WriteString        ; Print Line4
        CALL Crlf               ; Move to the next line

        MOV EDX, OFFSET Line1   ; Load the address of Line1 into EDX again for the bottom border
        CALL WriteString        ; Print Line1
        CALL Crlf               ; Move to the next line

        ; Display the menu options
        MOV EDX, OFFSET Menu1   ; Load the address of Menu1 into EDX
        CALL WriteString        ; Print Menu1
        CALL Crlf

        MOV EDX, OFFSET Menu2   ; Load the address of Menu2 into EDX
        CALL WriteString        ; Print Menu2
        CALL Crlf

        MOV EDX, OFFSET Menu3   ; Load the address of Menu3 into EDX
        CALL WriteString        ; Print Menu3
        CALL Crlf

        MOV EDX, OFFSET Menu4   ; Load the address of Menu4 into EDX
        CALL WriteString        ; Print Menu4
        CALL Crlf

        MOV EDX, OFFSET Line5   ; Load the address of Line5 into EDX
        CALL WriteString        ; Print Line5
        CALL Crlf
        CALL Crlf

        ; Prompt the user to select an option
        MOV EDX, OFFSET Prompt
        CALL WriteString        ; Print the prompt
        CALL ReadInt            ; Read an integer input from the user into EAX

        ; Compare the user's input and branch to the appropriate label
        CMP EAX, 1
        JL InvalidInput         ; If EAX < 1, jump to InvalidInput
        CMP EAX, 4
        JG InvalidInput         ; If EAX > 4, jump to InvalidInput

        CMP EAX, 1
        JE ViewBooks
        CMP EAX, 2
       ; JE ReserveBook
        CMP EAX, 3
       ; JE ReturnBook
        CMP EAX, 4
        JE ExitProgram

    ;------------------------------------------ VIEW BOOK MENU  -------------------------------------------->

        ;BOOKS MENU
        ViewBooks:
            CALL CLRSCR

        ;DISPLAY LINE
            MOV EDX, OFFSET Line1   ; Load the address of Line1 into EDX
            CALL WriteString        ; Print Line1
            CALL Crlf               ; Move to the next line

        ;DISPLAY Line2   
            MOV EDX, OFFSET Line2   ; Load the address of Line2 into EDX
            CALL WriteString        ; Print Line2
            CALL Crlf               ; Move to the next line

        ;DISPLAY VIEWBOOK HEADER
            MOV EDX, OFFSET VBHEADER ; LOAD THE ADDRESS OF VBHEADER INTO EDX
            CALL WRITESTRING         ; PRINT STRING
            CALL CRLF                ; NEXT LINE

        ;DISPLAY Line2   
            MOV EDX, OFFSET Line2   ; Load the address of Line2 into EDX
            CALL WriteString        ; Print Line2
            CALL Crlf 

        ;DISPLAY BOOK1
            MOV EDX, OFFSET BOOK1   ; Load the address of Book1 into EDX
            CALL WRITEString        ; Print Book1
            CALL CRLF               ; Next line

         ;DISPLAY BOOK2
            MOV EDX, OFFSET BOOK2   ; Load the address of Book1 into EDX
            CALL WRITEString        ; Print Book2
            CALL CRLF               ; Next line

         ;DISPLAY BOOK3
            MOV EDX, OFFSET BOOK3   ; Load the address of Book1 into EDX
            CALL WRITEString        ; Print Book3
            CALL CRLF               ; Next line

         ;DISPLAY BOOK4
            MOV EDX, OFFSET BOOK4   ; Load the address of Book1 into EDX
            CALL WRITEString        ; Print Book4
            CALL CRLF               ; Next line

         ;DISPLAY BOOK5
            MOV EDX, OFFSET BOOK5   ; Load the address of Book1 into EDX
            CALL WRITEString        ; Print Book5
            CALL CRLF               ; Next line

         ;DISPLAY BOOK6
            MOV EDX, OFFSET BOOK6   ; Load the address of Book1 into EDX
            CALL WRITEString        ; Print Book6
            CALL CRLF               ; Next line

        ;DISPLAY Line5
            MOV EDX, OFFSET Line5   ; Load the address of Line5 into EDX
            CALL WriteString        ; Print Line5
            CALL CRLF

        ;CALCULATION OF AVAILABLE BOOKS
            MOV EAX, TOTALBOOK          ; LOAD THE TOTAL BOOK INTO EAX
            SUB EAX, RESERVEDBOOKS      ; TOTALBOOK - RESERVEDBOOK
            MOV AVAILABLEBOOKS, EAX     ; MOVE SUBTRACTED TO AVAILABLEBOOK          

        ;DISPLAY TOTAL BOOK
            MOV EDX, OFFSET TTLBOOKMSG  ; LOAD THE MESSAGE OF TTLBOOKMSG INTO EDX
            CALL WRITEString            ; PRING STRING
            MOV EDX, TOTALBOOK
            CALL WRITEDEC
            CALL CRLF

        ;DISPLAY AVAILABLE BOOK
            MOV EDX, OFFSET AVBOOKMSG   ; LOAD THE MESSAGE OF AVBOOKMSG INTO EDX
            CALL WRITEString            ; PRINT STRING
            MOV EAX, AVAILABLEBOOKS
            CALL WRITEDEC
            CALL CRLF

         ;DISPLAY Line5
            MOV EDX, OFFSET Line5   ; Load the address of Line5 into EDX
            CALL WriteString        ; Print Line5
            CALL Crlf
            CALL Crlf

        ;DISPLAY Prompt Message
            MOV EDX, OFFSET PROMPTBOOK
            CALL WriteString        ; Print the prompt
            CALL ReadInt            ; Read an integer input from the user into EAX

            JMP MenuLoop            ; Back to Main Menu

    ;------------------------------------------  MENU END -------------------------------------------->


    ; Handle invalid option input
    InvalidInput:
        CALL Crlf
        MOV EDX, OFFSET InvalidOption ; Load the address of InvalidOption into EDX
        CALL WriteString              ; Print the invalid option message
        CALL Crlf
        CALL WriteString              ; Print "Press Enter to continue..."
        JMP MenuLoop                  ; Go back to the start of the menu

    EXITPROGRAM:
        EXIT

MAIN ENDP
END MAIN


