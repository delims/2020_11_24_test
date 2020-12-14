	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function multstore
LCPI0_0:
	.quad	4623074495985101046     ## double 12.23
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_multstore
	.p2align	4, 0x90
_multstore:                             ## @multstore
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_mult2
	movsd	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	%rax, -32(%rbp)
	movabsq	$67253458655318289, %rax ## imm = 0xEEEEAA11111111
	movq	%rax, -40(%rbp)
	movsd	%xmm0, -48(%rbp)
	cvttsd2si	-48(%rbp), %ecx
	movl	%ecx, -52(%rbp)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
