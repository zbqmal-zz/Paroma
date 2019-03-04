	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"paromaShootMain.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L4
	mov	r0, #0
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, r5
	mov	r2, #0
	mov	r1, #74
	mov	r0, #20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #1
	mov	r1, #91
	mov	r0, #20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #2
	mov	r1, #108
	mov	r0, #20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #3
	mov	r1, #125
	mov	r0, #20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #4
	mov	r1, #142
	mov	r0, #20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #1
	mov	r1, #159
	mov	r0, #20
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+12
	ldr	r3, .L4+16
	ldr	r2, .L4+20
	mov	r1, #80
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r1, #80
	add	r5, r5, #31
	mov	r0, r1
	mov	r3, r5
	ldr	r2, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L4+28
	mov	r1, #80
	mov	r0, #100
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L4+32
	ldr	r0, .L4+36
	ldr	r1, .L4+40
	ldr	r2, .L4+44
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	32736
	.word	fillScreen
	.word	drawBigChar
	.word	drawString
	.word	1023
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	seed
	.word	gameState
	.word	menuState
	.word	isOnGame
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r2, #1
	ldr	r0, .L7
	ldr	r3, .L7+4
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.word	gameON
	.size	initialize, .-initialize
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L11
	mov	r0, #0
	ldr	r3, .L11+4
	ldr	r4, .L11+8
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L11+12
	mov	r1, #83
	mov	r0, #10
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L11+16
	mov	r1, #44
	mov	r0, #30
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L11+20
	mov	r1, #64
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L11+24
	mov	r1, #60
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L11+28
	mov	r1, #60
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L11+32
	mov	r1, #60
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L11+36
	mov	r1, #15
	mov	r0, #140
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L11+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC1
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	gameState
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L15
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+8
	mov	r3, #0
	ldr	r2, .L15+12
	mov	r1, #5
	mov	r0, #145
	mov	lr, pc
	bx	r4
	mov	r0, #2
	mov	r2, #1
	ldr	r1, .L15+16
	ldr	r3, .L15+20
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC9
	.word	gameState
	.word	isOnGame
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L40
	ldr	r3, [r4]
	ldr	r5, .L40+4
	add	r3, r3, #1
	ldr	r2, .L40+8
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldrh	r3, [r5]
	tst	r3, #64
	beq	.L18
	ldr	r2, .L40+12
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L35
.L18:
	tst	r3, #128
	beq	.L20
	ldr	r2, .L40+12
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L36
.L20:
	tst	r3, #8
	beq	.L17
	ldr	r3, .L40+12
	ldrh	r0, [r3]
	ands	r5, r0, #8
	bne	.L17
	ldr	r3, .L40+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L23
	cmp	r3, #2
	beq	.L24
	cmp	r3, #0
	beq	.L37
.L17:
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	ldr	ip, .L40+16
	ldr	r2, [ip]
	cmp	r2, #0
	beq	.L38
	cmp	r2, #1
	bne	.L20
	mov	r1, #80
	mov	lr, #2
	mov	r0, r1
	ldr	r3, .L40+20
	ldr	r2, .L40+24
	ldr	r6, .L40+28
	str	lr, [ip]
	mov	lr, pc
	bx	r6
	ldr	r3, .L40+32
	ldr	r2, .L40+36
	mov	r1, #80
	mov	r0, #100
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5]
	b	.L20
.L35:
	ldr	lr, .L40+16
	ldr	r2, [lr]
	cmp	r2, #1
	beq	.L39
	cmp	r2, #2
	bne	.L18
	mov	ip, #1
	ldr	r3, .L40+20
	ldr	r2, .L40+36
	mov	r1, #80
	mov	r0, #100
	ldr	r6, .L40+28
	str	ip, [lr]
	mov	lr, pc
	bx	r6
	mov	r1, #80
	ldr	r3, .L40+32
	mov	r0, r1
	ldr	r2, .L40+24
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5]
	b	.L18
.L37:
	ldr	r0, [r4]
	ldr	r3, .L40+40
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L40+44
	mov	lr, pc
	bx	r3
	b	.L17
.L24:
	ldr	r3, .L40+48
	mov	r0, r5
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+52
	str	r5, [r3]
	b	.L17
.L38:
	mov	lr, #1
	ldr	r3, .L40+20
	ldr	r2, .L40+56
	mov	r1, #80
	mov	r0, #60
	ldr	r6, .L40+28
	str	lr, [ip]
	mov	lr, pc
	bx	r6
	mov	r1, #80
	ldr	r3, .L40+32
	mov	r0, r1
	ldr	r2, .L40+24
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5]
	b	.L20
.L23:
	pop	{r4, r5, r6, lr}
	b	goToInstruction
.L39:
	mov	r1, #80
	ldr	r3, .L40+20
	mov	r0, r1
	ldr	r2, .L40+24
	ldr	r6, .L40+28
	str	ip, [lr]
	mov	lr, pc
	bx	r6
	ldr	r3, .L40+32
	ldr	r2, .L40+56
	mov	r1, #80
	mov	r0, #60
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5]
	b	.L18
.L41:
	.align	2
.L40:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	menuState
	.word	32767
	.word	.LC1
	.word	drawString
	.word	1023
	.word	.LC2
	.word	srand
	.word	initGame
	.word	fillScreen
	.word	gameON
	.word	.LC0
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L44
	ldr	r0, .L44+4
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+12
	mov	r3, r5
	ldr	r2, .L44+16
	mov	r1, #100
	mov	r0, #30
	mov	lr, pc
	bx	r4
	ldr	r3, .L44+20
	ldr	r2, .L44+24
	mov	r1, #80
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L44+28
	mov	r1, #80
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L44+32
	mov	r1, #80
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r2, #0
	ldr	r1, .L44+36
	ldr	r3, .L44+40
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	32767
	.word	15855
	.word	fillScreen
	.word	drawString
	.word	.LC10
	.word	1023
	.word	.LC11
	.word	.LC1
	.word	.LC12
	.word	gameState
	.word	menuState
	.size	goToPause, .-goToPause
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L53
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L46
	ldr	r3, .L53+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L46
	ldr	r3, .L53+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L48
	pop	{r4, lr}
	b	goToStart
.L46:
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToPause
.L54:
	.align	2
.L53:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	isOnGame
	.size	instruction, .-instruction
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L78
	ldr	r3, .L78+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #64
	beq	.L56
	ldr	r2, .L78+8
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L73
.L56:
	tst	r3, #128
	beq	.L58
	ldr	r2, .L78+8
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L74
.L58:
	tst	r3, #8
	beq	.L55
	ldr	r3, .L78+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L55
	ldr	r3, .L78+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L61
	cmp	r3, #2
	beq	.L62
	cmp	r3, #0
	beq	.L75
.L55:
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	ldr	ip, .L78+12
	ldr	r2, [ip]
	cmp	r2, #0
	beq	.L76
	cmp	r2, #1
	bne	.L58
	mov	lr, #2
	ldr	r3, .L78+16
	ldr	r2, .L78+20
	mov	r1, #80
	mov	r0, #70
	ldr	r5, .L78+24
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L78+28
	ldr	r2, .L78+32
	mov	r1, #80
	mov	r0, #90
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L58
.L73:
	ldr	lr, .L78+12
	ldr	r2, [lr]
	cmp	r2, #1
	beq	.L77
	cmp	r2, #2
	bne	.L56
	mov	ip, #1
	ldr	r3, .L78+16
	ldr	r2, .L78+32
	mov	r1, #80
	mov	r0, #90
	ldr	r5, .L78+24
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	ldr	r3, .L78+28
	ldr	r2, .L78+20
	mov	r1, #80
	mov	r0, #70
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L56
.L75:
	pop	{r4, r5, r6, lr}
	b	goToGame
.L62:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L76:
	mov	lr, #1
	ldr	r3, .L78+16
	ldr	r2, .L78+36
	mov	r1, #80
	mov	r0, #50
	ldr	r5, .L78+24
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L78+28
	ldr	r2, .L78+20
	mov	r1, #80
	mov	r0, #70
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L58
.L61:
	pop	{r4, r5, r6, lr}
	b	goToInstruction
.L77:
	ldr	r3, .L78+16
	ldr	r2, .L78+20
	mov	r1, #80
	mov	r0, #70
	ldr	r5, .L78+24
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	ldr	r3, .L78+28
	ldr	r2, .L78+36
	mov	r1, #80
	mov	r0, #50
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L56
.L79:
	.align	2
.L78:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	menuState
	.word	32767
	.word	.LC1
	.word	drawString
	.word	1023
	.word	.LC12
	.word	.LC11
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L82
	mov	r0, #992
	ldr	r3, .L82+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L82+8
	mov	r3, r5
	ldr	r2, .L82+12
	mov	r1, #110
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L82+16
	mov	r1, #25
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L82+20
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L83:
	.align	2
.L82:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC13
	.word	.LC14
	.word	gameState
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L91
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L91+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L84:
	pop	{r4, lr}
	bx	lr
.L90:
	pop	{r4, lr}
	b	goToStart
.L92:
	.align	2
.L91:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L95
	mov	r0, #31
	ldr	r3, .L95+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L95+8
	mov	r3, r5
	ldr	r2, .L95+12
	mov	r1, #110
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L95+16
	mov	r1, #25
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L95+20
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L96:
	.align	2
.L95:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC15
	.word	.LC14
	.word	gameState
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L108
	sub	sp, sp, #12
	ldr	r3, .L108+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L108+8
	ldr	r3, .L108+12
	ldr	r0, .L108+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+24
	mov	lr, pc
	bx	r3
	ldr	r2, .L108+28
	mov	r3, #5
	str	r2, [sp]
	mov	r1, #107
	mov	r2, #10
	mov	r0, #145
	ldr	r5, .L108+32
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, .L108+16
	mov	r1, #107
	mov	r0, #145
	ldr	r5, .L108+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L108+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L98
	ldr	r3, .L108+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L105
.L98:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L106
	ldr	r3, .L108+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L107
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L106:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L107:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L105:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToPause
.L109:
	.align	2
.L108:
	.word	enemiesRemaining
	.word	updateGame
	.word	.LC16
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	32767
	.word	drawRect
	.word	drawString
	.word	oldButtons
	.word	buttons
	.word	isHitParoma
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #1
	ldr	r1, .L124
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L124+4
	strh	r1, [r3]	@ movhi
	ldr	r3, .L124+8
	str	r2, [r6]
	mov	lr, pc
	bx	r3
	ldr	r7, .L124+12
	ldr	r5, .L124+16
	ldr	r4, .L124+20
	ldr	r8, .L124+24
	ldr	r10, .L124+28
	ldr	r9, .L124+32
.L111:
	ldr	r0, [r6]
	ldr	r3, [r7]
	ldr	r1, .L124+36
.L112:
	cmp	r0, #0
	beq	.L123
	ldrh	r2, [r4]
	strh	r2, [r5]	@ movhi
	ldrh	r2, [r1, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L112
.L114:
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L113
	.word	.L113
.L113:
	mov	lr, pc
	bx	r8
	b	.L111
.L115:
	mov	lr, pc
	bx	r10
	b	.L111
.L116:
	mov	lr, pc
	bx	r9
	b	.L111
.L117:
	ldr	r3, .L124+40
	mov	lr, pc
	bx	r3
	b	.L111
.L118:
	ldr	r3, .L124+44
	mov	lr, pc
	bx	r3
	b	.L111
.L123:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L125:
	.align	2
.L124:
	.word	1027
	.word	gameON
	.word	goToStart
	.word	gameState
	.word	oldButtons
	.word	buttons
	.word	win
	.word	pause
	.word	game
	.word	67109120
	.word	instruction
	.word	start
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	goToQuit
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToQuit, %function
goToQuit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L129
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L129+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L130:
	.align	2
.L129:
	.word	fillScreen
	.word	gameON
	.size	goToQuit, .-goToQuit
	.comm	seed,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	buffer,41,4
	.comm	videoBuffer,4,4
	.comm	gameON,4,4
	.comm	isOnGame,4,4
	.comm	menuState,4,4
	.comm	gameState,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"START\000"
	.space	2
.LC1:
	.ascii	"INSTRUCTION\000"
.LC2:
	.ascii	"QUIT\000"
	.space	3
.LC3:
	.ascii	"SHOOT FOR THE RED ENEMIES\000"
	.space	2
.LC4:
	.ascii	"AVOID BLUE PAROMAS\000"
	.space	1
.LC5:
	.ascii	"MOVE : <- and ->\000"
	.space	3
.LC6:
	.ascii	"SHOOT: X\000"
	.space	3
.LC7:
	.ascii	"PAUSE: ENTER\000"
	.space	3
.LC8:
	.ascii	"Hit BACKSPACE to go to main menu\000"
	.space	3
.LC9:
	.ascii	"Enemy Remaining:\000"
	.space	3
.LC10:
	.ascii	"Pasue\000"
	.space	2
.LC11:
	.ascii	"RETURN TO GAME\000"
	.space	1
.LC12:
	.ascii	"MAIN MENU\000"
	.space	2
.LC13:
	.ascii	"WIN\000"
.LC14:
	.ascii	"Press ENTER Button to go to menu\000"
	.space	3
.LC15:
	.ascii	"LOSE\000"
	.space	3
.LC16:
	.ascii	"%d\000"
	.ident	"GCC: (devkitARM release 50) 8.2.0"
