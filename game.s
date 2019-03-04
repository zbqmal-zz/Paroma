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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #130
	mov	r5, #2
	mov	r4, #10
	mov	lr, #5
	mov	r2, #118
	mov	ip, #992
	mov	r0, #20
	ldr	r3, .L4
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #8]
	strh	ip, [r3, #28]	@ movhi
	str	r0, [r3, #32]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L8
	ldr	ip, .L8+4
	sub	sp, sp, #12
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L8+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	32767
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #1
	mov	r6, #4
	mvn	r5, #3
	mov	r2, #0
	mvn	r4, #1
	ldr	r0, .L14
	ldr	r3, .L14+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #200
.L11:
	str	r6, [r3, #20]
	str	r1, [r3, #24]
	str	r5, [r3]
	str	ip, [r3, #12]
	str	r4, [r3, #16]
	strh	r2, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	str	r1, [r3, #36]
	stmib	r3, {r2, lr}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L11
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L27
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L26
.L17:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L17
.L26:
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r5, .L27+4
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	ldr	r2, [r5, #24]
	ldr	r6, [r5]
	add	ip, r0, r3
	add	lr, r2, r2, lsr #31
	str	r6, [r0, r3]
	ldr	r2, [r5, #4]
	ldr	r3, [ip, #24]
	add	r2, r2, lr, asr r4
	add	r3, r3, r3, lsr #31
	sub	r3, r2, r3, asr r4
	str	r4, [ip, #32]
	str	r1, [ip, #36]
	str	r3, [ip, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L40
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L40+4
	bne	.L30
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L30
.L31:
	ldr	r3, .L40+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #32]
	beq	.L39
	ldr	r2, .L40+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L34
.L39:
	add	r3, r3, #1
.L33:
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L30:
	ldr	r3, .L40
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L31
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #24]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	b	.L31
.L34:
	cmp	r3, #19
	ble	.L39
	bl	fireBullet
	mov	r3, #1
	b	.L33
.L41:
	.align	2
.L40:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r2, [r0]
	ldr	r3, [r0, #20]
	add	r3, r2, r3
	cmp	r3, #0
	movle	r3, #0
	ldrgt	r3, [r0, #16]
	addgt	r2, r3, r2
	strgt	r2, [r0]
	strle	r3, [r0, #32]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L52
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L53
.L50:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L53:
	ldr	r2, .L54
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L54+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L50
.L52:
	ldr	r2, .L54
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L54+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	b	.L50
.L55:
	.align	2
.L54:
	.word	32767
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.global	__aeabi_i2d
	.global	__aeabi_d2iz
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L60
	ldr	r5, .L60+4
	ldr	r6, .L60+8
	ldr	fp, .L60+12
	ldr	r10, .L60+16
	ldr	r9, .L60+20
	ldr	r8, .L60+24
	ldr	r7, .L60+28
.L57:
	mov	r3, #10
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #4
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #2
	ldm	r6, {r2, r3}
	add	r0, r0, #10
	stmib	r4, {r0, r2, r3}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	mov	lr, pc
	bx	fp
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L60+32
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	mov	r3, #0
	mov	r1, #31
	mov	r2, #1
	str	r3, [r4, #36]
	ldr	r3, .L60+36
	str	r0, [r4, #16]
	strh	r1, [r4, #28]	@ movhi
	str	r2, [r4, #32]
	add	r4, r4, #40
	cmp	r4, r3
	bne	.L57
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	enemies
	.word	rand
	.word	player
	.word	__aeabi_i2d
	.word	pow
	.word	__aeabi_d2iz
	.word	1717986919
	.word	156180629
	.word	-1074790400
	.word	enemies+200
	.size	initEnemies, .-initEnemies
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #4]
	cmp	r3, #0
	sub	sp, sp, #20
	ldr	r2, [r0, #16]
	ble	.L64
	ldr	r1, [r0, #24]
	add	r1, r3, r1
	cmp	r1, #239
	ble	.L65
.L64:
	rsb	r2, r2, #0
	str	r2, [r0, #16]
.L65:
	mov	r5, r0
	mov	r7, #0
	add	r3, r3, r2
	ldr	r4, .L80
	str	r3, [r0, #4]
	ldr	r8, .L80+4
	ldr	r9, .L80+8
	add	r6, r4, #200
.L69:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L79
.L67:
	add	r4, r4, #40
	cmp	r4, r6
	bne	.L69
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L79:
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #20
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r9]
	subne	r3, r3, #1
	strne	r7, [r4, #32]
	strne	r3, [r9]
	strne	r7, [r5, #32]
	b	.L67
.L81:
	.align	2
.L80:
	.word	bullets
	.word	collision
	.word	enemiesRemaining
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L86
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L87
.L84:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L87:
	ldr	r2, .L88
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L88+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L84
.L86:
	ldr	r2, .L88
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L88+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	b	.L84
.L89:
	.align	2
.L88:
	.word	32767
	.word	drawRect
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #8
	bl	drawPlayer
	ldr	r0, .L99
	bl	drawBullet
	ldr	r0, .L99+4
	bl	drawBullet
	ldr	r0, .L99+8
	bl	drawBullet
	ldr	r0, .L99+12
	bl	drawBullet
	ldr	r0, .L99+16
	bl	drawBullet
	ldr	r0, .L99+20
	bl	drawEnemy
	ldr	r0, .L99+24
	bl	drawEnemy
	ldr	r0, .L99+28
	bl	drawEnemy
	ldr	r0, .L99+32
	bl	drawEnemy
	ldr	r0, .L99+36
	bl	drawEnemy
	ldr	r4, .L99+40
	ldr	r6, .L99+44
	add	r5, r4, #84
.L92:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L98
.L91:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L92
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L98:
	ldrh	r2, [r4, #16]
	ldr	r3, [r4, #12]
	str	r2, [sp]
	ldm	r4, {r0, r1, r2}
	mov	lr, pc
	bx	r6
	b	.L91
.L100:
	.align	2
.L99:
	.word	bullets
	.word	bullets+40
	.word	bullets+80
	.word	bullets+120
	.word	bullets+160
	.word	enemies
	.word	enemies+40
	.word	enemies+80
	.word	enemies+120
	.word	enemies+160
	.word	paromas
	.word	drawRect
	.size	drawGame, .-drawGame
	.align	2
	.global	initParomas
	.syntax unified
	.arm
	.fpu softvfp
	.type	initParomas, %function
initParomas:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #10
	ldr	r4, .L105
	ldr	r5, .L105+4
	ldr	r8, .L105+8
	ldr	r7, .L105+12
	add	r6, r4, #84
.L102:
	str	r9, [r4, #8]
	str	r9, [r4, #12]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r1, #31744
	smull	r3, ip, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #10
	str	r0, [r4, #4]
	strh	r1, [r4, #16]	@ movhi
	str	r2, [r4, #20]
	str	r2, [r4, #24]
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L102
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	paromas
	.word	rand
	.word	156180629
	.word	2114445439
	.size	initParomas, .-initParomas
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #130
	mov	r6, #118
	ldr	r2, .L111
	mov	r5, r7
	str	r7, [r2]
	str	r7, [r2, #8]
	mov	r7, #20
	mov	fp, #2
	mov	r10, #10
	mov	r9, #5
	mov	r8, #992
	mov	lr, r6
	mov	ip, #4
	mov	r3, #1
	mvn	r0, #3
	mov	r4, #0
	mvn	r1, #1
	str	r7, [r2, #32]
	ldr	r7, .L111+4
	str	fp, [r2, #16]
	str	r10, [r2, #20]
	str	r9, [r2, #24]
	strh	r8, [r2, #28]	@ movhi
	str	r6, [r2, #4]
	str	r6, [r2, #12]
	add	r2, r7, #200
.L108:
	str	ip, [r7, #20]
	str	r3, [r7, #24]
	str	r1, [r7, #16]
	strh	r4, [r7, #28]	@ movhi
	str	r4, [r7, #32]
	str	r3, [r7, #36]
	stm	r7, {r0, r4, r5, lr}
	add	r7, r7, #40
	cmp	r7, r2
	bne	.L108
	bl	initEnemies
	bl	initParomas
	mov	r1, #5
	ldr	r3, .L111+8
	ldr	r2, .L111+12
	str	r4, [r3]
	str	r1, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	player
	.word	bullets
	.word	isHitParoma
	.word	enemiesRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateParoma
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateParoma, %function
updateParoma:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #99
	movle	r3, #1
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	sub	sp, sp, #20
	strle	r3, [r0, #20]
	ble	.L115
	cmp	r3, #100
	beq	.L131
.L116:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L115
.L117:
	ldr	r3, [r5, #24]
	add	r3, r3, #1
	str	r3, [r5, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L115:
	ldr	r4, .L133
	ldr	r3, [r4, #32]
	cmp	r3, #0
	mov	r9, #1
	ldr	r7, .L133+4
	ldr	r8, .L133+8
	add	r6, r4, #200
	bne	.L132
.L119:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L117
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L119
.L132:
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r9, [r8]
	b	.L119
.L131:
	mov	r4, #0
	ldr	r3, .L133+12
	str	r4, [r0, #20]
	str	r3, [sp]
	ldr	r6, .L133+16
	ldm	r0, {r0, r1, r2, r3}
	ldr	r7, .L133+20
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r3, .L133+24
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r5]
	mov	lr, pc
	bx	r6
	ldr	r3, .L133+28
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #10
	str	r4, [r5, #24]
	str	r0, [r5, #4]
	b	.L116
.L134:
	.align	2
.L133:
	.word	bullets
	.word	collision
	.word	isHitParoma
	.word	32767
	.word	rand
	.word	drawRect
	.word	156180629
	.word	2114445439
	.size	updateParoma, .-updateParoma
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	mov	ip, #0
	ldr	r3, .L144
	add	r0, r3, #200
.L138:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L136
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	add	r2, r1, r2
	cmp	r2, #0
	ldrgt	r2, [r3, #16]
	addgt	r1, r2, r1
	strgt	r1, [r3]
	strle	ip, [r3, #32]
.L136:
	add	r3, r3, #40
	cmp	r0, r3
	bne	.L138
	ldr	r0, .L144+4
	bl	updateEnemy
	ldr	r0, .L144+8
	bl	updateEnemy
	ldr	r0, .L144+12
	bl	updateEnemy
	ldr	r0, .L144+16
	bl	updateEnemy
	ldr	r0, .L144+20
	bl	updateEnemy
	ldr	r0, .L144+24
	bl	updateParoma
	ldr	r0, .L144+28
	bl	updateParoma
	ldr	r0, .L144+32
	pop	{r4, lr}
	b	updateParoma
.L145:
	.align	2
.L144:
	.word	bullets
	.word	enemies
	.word	enemies+40
	.word	enemies+80
	.word	enemies+120
	.word	enemies+160
	.word	paromas
	.word	paromas+28
	.word	paromas+56
	.size	updateGame, .-updateGame
	.align	2
	.global	drawParoma
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawParoma, %function
drawParoma:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrh	r2, [r0, #16]
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	str	r2, [sp]
	ldr	r4, .L155
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	drawRect
	.size	drawParoma, .-drawParoma
	.comm	isHitParoma,4,4
	.comm	enemiesRemaining,4,4
	.comm	paromas,84,4
	.comm	enemies,200,4
	.comm	bullets,200,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
