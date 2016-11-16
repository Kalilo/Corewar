#This is a test file

.name       "test1"
.comment    "ever so closer!"



start:
	st		r1, 6
	live	%0
	fork	%:start
	fork	%:f2

f1:
	st		r1, 6
	live	%0
	fork	%:p2

p1:
	st		r1, 6
	live	%0
	ld		%49, r3
	ld		%16777216, r4 ; live (01 00 00 00)
	ld		%0, r15
	zjmp	%:start_bot

p2:
	st		r1, 6
	live	%0
	ld		%50, r3
	ld		%1, r4 ; hardcoded p1
	ld		%0, r15
	zjmp	%:start_bot

f2:
	st		r1, 6
	live	%0
	fork	%:p4

p3:
	st		r1, 6
	live	%0
	ld		%54, r3
	ld		%192152576, r4 ; sti (0b 74 04 00)
	ld		%0, r15
	zjmp	%:start_bot

p4:
	st		r1, 6
	live	%0
	ld		%58, r3
	ld		%196608, r4 ; sti (00 03 00 00)
	ld		%0, r15
	zjmp	%:start_bot

start_bot:
	st		r1, 6
the_bot:
	live	%0
	sti		r4, 0, r3
#	zjmp	%-50

end: