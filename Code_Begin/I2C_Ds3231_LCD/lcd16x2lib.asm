
_Lcd_Enable:

;lcd16x2lib.c,10 :: 		void Lcd_Enable(void)
;lcd16x2lib.c,12 :: 		EN = 1;
	BSF        PORTD+0, 7
;lcd16x2lib.c,13 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_Lcd_Enable0:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Enable0
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Enable0
	NOP
	NOP
;lcd16x2lib.c,14 :: 		EN = 0;
	BCF        PORTD+0, 7
;lcd16x2lib.c,15 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Lcd_Enable1:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Enable1
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Enable1
	NOP
	NOP
;lcd16x2lib.c,16 :: 		}
L_end_Lcd_Enable:
	RETURN
; end of _Lcd_Enable

_Lcd_Send4Bit:

;lcd16x2lib.c,17 :: 		void Lcd_Send4Bit(unsigned char myData)
;lcd16x2lib.c,19 :: 		D4 =  myData & 0x01;
	MOVLW      1
	ANDWF      FARG_Lcd_Send4Bit_myData+0, 0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__Lcd_Send4Bit16
	BCF        PORTB+0, 4
	GOTO       L__Lcd_Send4Bit17
L__Lcd_Send4Bit16:
	BSF        PORTB+0, 4
L__Lcd_Send4Bit17:
;lcd16x2lib.c,20 :: 		D5 = (myData>>1) & 0x01;
	MOVF       FARG_Lcd_Send4Bit_myData+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 1
	BTFSC      R0+0, 0
	GOTO       L__Lcd_Send4Bit18
	BCF        PORTB+0, 5
	GOTO       L__Lcd_Send4Bit19
L__Lcd_Send4Bit18:
	BSF        PORTB+0, 5
L__Lcd_Send4Bit19:
;lcd16x2lib.c,21 :: 		D6 = (myData>>2) & 0x01;
	MOVF       FARG_Lcd_Send4Bit_myData+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 1
	BTFSC      R0+0, 0
	GOTO       L__Lcd_Send4Bit20
	BCF        PORTB+0, 6
	GOTO       L__Lcd_Send4Bit21
L__Lcd_Send4Bit20:
	BSF        PORTB+0, 6
L__Lcd_Send4Bit21:
;lcd16x2lib.c,22 :: 		D7 = (myData>>3) & 0x01;
	MOVF       FARG_Lcd_Send4Bit_myData+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 1
	BTFSC      R0+0, 0
	GOTO       L__Lcd_Send4Bit22
	BCF        PORTB+0, 7
	GOTO       L__Lcd_Send4Bit23
L__Lcd_Send4Bit22:
	BSF        PORTB+0, 7
L__Lcd_Send4Bit23:
;lcd16x2lib.c,23 :: 		}
L_end_Lcd_Send4Bit:
	RETURN
; end of _Lcd_Send4Bit

_Lcd_Cmd:

;lcd16x2lib.c,24 :: 		void Lcd_Cmd(unsigned char myCommand)
;lcd16x2lib.c,26 :: 		Lcd_Send4Bit(myCommand >> 4); // send 4 high bits
	MOVF       FARG_Lcd_Cmd_myCommand+0, 0
	MOVWF      FARG_Lcd_Send4Bit_myData+0
	RRF        FARG_Lcd_Send4Bit_myData+0, 1
	BCF        FARG_Lcd_Send4Bit_myData+0, 7
	RRF        FARG_Lcd_Send4Bit_myData+0, 1
	BCF        FARG_Lcd_Send4Bit_myData+0, 7
	RRF        FARG_Lcd_Send4Bit_myData+0, 1
	BCF        FARG_Lcd_Send4Bit_myData+0, 7
	RRF        FARG_Lcd_Send4Bit_myData+0, 1
	BCF        FARG_Lcd_Send4Bit_myData+0, 7
	CALL       _Lcd_Send4Bit+0
;lcd16x2lib.c,27 :: 		Lcd_Enable();
	CALL       _Lcd_Enable+0
;lcd16x2lib.c,28 :: 		Lcd_Send4Bit(myCommand); // send 4 low bit
	MOVF       FARG_Lcd_Cmd_myCommand+0, 0
	MOVWF      FARG_Lcd_Send4Bit_myData+0
	CALL       _Lcd_Send4Bit+0
;lcd16x2lib.c,29 :: 		Lcd_Enable();
	CALL       _Lcd_Enable+0
;lcd16x2lib.c,30 :: 		}
L_end_Lcd_Cmd:
	RETURN
; end of _Lcd_Cmd

_Lcd_Init:

;lcd16x2lib.c,31 :: 		void Lcd_Init(void)
;lcd16x2lib.c,33 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;lcd16x2lib.c,34 :: 		TRISD.B5 = 0;
	BCF        TRISD+0, 5
;lcd16x2lib.c,35 :: 		TRISD.B6 = 0;
	BCF        TRISD+0, 6
;lcd16x2lib.c,36 :: 		TRISD.B7 = 0;
	BCF        TRISD+0, 7
;lcd16x2lib.c,37 :: 		RS = 0;
	BCF        PORTD+0, 5
;lcd16x2lib.c,38 :: 		RW = 0;
	BCF        PORTD+0, 6
;lcd16x2lib.c,39 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_Lcd_Init2:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Init2
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Init2
	NOP
	NOP
;lcd16x2lib.c,40 :: 		Lcd_Send4Bit(0x03);
	MOVLW      3
	MOVWF      FARG_Lcd_Send4Bit_myData+0
	CALL       _Lcd_Send4Bit+0
;lcd16x2lib.c,41 :: 		Lcd_Enable();
	CALL       _Lcd_Enable+0
;lcd16x2lib.c,42 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Lcd_Init3:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Init3
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Init3
	NOP
;lcd16x2lib.c,43 :: 		Lcd_Send4Bit(0x03);
	MOVLW      3
	MOVWF      FARG_Lcd_Send4Bit_myData+0
	CALL       _Lcd_Send4Bit+0
;lcd16x2lib.c,44 :: 		Lcd_Enable();
	CALL       _Lcd_Enable+0
;lcd16x2lib.c,45 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Lcd_Init4:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Init4
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Init4
	NOP
;lcd16x2lib.c,46 :: 		Lcd_Send4Bit(0x03);
	MOVLW      3
	MOVWF      FARG_Lcd_Send4Bit_myData+0
	CALL       _Lcd_Send4Bit+0
;lcd16x2lib.c,47 :: 		Lcd_Enable();
	CALL       _Lcd_Enable+0
;lcd16x2lib.c,48 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Lcd_Init5:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Init5
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Init5
	NOP
;lcd16x2lib.c,49 :: 		Lcd_Send4Bit(0x02);
	MOVLW      2
	MOVWF      FARG_Lcd_Send4Bit_myData+0
	CALL       _Lcd_Send4Bit+0
;lcd16x2lib.c,50 :: 		Lcd_Enable();
	CALL       _Lcd_Enable+0
;lcd16x2lib.c,51 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Lcd_Init6:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Init6
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Init6
	NOP
;lcd16x2lib.c,52 :: 		Lcd_Cmd( 0x28 );      // giao thuc 4 bit, hien thi 2 hang, ki tu 5�8
	MOVLW      40
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;lcd16x2lib.c,57 :: 		Lcd_Cmd( 0x0C);    //Display on Cursor on: 0x0E   0x0F
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;lcd16x2lib.c,60 :: 		Lcd_Cmd( 0x06 );   // tang ID, khong dich khung hinh  Entry Mode
	MOVLW      6
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;lcd16x2lib.c,61 :: 		Lcd_Cmd( 0x01 );   //  Clear Display  (also clear DDRAM content)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;lcd16x2lib.c,62 :: 		}
L_end_Lcd_Init:
	RETURN
; end of _Lcd_Init

_Lcd_PutChar:

;lcd16x2lib.c,64 :: 		void Lcd_PutChar(unsigned char myData)
;lcd16x2lib.c,66 :: 		RS = 1;
	BSF        PORTD+0, 5
;lcd16x2lib.c,67 :: 		Lcd_Cmd(myData);
	MOVF       FARG_Lcd_PutChar_myData+0, 0
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;lcd16x2lib.c,68 :: 		RS = 0;
	BCF        PORTD+0, 5
;lcd16x2lib.c,69 :: 		}
L_end_Lcd_PutChar:
	RETURN
; end of _Lcd_PutChar

_Lcd_Puts:

;lcd16x2lib.c,70 :: 		void Lcd_Puts(char *s)
;lcd16x2lib.c,72 :: 		while(*s)
L_Lcd_Puts7:
	MOVF       FARG_Lcd_Puts_s+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Lcd_Puts8
;lcd16x2lib.c,74 :: 		Lcd_PutChar(*s);
	MOVF       FARG_Lcd_Puts_s+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;lcd16x2lib.c,75 :: 		s++;
	INCF       FARG_Lcd_Puts_s+0, 1
;lcd16x2lib.c,76 :: 		}
	GOTO       L_Lcd_Puts7
L_Lcd_Puts8:
;lcd16x2lib.c,77 :: 		}
L_end_Lcd_Puts:
	RETURN
; end of _Lcd_Puts

_Lcd_Clear:

;lcd16x2lib.c,78 :: 		void Lcd_Clear(void)
;lcd16x2lib.c,80 :: 		Lcd_Cmd(0x01);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;lcd16x2lib.c,81 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Lcd_Clear9:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_Clear9
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_Clear9
	NOP
;lcd16x2lib.c,82 :: 		}
L_end_Lcd_Clear:
	RETURN
; end of _Lcd_Clear

_Lcd_GoToXY:

;lcd16x2lib.c,83 :: 		void Lcd_GoToXY(unsigned char row, unsigned char col)       //row = 0 or 1, col = 0-15
;lcd16x2lib.c,86 :: 		if(!row)
	MOVF       FARG_Lcd_GoToXY_row+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Lcd_GoToXY10
;lcd16x2lib.c,87 :: 		address = (0x80 + col);
	MOVF       FARG_Lcd_GoToXY_col+0, 0
	ADDLW      128
	MOVWF      Lcd_GoToXY_address_L0+0
	GOTO       L_Lcd_GoToXY11
L_Lcd_GoToXY10:
;lcd16x2lib.c,89 :: 		address = (0xC0 + col);
	MOVF       FARG_Lcd_GoToXY_col+0, 0
	ADDLW      192
	MOVWF      Lcd_GoToXY_address_L0+0
L_Lcd_GoToXY11:
;lcd16x2lib.c,90 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Lcd_GoToXY12:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_GoToXY12
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_GoToXY12
	NOP
	NOP
;lcd16x2lib.c,91 :: 		Lcd_Cmd(address);
	MOVF       Lcd_GoToXY_address_L0+0, 0
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;lcd16x2lib.c,92 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Lcd_GoToXY13:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_GoToXY13
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_GoToXY13
	NOP
	NOP
;lcd16x2lib.c,93 :: 		}
L_end_Lcd_GoToXY:
	RETURN
; end of _Lcd_GoToXY
