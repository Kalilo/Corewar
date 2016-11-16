#This is a test file

.name       "test1"
.comment    "basic while loop, unfortunatly has bugs."

start:
	fork	%:l_call

save_live_command:
ld			%65486, r2 ; (00 00 ff ce)
ld			%50, r3 ; (00 00 00 32)
ld			%1, r4 ; (01)
st			r1, 6

loop:
	live	%1
	add		r4, r3, r3
	st		r2, 7
	ldi		%0, %-50, r5
	st		r3, 8
	sti		r5, 0, %50
	add		r4, r2, r2
	ld		%0, r15
	zjmp	%:loop

l_call:
	st		r1, 6
	live	%0
	fork	%:end
	st		r1, 6
	live	%0
	fork	%:l_call

live:
	st		r1, 6
	live	%0
	fork	%:live
	st		r1, 6
	live	%0
	fork	%:live
	st		r1, 6
	live	%0
	fork	%:live
	ld		%0, r15
	zjmp	%:live

end: