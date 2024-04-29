#line 1 "C:/Program Files/mikroC PRO for PIC/ODEV/OdevKodu.c"
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit PIR_B0_Direction at TRISB0_bit;


int X, Xdeger, Y, Ydeger, k, kdeger,Tdeger, T;
int titresim [6];
char Xkonum[5], Ykonum[5], kkonum[5];


 void servo()
 {
 PORTB.B7 = 1;
 delay_us(2000);
 PORTB.B7 = 0;
 delay_ms(1000);
 PORTB.B7 = 1;
 delay_us(1500);
 PORTB.B7 = 0;
 }


 void buzzer()
 {
 if(PORTB.B0=1){
 PORTB.B0=1;
 }else{
 PORTB.B0=0;
 }
 }

 void koordinant(){

 Lcd_Out(1,4,"Koordinant:");
 X=ADC_Read(0);
 Xdeger=(X);
 IntToStr(Xdeger,Xkonum);
 Lcd_Out(2,5,"x:");
 Lcd_Out(2,7,(Xkonum));

 Y=ADC_Read(1);
 Ydeger=(Y);
 IntToStr(Ydeger,Ykonum);
 Lcd_Out(3,1,"y:");
 Lcd_Out(3,3,(Ykonum));

 k=ADC_Read(2);
 kdeger=(k);
 IntToStr(kdeger,kkonum);
 Lcd_Out(4,1,"z:");
 Lcd_Out(4,3,(kkonum));
 delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 }

void main() {

 ANSEL = 0x01;
 ANSEL = 0x02;
 ANSEL = 0x03;
 ANSELH = 0;


 TRISB.B7 = 0;
 TRISB.B0 = 0;
 PORTB.B7=0;
 PORTB.B0=0;
 ADCON1=0x0F;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


while(1){
if(PORTA.B3==1 && PORTA.B5 == 1)
{
 buzzer();
 Lcd_out(1,4,"Deprem Tespit");
 Lcd_out(2,5,"Edildi");
 delay_ms(200);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_CMD(_LCD_CLEAR) ;
 koordinant();
 delay_ms(300);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_CMD(_LCD_CLEAR);
 Lcd_out(1,1,"SARSINTI oluyor");
 Lcd_out(2,1,"TiTRESiM oluyor");

 servo();
 T=ADC_Read(3);
 Tdeger=(6);
 IntToStr(Tdeger,titresim);
 Lcd_Out(3,1,"Siddeti:");
 Lcd_Out(3,7,(titresim));
 delay_ms(500);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_CMD(_LCD_CLEAR) ;
 delay_ms(500);

}
else if(PORTA.B3==1)
{
 Lcd_out(2,3,"TiTRESiM OLDU");

 delay_ms(200);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_CMD(_LCD_CLEAR) ;
}
else if(PORTA.B5==1)
{
 Lcd_out(2,3,"SARSiNti OLDU");
 delay_ms(200);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_CMD(_LCD_CLEAR) ;
}
}
}
