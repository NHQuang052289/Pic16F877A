#line 1 "D:/Hoc_PIC/Code_Begin/UART_Hercules_GLCD/myGLCD.c"
#line 16 "D:/Hoc_PIC/Code_Begin/UART_Hercules_GLCD/myGLCD.c"
sbit CS1 at PORTC.B0;
sbit CS2 at PORTC.B1;
sbit RS at PORTC.B2;
sbit RW at PORTC.B3;
sbit E at PORTC.B4;
#line 1 "d:/hoc_pic/code_begin/uart_hercules_glcd/font5x7.h"



code unsigned char my_font5x7[] =
{
0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x5F, 0x00, 0x00,
0x00, 0x07, 0x00, 0x07, 0x00,
0x14, 0x7F, 0x14, 0x7F, 0x14,
0x24, 0x2A, 0x7F, 0x2A, 0x12,
0x23, 0x13, 0x08, 0x64, 0x62,
0x36, 0x49, 0x55, 0x22, 0x50,
0x00, 0x05, 0x03, 0x00, 0x00,
0x00, 0x1C, 0x22, 0x41, 0x00,
0x00, 0x41, 0x22, 0x1C, 0x00,
0x08, 0x2A, 0x1C, 0x2A, 0x08,
0x08, 0x08, 0x3E, 0x08, 0x08,
0x00, 0x50, 0x30, 0x00, 0x00,
0x08, 0x08, 0x08, 0x08, 0x08,
0x00, 0x30, 0x30, 0x00, 0x00,
0x20, 0x10, 0x08, 0x04, 0x02,
0x3E, 0x51, 0x49, 0x45, 0x3E,
0x00, 0x42, 0x7F, 0x40, 0x00,
0x42, 0x61, 0x51, 0x49, 0x46,
0x21, 0x41, 0x45, 0x4B, 0x31,
0x18, 0x14, 0x12, 0x7F, 0x10,
0x27, 0x45, 0x45, 0x45, 0x39,
0x3C, 0x4A, 0x49, 0x49, 0x30,
0x01, 0x71, 0x09, 0x05, 0x03,
0x36, 0x49, 0x49, 0x49, 0x36,
0x06, 0x49, 0x49, 0x29, 0x1E,
0x00, 0x36, 0x36, 0x00, 0x00,
0x00, 0x56, 0x36, 0x00, 0x00,
0x00, 0x08, 0x14, 0x22, 0x41,
0x14, 0x14, 0x14, 0x14, 0x14,
0x41, 0x22, 0x14, 0x08, 0x00,
0x02, 0x01, 0x51, 0x09, 0x06,
0x32, 0x49, 0x79, 0x41, 0x3E,
0x7E, 0x11, 0x11, 0x11, 0x7E,
0x7F, 0x49, 0x49, 0x49, 0x36,
0x3E, 0x41, 0x41, 0x41, 0x22,
0x7F, 0x41, 0x41, 0x22, 0x1C,
0x7F, 0x49, 0x49, 0x49, 0x41,
0x7F, 0x09, 0x09, 0x01, 0x01,
0x3E, 0x41, 0x41, 0x51, 0x32,
0x7F, 0x08, 0x08, 0x08, 0x7F,
0x00, 0x41, 0x7F, 0x41, 0x00,
0x20, 0x40, 0x41, 0x3F, 0x01,
0x7F, 0x08, 0x14, 0x22, 0x41,
0x7F, 0x40, 0x40, 0x40, 0x40,
0x7F, 0x02, 0x04, 0x02, 0x7F,
0x7F, 0x04, 0x08, 0x10, 0x7F,
0x3E, 0x41, 0x41, 0x41, 0x3E,
0x7F, 0x09, 0x09, 0x09, 0x06,
0x3E, 0x41, 0x51, 0x21, 0x5E,
0x7F, 0x09, 0x19, 0x29, 0x46,
0x46, 0x49, 0x49, 0x49, 0x31,
0x01, 0x01, 0x7F, 0x01, 0x01,
0x3F, 0x40, 0x40, 0x40, 0x3F,
0x1F, 0x20, 0x40, 0x20, 0x1F,
0x7F, 0x20, 0x18, 0x20, 0x7F,
0x63, 0x14, 0x08, 0x14, 0x63,
0x03, 0x04, 0x78, 0x04, 0x03,
0x61, 0x51, 0x49, 0x45, 0x43,
0x00, 0x00, 0x7F, 0x41, 0x41,
0x02, 0x04, 0x08, 0x10, 0x20,
0x41, 0x41, 0x7F, 0x00, 0x00,
0x04, 0x02, 0x01, 0x02, 0x04,
0x40, 0x40, 0x40, 0x40, 0x40,
0x00, 0x01, 0x02, 0x04, 0x00,
0x20, 0x54, 0x54, 0x54, 0x78,
0x7F, 0x48, 0x44, 0x44, 0x38,
0x38, 0x44, 0x44, 0x44, 0x20,
0x38, 0x44, 0x44, 0x48, 0x7F,
0x38, 0x54, 0x54, 0x54, 0x18,
0x08, 0x7E, 0x09, 0x01, 0x02,
0x08, 0x14, 0x54, 0x54, 0x3C,
0x7F, 0x08, 0x04, 0x04, 0x78,
0x00, 0x44, 0x7D, 0x40, 0x00,
0x20, 0x40, 0x44, 0x3D, 0x00,
0x00, 0x7F, 0x10, 0x28, 0x44,
0x00, 0x41, 0x7F, 0x40, 0x00,
0x7C, 0x04, 0x18, 0x04, 0x78,
0x7C, 0x08, 0x04, 0x04, 0x78,
0x38, 0x44, 0x44, 0x44, 0x38,
0x7C, 0x14, 0x14, 0x14, 0x08,
0x08, 0x14, 0x14, 0x18, 0x7C,
0x7C, 0x08, 0x04, 0x04, 0x08,
0x48, 0x54, 0x54, 0x54, 0x20,
0x04, 0x3F, 0x44, 0x40, 0x20,
0x3C, 0x40, 0x40, 0x20, 0x7C,
0x1C, 0x20, 0x40, 0x20, 0x1C,
0x3C, 0x40, 0x30, 0x40, 0x3C,
0x44, 0x28, 0x10, 0x28, 0x44,
0x0C, 0x50, 0x50, 0x50, 0x3C,
0x44, 0x64, 0x54, 0x4C, 0x44,
0x00, 0x08, 0x36, 0x41, 0x00,
0x00, 0x00, 0x7F, 0x00, 0x00,
0x00, 0x41, 0x36, 0x08, 0x00,
};
#line 25 "D:/Hoc_PIC/Code_Begin/UART_Hercules_GLCD/myGLCD.c"
void GLCD_Cmd(char command)
{
  TRISD  = 0x00;
  PORTD  = command;
 RS = 0;
 RW = 0;
 E = 1;
 Delay_ms(2);
 E = 0;
 Delay_ms(2);

}


void GLCD_SetSide(char side)
{

 if(side == 0)
 {
 CS2 = 1;
 CS1 = 0;
 }
 else if(side == 1)
 {
 CS2 = 0;
 CS1 = 1;
 }
 Delay_ms(2);
}

void Wait_GLCD(void)
{

  TRISD  = 0xFF;
 RS = 0; RW = 1;
 E = 1;
 Delay_ms(2);
 E = 0;

 while( PORTD.B7  == 1)
 {
 E = 1;
 Delay_ms(2);
 E = 0;
 }
}

void GLCD_SetColum(char col)
{
 Wait_GLCD();
  TRISD  = 0x00;
 RS = RW = 0;

 GLCD_Cmd( 0x40  + col);
 E = 1;
 Delay_ms(2);
 E = 0;
}

void GLCD_SetPage(char page)
{
 Wait_GLCD();
  TRISD  = 0x00;
 RS = RW = 0;

 GLCD_Cmd( 0xB8  + page);
 E = 1;
 Delay_ms(2);
 E = 0;
}

void GLCD_ScrollUp(char lineValue)
{
 Wait_GLCD();
  TRISD  = 0x00;
 RS = RW = 0;

 GLCD_Cmd( 0xC0  + lineValue);
 E = 1;
 Delay_ms(2);
 E = 0;
}



void GLCD_Init(void)
{
  TRISC  = 0x00;
 CS1 = CS2 = 1;
 Delay_ms(20);
 GLCD_Cmd( 0x3E );
 GLCD_Cmd( 0xB8 );
 GLCD_Cmd( 0x40 );
 GLCD_Cmd( 0xC0 );
 GLCD_Cmd( 0x3F );
}

void GLCD_SendData(char myData)
{
  TRISD  = 0x00;
  PORTD  = myData;
 RS = 1;
 RW = 0;
 E = 1;
 Delay_ms(2);
 E = 0;
 Delay_ms(2);
}


void GLCD_GotoXY(int page, int col)
{
 int side = 0;
 side = col/64;
 GLCD_SetSide(side);

 col -= 64 * side;
 GLCD_SetPage(page);
 GLCD_SetColum(col);
}

void GLCD_Clear(void)
{
 int page, colum;
 for(page = 0; page <= 7; page++)
 {
 GLCD_GotoXY(page, 0);
 for(colum = 0; colum <= 63; colum++) GLCD_SendData(0);
 }
 for(page = 0; page <= 7; page++)
 {
 GLCD_GotoXY(page, 64);
 for(colum = 0; colum <= 63; colum++) GLCD_SendData(0);
 }
}

void GLCD_PutChar57(unsigned char x, unsigned char y, unsigned char chr)
{
 unsigned char i;
 if((y>59) && (y<64))
 {
 GLCD_GotoXY(x, y);
 for(i = 0; i < 64-y; i++)
 GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
 GLCD_GotoXY(x, 64);
 for(i = 64 - y; i < 5; i++)
 GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
 }
 else
 {
 GLCD_GotoXY(x, y);
 for(i = 0; i < 5; i++)
 GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
 }
}

void GLCD_Print57(unsigned char page, unsigned char col, char* str)
{
 unsigned char i, j;
 j = col;
 for( i = 0; str[i] != 0; i++)
 {
 if(j>=128)
 {
 col = 0;
 j = col;
 page++;
 }
 GLCD_PutChar57(page, j, str[i]);
 j += 7;
 }
}
void GLCD_PutBMP(code unsigned char* bmp)
{
 unsigned char line, col;
 unsigned int i;
 for(line = 0; line < 8; line++)
 {
 GLCD_GotoXY(line, 0);
 for(col = 0; col < 64; col++)
 {
 i = 128 * line + col;
 GLCD_SendData(bmp[i]);
 }
 GLCD_GotoXY(line, 64);
 for(col = 64; col < 128; col++)
 {
 i = 128 * line + col;
 GLCD_SendData(bmp[i]);
 }
 }
}
