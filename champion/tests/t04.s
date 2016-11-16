#This is a test file

.name       "test1"
.comment    "generates columns of live."


save_live_command:
	ld		%16777216, r2 ;live
	ld		%1879113778, r4 ; st 50 (70 01 00 32)
	ld		%33565698, r5 ; (02 00 2c 02)
	ld		%4096, r6 ; - inc value for r5
	ld		%1, r7 ; - inc value for r4
	st		r1, 6

start:
	live	%1
	add		r5, r6, r5 ; inc r5
	add		r4, r7, r4 ; inc r4
	st		r4, 11
	st		r5, 12
	st		r1, 50
	st		r2, 44
	ld		%0, r15
	st		r8, 50
	st		r9, 70
	zjmp	%:start