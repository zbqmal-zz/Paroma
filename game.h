// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int bulletTimer;
} PLAYER;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BULLET;

// Enemy Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} ENEMY;

// Paroma Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	unsigned short color;
	int active;
	int stayTimer;
} PAROMA;

// Constants
#define BULLETCOUNT 5
#define ENEMYCOUNT 5
#define PAROMACOUNT 3
#define HITCONDTION 0

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern PAROMA paromas[PAROMACOUNT];
extern int enemiesRemaining;
extern int isHitParoma;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initEnemies();
void updateEnemy(ENEMY *);
void drawEnemy(ENEMY *);
void initParomas();
void updateParoma(PAROMA *);
void drawParoma(PAROMA *);