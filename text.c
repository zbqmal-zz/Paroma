#include "paroma.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location
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

// Draws the specified string at the specified location
void drawString(int row, int col, char *str, unsigned short color) {
    // TODO 2.0: Complete this function
	_Bool isEndOfString = *str != '\0';
	while (isEndOfString) {
		drawChar(row, col, *str, color);
		col += 6;
		str++;

		isEndOfString = *str != '\0';
	}
}