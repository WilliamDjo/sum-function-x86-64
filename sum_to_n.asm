section .text
global sum_to_n

sum_to_n:
	push rbp
	mov rbp, rsp
	
	; if n <= 0, return 0
	cmp rdi, 0
	jle return_zero

	mov rax, 0 	; sum
	mov rcx, 1	; counter

loop_start:
	cmp rcx, rdi
	jg loop_end	; if counter > n, exit loop
	
	add rax, rcx	; sum = sum + counter
	
	inc rcx		; counter++
	
	jmp loop_start	; go back to start (loop) 

loop_end:
	jmp done

return_zero:
	mov rax, 0

done:
	pop rbp	
	ret
