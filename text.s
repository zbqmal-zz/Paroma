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
	.file	"text.c"
	.text
	.align	2
	.global	drawChar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r1
	mov	r9, r0
	mov	r8, r3
	ldr	ip, .L13
	add	r2, r2, r2, lsl #1
	sub	ip, ip, r1
	ldr	r7, .L13+4
	add	fp, r1, #6
	add	r10, ip, r2, lsl #4
.L2:
	add	r5, r10, r6
	mov	r4, #0
	b	.L4
.L3:
	add	r4, r4, #1
	cmp	r4, #8
	add	r5, r5, #6
	beq	.L12
.L4:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3
	add	r0, r9, r4
	mov	r2, r8
	mov	r1, r6
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #8
	add	r5, r5, #6
	bne	.L4
.L12:
	add	r6, r6, #1
	cmp	r6, fp
	bne	.L2
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	fontdata_6x8
	.word	setPixel
	.size	drawChar, .-drawChar
	.align	2
	.global	drawBigChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBigChar, %function
drawBigChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r1
	mov	r9, r0
	mov	r8, r3
	ldr	ip, .L26
	add	r2, r2, r2, lsl #1
	sub	ip, ip, r1
	ldr	r7, .L26+4
	add	fp, r1, #12
	add	r10, ip, r2, lsl #6
.L16:
	add	r5, r10, r6
	mov	r4, #0
	b	.L18
.L17:
	add	r4, r4, #1
	cmp	r4, #16
	add	r5, r5, #12
	beq	.L25
.L18:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L17
	add	r0, r9, r4
	mov	r2, r8
	mov	r1, r6
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #16
	add	r5, r5, #12
	bne	.L18
.L25:
	add	r6, r6, #1
	cmp	r6, fp
	bne	.L16
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	fontdata_12x16
	.word	setPixel
	.size	drawBigChar, .-drawBigChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L28
	mov	r7, r0
	mov	r4, r1
	mov	r6, r3
.L29:
	mov	r1, r4
	mov	r3, r6
	mov	r0, r7
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L29
.L28:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString, .-drawString
	.ident	"GCC: (devkitARM release 50) 8.2.0"
