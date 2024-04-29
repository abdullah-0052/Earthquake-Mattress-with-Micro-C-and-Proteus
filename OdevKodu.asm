
_servo:

;OdevKodu.c,22 :: 		void servo()
;OdevKodu.c,24 :: 		PORTB.B7 = 1;
	BSF        PORTB+0, 7
;OdevKodu.c,25 :: 		delay_us(2000);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_servo0:
	DECFSZ     R13+0, 1
	GOTO       L_servo0
	DECFSZ     R12+0, 1
	GOTO       L_servo0
	NOP
;OdevKodu.c,26 :: 		PORTB.B7 = 0;
	BCF        PORTB+0, 7
;OdevKodu.c,27 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_servo1:
	DECFSZ     R13+0, 1
	GOTO       L_servo1
	DECFSZ     R12+0, 1
	GOTO       L_servo1
	DECFSZ     R11+0, 1
	GOTO       L_servo1
	NOP
	NOP
;OdevKodu.c,28 :: 		PORTB.B7 = 1;
	BSF        PORTB+0, 7
;OdevKodu.c,29 :: 		delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_servo2:
	DECFSZ     R13+0, 1
	GOTO       L_servo2
	DECFSZ     R12+0, 1
	GOTO       L_servo2
	NOP
;OdevKodu.c,30 :: 		PORTB.B7 = 0;
	BCF        PORTB+0, 7
;OdevKodu.c,31 :: 		}
L_end_servo:
	RETURN
; end of _servo

_buzzer:

;OdevKodu.c,34 :: 		void buzzer()
;OdevKodu.c,36 :: 		if(PORTB.B0=1){
	BSF        PORTB+0, 0
	BTFSS      PORTB+0, 0
	GOTO       L_buzzer3
;OdevKodu.c,37 :: 		PORTB.B0=1;
	BSF        PORTB+0, 0
;OdevKodu.c,38 :: 		}else{
	GOTO       L_buzzer4
L_buzzer3:
;OdevKodu.c,39 :: 		PORTB.B0=0;
	BCF        PORTB+0, 0
;OdevKodu.c,40 :: 		}
L_buzzer4:
;OdevKodu.c,41 :: 		}
L_end_buzzer:
	RETURN
; end of _buzzer

_koordinant:

;OdevKodu.c,43 :: 		void koordinant(){
;OdevKodu.c,45 :: 		Lcd_Out(1,4,"Koordinant:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,46 :: 		X=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _X+0
	MOVF       R0+1, 0
	MOVWF      _X+1
;OdevKodu.c,47 :: 		Xdeger=(X);
	MOVF       R0+0, 0
	MOVWF      _Xdeger+0
	MOVF       R0+1, 0
	MOVWF      _Xdeger+1
;OdevKodu.c,48 :: 		IntToStr(Xdeger,Xkonum);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _Xkonum+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;OdevKodu.c,49 :: 		Lcd_Out(2,5,"x:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,50 :: 		Lcd_Out(2,7,(Xkonum));
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Xkonum+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,52 :: 		Y=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Y+0
	MOVF       R0+1, 0
	MOVWF      _Y+1
;OdevKodu.c,53 :: 		Ydeger=(Y);
	MOVF       R0+0, 0
	MOVWF      _Ydeger+0
	MOVF       R0+1, 0
	MOVWF      _Ydeger+1
;OdevKodu.c,54 :: 		IntToStr(Ydeger,Ykonum);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _Ykonum+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;OdevKodu.c,55 :: 		Lcd_Out(3,1,"y:");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,56 :: 		Lcd_Out(3,3,(Ykonum));
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Ykonum+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,58 :: 		k=ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _k+0
	MOVF       R0+1, 0
	MOVWF      _k+1
;OdevKodu.c,59 :: 		kdeger=(k);
	MOVF       R0+0, 0
	MOVWF      _kdeger+0
	MOVF       R0+1, 0
	MOVWF      _kdeger+1
;OdevKodu.c,60 :: 		IntToStr(kdeger,kkonum);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _kkonum+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;OdevKodu.c,61 :: 		Lcd_Out(4,1,"z:");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,62 :: 		Lcd_Out(4,3,(kkonum));
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _kkonum+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,63 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_koordinant5:
	DECFSZ     R13+0, 1
	GOTO       L_koordinant5
	DECFSZ     R12+0, 1
	GOTO       L_koordinant5
	DECFSZ     R11+0, 1
	GOTO       L_koordinant5
	NOP
	NOP
;OdevKodu.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,65 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,67 :: 		}
L_end_koordinant:
	RETURN
; end of _koordinant

_main:

;OdevKodu.c,69 :: 		void main() {
;OdevKodu.c,71 :: 		ANSEL = 0x01; // AN1 pini analog olarak ayarlanýyor.
	MOVLW      1
	MOVWF      ANSEL+0
;OdevKodu.c,72 :: 		ANSEL = 0x02; // AN2 pini analog olarak ayarlanýyor.
	MOVLW      2
	MOVWF      ANSEL+0
;OdevKodu.c,73 :: 		ANSEL = 0x03; // AN3 pini analog olarak ayarlanýyor.
	MOVLW      3
	MOVWF      ANSEL+0
;OdevKodu.c,74 :: 		ANSELH = 0;   // Diðer pinler dijital olarak ayarlanýyor
	CLRF       ANSELH+0
;OdevKodu.c,77 :: 		TRISB.B7 = 0;
	BCF        TRISB+0, 7
;OdevKodu.c,78 :: 		TRISB.B0 = 0;
	BCF        TRISB+0, 0
;OdevKodu.c,79 :: 		PORTB.B7=0;
	BCF        PORTB+0, 7
;OdevKodu.c,80 :: 		PORTB.B0=0;
	BCF        PORTB+0, 0
;OdevKodu.c,81 :: 		ADCON1=0x0F;
	MOVLW      15
	MOVWF      ADCON1+0
;OdevKodu.c,83 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;OdevKodu.c,84 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,85 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,88 :: 		while(1){
L_main6:
;OdevKodu.c,89 :: 		if(PORTA.B3==1 && PORTA.B5 == 1)
	BTFSS      PORTA+0, 3
	GOTO       L_main10
	BTFSS      PORTA+0, 5
	GOTO       L_main10
L__main21:
;OdevKodu.c,91 :: 		buzzer(); // BUZZER
	CALL       _buzzer+0
;OdevKodu.c,92 :: 		Lcd_out(1,4,"Deprem Tespit");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,93 :: 		Lcd_out(2,5,"Edildi");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,94 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
;OdevKodu.c,95 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,96 :: 		LCD_CMD(_LCD_CLEAR) ;
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,97 :: 		koordinant();    //KOORDÝNANT FONKSÝYONU ÇAÐIRDIK
	CALL       _koordinant+0
;OdevKodu.c,98 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;OdevKodu.c,99 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,100 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,101 :: 		Lcd_out(1,1,"SARSINTI oluyor");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,102 :: 		Lcd_out(2,1,"TiTRESiM oluyor");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,104 :: 		servo();          //SERVO FONKSÝYONU ÇAÐIRDIK
	CALL       _servo+0
;OdevKodu.c,105 :: 		T=ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _T+0
	MOVF       R0+1, 0
	MOVWF      _T+1
;OdevKodu.c,106 :: 		Tdeger=(6);
	MOVLW      6
	MOVWF      _Tdeger+0
	MOVLW      0
	MOVWF      _Tdeger+1
;OdevKodu.c,107 :: 		IntToStr(Tdeger,titresim);
	MOVLW      6
	MOVWF      FARG_IntToStr_input+0
	MOVLW      0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _titresim+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;OdevKodu.c,108 :: 		Lcd_Out(3,1,"Siddeti:");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,109 :: 		Lcd_Out(3,7,(titresim));
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _titresim+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,110 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;OdevKodu.c,111 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,112 :: 		LCD_CMD(_LCD_CLEAR) ;
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,113 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;OdevKodu.c,115 :: 		}
	GOTO       L_main15
L_main10:
;OdevKodu.c,116 :: 		else if(PORTA.B3==1)
	BTFSS      PORTA+0, 3
	GOTO       L_main16
;OdevKodu.c,118 :: 		Lcd_out(2,3,"TiTRESiM OLDU");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,120 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
;OdevKodu.c,121 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,122 :: 		LCD_CMD(_LCD_CLEAR) ;
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,123 :: 		}
	GOTO       L_main18
L_main16:
;OdevKodu.c,124 :: 		else if(PORTA.B5==1)
	BTFSS      PORTA+0, 5
	GOTO       L_main19
;OdevKodu.c,126 :: 		Lcd_out(2,3,"SARSiNti OLDU");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_OdevKodu+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;OdevKodu.c,127 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
;OdevKodu.c,128 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,129 :: 		LCD_CMD(_LCD_CLEAR) ;
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;OdevKodu.c,130 :: 		}
L_main19:
L_main18:
L_main15:
;OdevKodu.c,131 :: 		}
	GOTO       L_main6
;OdevKodu.c,132 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
