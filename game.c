#include <stdlib.h>
#include <math.h>
#include "paroma.h"
#include "game.h"

// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];
PAROMA paromas[PAROMACOUNT];
int enemiesRemaining;
int isHitParoma;

// Initialize the game
void initGame() {

	initPlayer();
    initBullets();
    initEnemies();
    initParomas();

    // Initialize the score, hitCondition, paromaStayTimmer
	enemiesRemaining = ENEMYCOUNT;
	isHitParoma = 0;
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

	// Update all the enemies
	for (int i = 0; i < ENEMYCOUNT; i++)
		updateEnemy(&enemies[i]);

	// Update all the paromas
	for (int i = 0; i < PAROMACOUNT; i++)
		updateParoma(&paromas[i]);
}

// Draws the game each frame
void drawGame() {

	drawPlayer();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet(&bullets[i]);

	// Draw all the enemies
	for (int i = 0; i < ENEMYCOUNT; i++)
		drawEnemy(&enemies[i]);

	// Draw all the paromas
	for (int i = 0; i < PAROMACOUNT; i++)
		drawParoma(&paromas[i]);
}


// Initialize the player
void initPlayer() {

	player.row = 130;
	player.col = 118;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.cdel = 2;
	player.height = 10;
	player.width = 5;
	player.color = GREEN;
	player.bulletTimer = 20;
}

// Handle every-frame actions of the player
void updatePlayer() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT) && player.col >= player.cdel) {

		player.col -= player.cdel;

	} else if (BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;

	}

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 20) {

		fireBullet();
		player.bulletTimer = 0;
	}

	player.bulletTimer++;
}

// Draw the player
void drawPlayer() {

	drawRect(player.oldRow, player.oldCol, player.height, player.width, WHITE);
	drawRect(player.row, player.col, player.height, player.width, player.color);

	player.oldRow = player.row;
	player.oldCol = player.col;
}

// Initialize the pool of bullets
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = 4;
		bullets[i].width = 1;
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].oldRow = player.row;
		bullets[i].oldCol = player.col;
		bullets[i].rdel = -2;
		bullets[i].color = BLACK;
		bullets[i].active = 0;
		bullets[i].erased = 1;
	}
}

// Spawn a bullet
void fireBullet() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			bullets[i].row = player.row;
			bullets[i].col = player.col + player.width/2 - bullets[i].width/2;

			// Take the bullet out of the pool
			bullets[i].active = 1;
			bullets[i].erased = 0;

			// Break out of the loop
			break;
		}
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0) {
			b->row += b->rdel;
		} else {
			b->active = 0;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {

	if(b->active) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, WHITE);
		drawRect(b->row, b->col, b->height, b->width, b->color);
	} else if (!b->erased) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, WHITE);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}

// Initialize the enemies
void initEnemies() {

	for (int i = 0; i < ENEMYCOUNT; i++) {

		enemies[i].height = 10;
		enemies[i].width = 10;
		enemies[i].row = rand() % 80;
		enemies[i].col = rand() % 220 + 10;
		enemies[i].oldRow = player.row;
		enemies[i].oldCol = player.col;
		enemies[i].cdel = pow(-1, (rand() % 2));
		enemies[i].color = RED;
		enemies[i].active = 1;
		enemies[i].erased = 0;
	}
}

// Handle every-frame actions of an enemy
void updateEnemy(ENEMY* e) {

	if (e->active) {

		// Bounce the enemy off the sides of the box
		if (e->col <= 0 || e->col + e->width - 1 >= SCREENWIDTH - 1)
			e->cdel *= -1;

		// Move the enemy
		e->col += e->cdel;

		// Handle enemy-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(e->row, e->col, e->height, e->width,
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {

				// Put enemy back in the pool
				bullets[i].active = 0;
				e->active = 0;

				// Update the score
				enemiesRemaining--;
			}
		}
	}
}

// Draw an enemy
void drawEnemy(ENEMY* e) {

	if(e->active) {
		drawRect(e->oldRow, e->oldCol, e->height, e->width, WHITE);
		drawRect(e->row, e->col, e->height, e->width, e->color);
		
	} else if (!e->erased) {
		drawRect(e->oldRow, e->oldCol, e->height, e->width, WHITE);
		e->erased = 1;
	}

	e->oldRow = e->row;
	e->oldCol = e->col;
}

// Initialize the paromas
void initParomas() {

	for (int i = 0; i < PAROMACOUNT; i++) {

		paromas[i].height = 10;
		paromas[i].width = 10;
		paromas[i].row = rand() % 110;
		paromas[i].col = rand() % 130 + 10;
		paromas[i].color = BLUE;
		paromas[i].active = 0;
		paromas[i].stayTimer = 0;
	}
}

// Handle every-frame actions of a paroma
void updateParoma(PAROMA* p) {

	// Set paromas to be active or inactive
	if (p->stayTimer < 100) {
		p->active = 1;
	} else if (p->stayTimer == 100) {
		p->active = 0;
		drawRect(p->row, p->col, p->height, p->width, WHITE);
		p->row = rand() % 110;
		p->col = rand() % 130 + 10;

		p->stayTimer = 0;
	}

	if (p->active) {

		// Handle paroma-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(p->row, p->col, p->height, p->width,
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				isHitParoma = 1;
			}
		}
	}

	// Update paromaStayTimmer
	p->stayTimer++;
}

// Draw a paroma
void drawParoma(PAROMA* p) {

	if (p->active) 
		drawRect(p->row, p->col, p->height, p->width, p->color);
}