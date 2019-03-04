#include <stdlib.h>
#include <stdio.h>
#include "paroma.h"
#include "text.h"
#include "game.h"


// Function Prototypes
void initialize();
void update();
void draw();

// State Prototypes
void goToStart();
void start();
void goToInstruction();
void instruction();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToQuit();

// States
enum {START, INSTRUCTION, GAME, PAUSE, WIN, LOSE};
enum {GAMESTART, INSTR, QUIT};
int gameState;
int menuState;
int isOnGame;
int gameON;

// Video Buffer
u16 *videoBuffer;

// Text Buffer
char buffer[41];

// Button Variables
u16 oldButtons;
u16 buttons;

// Random Seed
int seed;


// =================================================================================


int main() {

	initialize();

    while(gameON) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(gameState) {
            case START:
                start();
                break;
            case INSTRUCTION:
            	instruction();
            	break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

// =================================================================================

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    gameON = 1;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

	// Sets up the screen
    fillScreen(BLACK);
    // Big String of "PAROMA"
    drawBigChar(20, 74, 0, CYAN);
    drawBigChar(20, 91, 1, CYAN);
    drawBigChar(20, 108, 2, CYAN);
    drawBigChar(20, 125, 3, CYAN);
    drawBigChar(20, 142, 4, CYAN);
    drawBigChar(20, 159, 1, CYAN);
    drawString(60, 80, "START", YELLOW);
    drawString(80, 80, "INSTRUCTION", WHITE);
    drawString(100, 80, "QUIT", WHITE);

    // Begin the seed randomization
    seed = 0;

    // Sets up game and menu states
	gameState = START;
	menuState = GAMESTART;
	isOnGame = 0;
}

// Start Screen
void start() {

	// To randomize the seed
    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // Menu Selection transitions
    if (BUTTON_PRESSED(BUTTON_UP)) {
    	if (menuState == INSTRUCTION) {
    		menuState = GAMESTART;
    		drawString (80, 80, "INSTRUCTION", WHITE);
    		drawString (60, 80, "START", YELLOW);
    	} else if (menuState == QUIT) {
    		menuState = INSTRUCTION;
    		drawString (100, 80, "QUIT", WHITE);
    		drawString (80, 80, "INSTRUCTION", YELLOW);
    	}
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
    	if (menuState == GAMESTART) {
    		menuState = INSTRUCTION;
    		drawString (60, 80, "START", WHITE);
    		drawString (80, 80, "INSTRUCTION", YELLOW);
    	} else if (menuState == INSTRUCTION) {
    		menuState = QUIT;
    		drawString (80, 80, "INSTRUCTION", WHITE);
    		drawString (100, 80, "QUIT", YELLOW);
    	}
    }

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	// Move on the next state based on menuState
    	switch (menuState) {
    		case GAMESTART:
    			// Seed the random generator
        		srand(seed);

    			goToGame();
    			initGame();
    			break;
    		case INSTRUCTION:
    			goToInstruction();
    			break;
    		case QUIT:
    			// quit the game
    			goToQuit();
    			break;
    		default:
    			break;
    	}
    }
}

// Sets up the instruction state
void goToInstruction() {

	// Sets up the screen
	fillScreen(BLACK);

	// Instructions
	drawString (10, 83, "INSTRUCTION", WHITE);
	drawString (30, 44, "SHOOT FOR THE RED ENEMIES", WHITE);
	drawString (40, 64, "AVOID BLUE PAROMAS", WHITE);
	drawString (70, 60, "MOVE : <- and ->", WHITE);
	drawString (80, 60, "SHOOT: X", WHITE);
	drawString (90, 60, "PAUSE: ENTER", WHITE);
	drawString (140, 15, "Hit BACKSPACE to go to main menu", WHITE);

	// Sets up the game state
	gameState = INSTRUCTION;
}

// Instruction Screen
void instruction() {

	// Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions to Start state
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	if (!isOnGame)
    		goToStart();
    	else if (isOnGame)
    		goToPause();
    }
}

// Sets up the game state
void goToGame() {

	// Sets up the screen
    fillScreen(WHITE);
    drawString(145, 5, "Enemy Remaining:", BLACK);

    // Sets up the game state
    gameState = GAME;
    isOnGame = 1;
}

// Game Screen
void game() {

	// Update Game
    updateGame();

    // Update the buffer string with the current enemies remaining
    sprintf(buffer, "%d", enemiesRemaining);

    // Draw Game
    waitForVBlank();
    drawGame();

    // Erase the old number and write the new one
    drawRect(145, 107, 10, 5, WHITE);
    drawString(145, 107, buffer, BLACK);


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    else if (enemiesRemaining == 0)
        goToWin();
    else if (isHitParoma)
        goToLose();
    
}

// Sets up the pause state
void goToPause() {

	// Sets up the screen
    fillScreen(GRAY);
    drawString(30, 100, "Pasue", WHITE);
    drawString(50, 80, "RETURN TO GAME", YELLOW);
    drawString(70, 80, "INSTRUCTION", WHITE);
    drawString(90, 80, "MAIN MENU", WHITE);

    // Sets up the game state
    gameState = PAUSE;
    menuState = GAMESTART;
}

// Runs every frame of the pause state
void pause() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // Menu Selection transitions
    if (BUTTON_PRESSED(BUTTON_UP)) {
    	if (menuState == INSTR) {
    		menuState = GAMESTART;
    		drawString (70, 80, "INSTRUCTION", WHITE);
    		drawString (50, 80, "RETURN TO GAME", YELLOW);
    	} else if (menuState == QUIT) {
    		menuState = INSTR;
    		drawString (90, 80, "MAIN MENU", WHITE);
    		drawString (70, 80, "INSTRUCTION", YELLOW);
    	}
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
    	if (menuState == GAMESTART) {
    		menuState = INSTR;
    		drawString (50, 80, "RETURN TO GAME", WHITE);
    		drawString (70, 80, "INSTRUCTION", YELLOW);
    	} else if (menuState == INSTR) {
    		menuState = QUIT;
    		drawString (70, 80, "INSTRUCTION", WHITE);
    		drawString (90, 80, "MAIN MENU", YELLOW);
    	}
    }

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	// Move on the next state based on menuState
    	switch (menuState) {
    		case GAMESTART:
    			goToGame();
    			break;
    		case INSTR:
    			goToInstruction();
    			break;
    		case QUIT:
    			goToStart();
    			break;
    		default:
    			break;
    	}
    }
}

// Sets up the win state
void goToWin() {

	// Sets up the screen
    fillScreen(GREEN);
    drawString(70, 110, "WIN", WHITE);
    drawString(90, 25, "Press ENTER Button to go to menu", WHITE);

    // Sets up the game state
    gameState = WIN;
}

// Win Screen
void win() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

	// Sets up the screen
    fillScreen(RED);
    drawString(70, 110, "LOSE", WHITE);
    drawString(90, 25, "Press ENTER Button to go to menu", WHITE);
    
    // Sets up the game state
    gameState = LOSE;
}

// Lose Screen
void lose() {
     
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToStart();
}

// Quit Screen
void goToQuit() {
	// Turn on the Screen
	fillScreen(BLACK);
	gameON = 0;
}