#This is a test file

.name       "test2"
.comment    "testing features"

pre:
	st		r1, r9
	st		r3, -4
	st		r9, 6
	live	%1
	fork	%:end

begin:
	st		r9, 6
	live	%1
	fork	%:begin
	fork	%:begin
	fork	%:begin
	st		r9, 6
	live	%1
	fork	%:begin
	fork	%:begin

spam:
	st		r9, 6
	live	%1
	st		r9, 6
	live	%1
	st		r9, 6
	live	%1
	st		r9, 6
	live	%1
	st		r9, 6
	live	%1

torpgeni:
	st		r9, 6

torpgen:
	live	%96824
	fork	%:torpgen

torpinit:
	ld		%0, r2
	ld		%4, r3
	ld		%96, r5
	sti		r9, %:torpchk, %1
	st		r9, 6

torpwrite:
torpl1:
	live	%8008135
	ldi		%:torpinit, r2, r4
	sti		r4, %100, r2
	add		r2, r3, r2
	ldi		%:torpinit, r2, r4
	sti		r4, %83, r2
	add		r2, r3, r2
torpchk:
	live	%89523
	xor		r2, r5, r15	
	zjmp	%62
torploop:
	ld		%0, r15
	zjmp	%:torpwrite

end:
	st		r9, 6
	live	%1
	fork	%:end
	st		r9, 6
	live	%1