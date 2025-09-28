	.text
	.file	"fib.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	leaq	12(%rsp), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movl	$.L.str.1, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %ebp
	movl	$.L.str.1, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	cmpl	$2, 12(%rsp)
	jl	.LBB0_3
# %bb.1:                                # %.preheader
	xorl	%eax, %eax
	movl	$1, %r14d
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, %ebx
	addl	%r14d, %ebx
	movl	$.L.str.1, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	incl	%ebp
	movl	%r14d, %eax
	movl	%ebx, %r14d
	cmpl	12(%rsp), %ebp
	jl	.LBB0_2
.LBB0_3:
	xorl	%eax, %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d\n"
	.size	.L.str.1, 4

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
