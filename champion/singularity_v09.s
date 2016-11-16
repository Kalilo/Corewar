#Copies it's self whilst hi-jacking opponents code.

.name "singularity v0.7"
.comment "The more it consumes, the more it is able to consume."

pre:
	st		r1, r2
	st		r3, -4

init:
	st		r2, 6
	live	%0
	ld		%4, r3
	ld		%2, r4
	ld		%2, r6
	ld		%:end, r5

split:		
	fork	%:start

copy:
	ldi		%:pre, r3, r7
	sti		r7, r5, %50
	add		r4, r3, r3
	add		r6, r5, r5
	st		r2, 6
	live	%1
	ld		%0, r15
	zjmp	%:copy

start:
	st		r2, 6
	live	%0
	fork	%:master
	st		r2, 6
	live	%0
	fork	%:copy2
	st		r2, 6
	live	%0
	fork	%:master
	st		r2, 6
	live	%0
	fork	%:init

copy_cat:
	st		r2, 6
	live	%0
	fork	%:master
	st		r2, 6
	live	%0
	fork	%:master
	st		r2, 6
	live	%0
	fork	%:master
	st		r2, 6
	live	%0
	fork	%:start
	st		r2, 6

master:
	st		r2, 6
	live	%0
	fork	%:start
	st		r2, 6
	live	%0
	fork	%:master
	st		r2, 6
	live	%0
	fork	%:master

mad_live:
	fork	%:mad_live
	st		r2, 6
	live	%0
	st		r2, 6
	live	%0
	st		r2, 6
	live	%0
	ld		%0, r15
	zjmp	%:mad_live

init2:
	ld		%4, r3
	ld		%2, r4
	ld		%240, r5
	ld		%2, r6

copy2:
	lldi	%:init, r3, r7
	sti		r7, r5, %50
	add		r4, r3, r3
	add		r6, r5, r5
	st		r2, 6
	live	%1
	ld		%0, r15
	zjmp	%:copy2

end:
	ld		%0, r15
	zjmp	%:split

