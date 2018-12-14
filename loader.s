.set MAGIC, 0X1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
	.long MAGIC
	.long FLAGS
	.long CHECKSUM


.section .text
.extern kernelMain
.global loader

loader:
	mov $kernel_stack, %esp
	push %eax
	push %ebx
	call kernelMain


_stop:
	cli
	hlt
	jmp _stop


.section .bss
.space 2*1924*1924;# 2MB
kernel_stack:
	
