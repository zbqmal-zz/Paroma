# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
# 1 "paroma.h" 1




typedef unsigned short u16;
# 25 "paroma.h"
extern unsigned short *videoBuffer;
# 40 "paroma.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "paroma.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "paroma.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 117 "paroma.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawBigChar(int, int, int, unsigned short);
void drawString(int, int, char *, unsigned short);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
extern const unsigned char fontdata_12x16[1000];
# 4 "text.c" 2


void drawChar(int row, int col, char ch, unsigned short color) {
 for (int i = 0; i < 6; i++) {
  for (int j = 0; j < 8; j++) {
   if (fontdata_6x8[48 * ch + i + 6 * j]) {
    setPixel(row + j, col + i, color);
   }
  }
 }
}

void drawBigChar(int row, int col, int order, unsigned short color) {
 for (int i = 0; i < 12; i++) {
  for (int j = 0; j < 16; j++) {
   if (fontdata_12x16[192 * order + i + 12 * j]) {
    setPixel(row + j, col + i, color);
   }
  }
 }
}


void drawString(int row, int col, char *str, unsigned short color) {

 _Bool isEndOfString = *str != '\0';
 while (isEndOfString) {
  drawChar(row, col, *str, color);
  col += 6;
  str++;

  isEndOfString = *str != '\0';
 }
}
